package com.ureca.person.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ureca.person.dto.Person;
import com.ureca.person.model.service.PersonService;

import jakarta.servlet.http.HttpServletRequest;



@Controller //스프링 컨테이너로 객체 관리 받고 싶어요!!
@RequestMapping("/person")
public class PersonController  {
	
	@Autowired
	PersonService service;//service=null;기본값
	
    @Value("${file.upload-dir}")
    private String uploadDir;
    
    
//	@RequestMapping("/form") //요청URL정의   ==>1.
//	@RequestMapping(value = "/form", method = RequestMethod.GET) //요청URL정의   ==>1.
	@GetMapping("/form")
	public String form() {//입력폼 보이기
	  System.out.println(">>> GET form");
	  return "form";  //  "/WEB-INF/views/"+ "form"  + ".jsp"    ==> 5. forward이동	
	}
	

	@PostMapping("/form")
	public String regist(@ModelAttribute Person person, @RequestParam(value = "file", required = false) MultipartFile file, Model model) {
	    System.out.println(">>> POST form");
	    System.out.println("person>>>"+ person);
	    
	    if (file != null && !file.isEmpty()) {
	        try {
	            String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
	            File uploadDirectory = new File(uploadDir);
	            if (!uploadDirectory.exists()) {
	                uploadDirectory.mkdirs(); // 디렉토리 생성
	            }
	            File serverFile = new File(uploadDirectory.getAbsolutePath(), fileName);
	            file.transferTo(serverFile);

	            // 웹 접근 가능한 URL 설정
	            String fileAccessUrl = "/images/" + fileName; // 이 경로를 웹에서 접근할 수 있도록 설정
	            person.setImageurl(fileAccessUrl); // imageurl 필드에 URL 저장
	            System.out.println("File URL set in imageurl: " + person.getImageurl()); // 로그로 URL 확인
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }

	    try {
	        service.add(person);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return "redirect:list";
	}




    
    @PostMapping("/upload")
    public String handleFileUpload(@RequestParam("file") MultipartFile file) {
        // 파일 처리 로직
        if (file.isEmpty()) {
            return "redirect:form?error";
        }
        // 파일 저장 로직을 추가하세요
        return "redirect:list";
    }

	
	@GetMapping("/list")
	public String list(@RequestParam(value = "query", required = false) String query, Model model) {
	    try {
	        // Get the list of people
	        List<Person> list = service.readAll();

	        // Filter the list based on the query if it is provided
	        if (query != null && !query.trim().isEmpty()) {
	            String lowerCaseQuery = query.toLowerCase();
	            list = list.stream()
	                       .filter(person -> person.getName().toLowerCase().contains(lowerCaseQuery) ||
	                                         String.valueOf(person.getPhone()).contains(query))
	                       .collect(Collectors.toList());
	        }

	        // Add the filtered or complete list to the model
	        model.addAttribute("list", list);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return "list";
	}

	
	@GetMapping("/bookmark") //1.
	public String bookmark(Model model) { //DB목록출력
		//Model은 영역객체 중에 request와 같음
		
		  try {
		        List<Person> bookmark = service.getFavoritePersons(); // 즐겨찾기 목록 가져오기
		        model.addAttribute("bookmark", bookmark); // 모델에 저장
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return "bookmark"; // favorites.jsp로 이동
	}
	
	@GetMapping("/blacklist") //1.
	public String blacklist(Model model) { //DB목록출력
		//Model은 영역객체 중에 request와 같음
		
		  try {
		        List<Person> blacklist = service.getBlacklistPersons(); // 즐겨찾기 목록 가져오기
		        model.addAttribute("blacklist", blacklist); // 모델에 저장
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return "blacklist"; // favorites.jsp로 이동
	}
	
    
	
	@GetMapping("/upform")
	public String upform(@RequestParam("no") int no, Model model) {
	    try {
	        Person person = service.read(no); // 데이터베이스에서 Person 정보를 읽어옵니다.
	        model.addAttribute("person", person);
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return "errorPage"; // 오류 발생 시 에러 페이지로 리다이렉트
	    }
	    return "upform";
	}



	
	
	@PostMapping("/upform")
	public String modify(@ModelAttribute Person person, @RequestParam(value = "file", required = false) MultipartFile file, Model model) {
	    if (file != null && !file.isEmpty()) {
	        try {
	            String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
	            File uploadDirectory = new File(uploadDir);
	            if (!uploadDirectory.exists()) {
	                uploadDirectory.mkdirs();
	            }
	            File serverFile = new File(uploadDirectory.getAbsolutePath(), fileName);
	            file.transferTo(serverFile);

	            // 웹 접근 가능한 URL 설정
	            String fileAccessUrl = "/images/" + fileName;
	            person.setImageurl(fileAccessUrl);
	        } catch (IOException e) {
	            e.printStackTrace();
	            return "errorPage"; // 오류 페이지 반환
	        }
	    } else {
	        // 파일이 업로드되지 않았다면, 기존 이미지 URL을 유지
	        Person existingPerson = null;  // 변수를 null로 초기화
	        try {
	            existingPerson = service.read(person.getNo());
	            if (existingPerson != null) {
	                person.setImageurl(existingPerson.getImageurl());
	            } else {
	                model.addAttribute("error", "Cannot find existing person data");
	                return "errorPage"; // 적절한 오류 처리 및 페이지 반환
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            model.addAttribute("error", "Database error: " + e.getMessage());
	            return "errorPage"; // 데이터베이스 오류 페이지 반환
	        }
	    }

	    try {
	        service.edit(person);
	    } catch (SQLException e) {
	        e.printStackTrace();
	        model.addAttribute("error", "Database error on save: " + e.getMessage());
	        return "errorPage"; // 저장 오류 처리
	    }
	    return "redirect:list"; // 성공적으로 처리되면 수정 폼으로 리디렉트
	}

	@GetMapping("/delete")//  localhost:8080/person/delete?no=3
	public String remove(@RequestParam("no") int no) {//DB삭제 요청
		try {
			service.remove(no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:list";//삭제 결과를 list페이지로 확인
	}
	
	@GetMapping("/keypad")
	public String keypad() {//입력폼 보이기
	  System.out.println(">>> GET keypad form");
	  return "keypad";  //  "/WEB-INF/views/"+ "form"  + ".jsp"    ==> 5. forward이동	
	}
	
	
	
}

/*
<컨트롤러의 역할>
1.요청분석
2.데이터 얻어오기
3.모델호출
4.모델호출 결과를 (영역에)저장
5.페이지이동 ◀ 맨 마지막에 정의 :어떻게? 리턴으로

<요청 URL>
/person/form    GET
/person/form    POST
/person/list    GET
/person/upform  GET
/person/upform  POST
/person/delete  GET


 */
	





