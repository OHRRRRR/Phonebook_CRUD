<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<title>새로운 연락처 등록</title>
<style>
body {
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: #f5f5f5;
    font-family: Arial, sans-serif;
}

#formtitle { 
    margin-top: 50px;
    text-align: center;
    font-size: 2em;
}

form {
    width: 350px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

#star, #block {
    cursor: pointer;
    font-size: 1.5em;
    color: gray;
    margin-top: -5px;
    margin-bottom: 20px;
    margin-left: 10px
    
}

#star:hover, #block:hover{
    color: #333;
}

input[type="text"], textarea {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    border-radius: 5px;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

input.invalid {
      width: 100%;
    padding: 10px;
    margin: 5px 0;
    border-radius: 5px;
    border: 1px solid red;
    box-sizing: border-box;
}


input.valid {
    border: 1px solid #ccc;
    box-sizing: border-box;
}



textarea {
    height: 130px;
    resize: vertical;
}

 #black {
    background: black;
    color: white;
    padding: 10px 20px;
    text-decoration: none;
    border: none;
    border-radius: 5px;
    font-size: 1em;
    margin-top: 20px;
}

#button-container {
    display: flex;
    justify-content: center;
    width: 100%;
}

    
    #addbutton{
    background: gray;
    color: white;
    padding: 10px 30px;
    text-decoration: none;
    border: none;
    border-radius: 5px;
    margin-right: 20px;
    
    }
    
    #addbutton:hover{
        background: #333;
    
    }

#profile-picture-container {
    text-align: center;
    margin: 20px 0;
}

#profile-picture {
    width: 200px;
    height: 200px;
    border-radius: 50%;
    background-color: #ddd;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 15px;
}

#profile-picture img {
    width: 100%;
    height: 100%;
    border-radius: 50%;
    object-fit: cover;
}

#upload-button {
    color: black;
    text-decoration: none;
    border: none;
    align-items: center;
    margin-right: -5px;
    border-radius: 5px;
    
}
    #upload-button:hover {
        background-color: #333;
        color:white;
    }

</style>
</head>
<body>
<h3 id="formtitle">새로운 연락처 등록</h3>

  <% 
    String phonenumber = request.getParameter("phonenumber");
    if (phonenumber == null) {
      phonenumber = "";
    }
  %>

<form method="post" enctype="multipart/form-data" id="myform">
    <div id="profile-picture-container">
        <div id="profile-picture">
            <img id="profile-img" src="${person.imageurl}" alt="Profile Image" onerror="this.onerror=null; this.src='https://mblogthumb-phinf.pstatic.net/MjAyMDA2MTBfMTY1/MDAxNTkxNzQ2ODcyOTI2.Yw5WjjU3IuItPtqbegrIBJr3TSDMd_OPhQ2Nw-0-0ksg.8WgVjtB0fy0RCv0XhhUOOWt90Kz_394Zzb6xPjG6I8gg.PNG.lamute/user.png?type=w800'">
        </div>
        <button id="upload-button" type="button">프로필 사진 선택</button>
        <input type="file" id="file-input" name="file" style="display:none;" accept="image/*">
    </div>

    <div id="black_book">
        <i id="star" class="fa-regular fa-star"></i>
        <i id="block" class="fa-solid fa-user"></i>
    </div>
    
    <input type="text" name="name" placeholder="이름">
    <input type="text" name="age" placeholder="나이">
    <input type="text" name="job" placeholder="직업"><br>
    <input type="text" name="phone" value="<%= phonenumber %>" placeholder="전화번호" id="phonenumber">
    <input type="text" name="email" placeholder="이메일" id="email" ><br>
    <textarea name="memo" placeholder="메모"></textarea><br>
    <input type="hidden" name="bookmark" id="bookmark" value="0">
    <input type="hidden" name="blacklist" id="blacklist" value="0">
    <input type="hidden" name="profileimage" id="profileimage" value="${person.profileimage}">

    <div id="button-container">
        <button type="submit" id="addbutton">추가하기</button>
<!--         <a id="total" href="list">전체목록확인</a>
 -->    </div>
    <br>
</form>

<script>
    document.getElementById('star').addEventListener('click', function() {
    	if (document.getElementById('blacklist').value == 0 ){
     	 this.classList.toggle('fa-regular');
      	 this.classList.toggle('fa-solid');
    	}
      var isSolidStar = this.classList.contains('fa-solid');
      document.getElementById('bookmark').value = isSolidStar ? "1" : "0";
    }); 
  </script>
  
    <script>
    document.getElementById('block').addEventListener('click', function() {
    	if (document.getElementById('bookmark').value == 0 ){
    	      this.classList.toggle('fa-user');
    	      this.classList.toggle('fa-user-slash');
    	}
      // Update the hidden input value based on the toggle state
      var isSolidBlock = this.classList.contains('fa-user-slash');
      document.getElementById('blacklist').value = isSolidBlock ? "1" : "0";
    });
  </script>
  
  <!-- 파일이미지 주소 전달  -->
   <script>
	document.getElementById('upload-button').addEventListener('click', function() {
    document.getElementById('file-input').click();
	});

document.getElementById('file-input').addEventListener('change', function(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('profile-img').src = e.target.result;
            // document.getElementById('profileimage').value = e.target.result;
        };
        reader.readAsDataURL(file);
    }
});
</script>
  

<!-- 전화번호폼 로그 찍어봄  -->
<!--  <script>
 document.addEventListener('DOMContentLoaded', function() {
	    var form = document.getElementById('myform');
	    form.onsubmit = function() {
	        var phoneInput = document.getElementById('phonenumber');
	        console.log('Final phone number being sent:', phoneInput.value);
	        // 폼 데이터가 서버로 전송되는 것을 보려면 이 부분을 주석 처리하세요.
	        return true; // 이 부분을 false로 바꾸면 폼 제출이 차단됩니다, 디버깅을 위해 사용할 수 있습니다.
	    };
	});
 -->


<script>
document.getElementById('phonenumber').addEventListener('input', function(e) {
    var phone = document.getElementById('phonenumber');
    phone.className = phone.value.match(/^\d{10,11}$/) ? 'valid' : 'invalid';
});

document.getElementById('email').addEventListener('input', function(e) {
    var email = document.getElementById('email');
    email.className = email.value.match(/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/) ? 'valid' : 'invalid';
});

document.getElementById('myform').onsubmit = function(e) {
    var phone = document.getElementById('phonenumber');
    var email = document.getElementById('email');
    if (!phone.value.match(/^\d{10,11}$/) || !email.value.match(/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/)) {
        alert('형식에 맞게 입력해주세요.');
        e.preventDefault();
    }
};
</script>


    




</body>
</html>