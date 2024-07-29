<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체목록</title>
<style type="text/css">
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
    
            .menu-bar {
        width: 150%;
        background-color: #333;
        overflow: hidden;
    }

    .menu-bar a {
        float: left;
        display: block;
        color: white;
        text-align: center;
        padding: 20px 185px;
        text-decoration: none;
    }

    .menu-bar a:hover {
        background-color: #ddd;
        color: black;
    }
    
    #menu_list{
       background-color: #f5f5f5;
               color: black;
    }
    

    h3 {
        margin-top: 50px;
        text-align: center;
        font-size: 2em;
    }

/*     form {
        margin-bottom: 20px;
    } */

    input[type="text"] {
        padding: 10px;
        width: 300px;
        font-size: 1em;
        border-radius: 5px;
        border: 1px solid #ccc;
    }

    button {
        padding: 10px 15px;
        font-size: 1em;
        border-radius: 5px;
        border: none;
        background-color: #007BFF;
        color: white;
        cursor: pointer;
    }

    button:hover {
        background-color: #0056b3;
    }

    table {
        width: 80%;
        margin: 20px 0;
        border-collapse: collapse;
        background-color: #ffffff;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: gray;
        color: white;
        text-transform: uppercase;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    a {
        color: #3981E5;
        text-decoration: none;
    }

    a:hover {
/*         text-decoration: underline;
 */    }

    i {
        margin-left: -110px;
    }

    div {
        margin-left: 700px;
    }

    #total-link {
        margin-top: 20px;
        margin-right: 30px;
        padding: 10px 20px;
        background-color: black;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-size: 1em;
    }

    #total-link:hover {
        background-color: #333;
    }

    #form-link {
        margin-left: 715px; /* Adjusted margin */
        padding: 10px 20px;
        background-color: black;
        color: white;
        text-decoration: none;
        border-radius: 100px;
        font-size: 1em;
    }
    
        #form-link:hover {
        background-color: #333;
    }
    
        .profile-image {
        width: 30px; /* Size of the image */
        height: 30px; /* Size of the image */
        border-radius: 50%; /* Circle shape */
        object-fit: cover; /* Ensure the image covers the area */
    }
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
</head>
<body>

<div class="menu-bar">
    <a href="list" id=menu_list><i class="fa-solid fa-list"></i> 전체 목록</a>
    <a href="blacklist"><i class="fa-solid fa-ban"></i > 차단 목록</a>
    <a href="bookmark"><i class="fa-solid fa-star"></i> 즐겨찾기</a>
    <a href="keypad"><i class="fa-solid fa-keyboard"></i> 키패드</a>
</div>

  <h3>전체목록</h3>
  <hr>

 <form method="get" action="list">
    <input type="text" name="query" placeholder="이름이나 번호를 입력하세요" value="${param.query}">
    <button type="submit">검색</button>
    <a id="form-link" href="form">+</a>
    
    
</form>

  <c:if test="${!empty list}">
    <table>
      <tr>
        <th></th>
        <th>이름</th>
        <th>나이</th>
        <th>직업</th>
        <th>전화번호</th>
        <th>상태확인</th>
      </tr>	   
      <c:forEach items="${list}" var="person">
        <tr>
          <td><img class="profile-image" src="${person.imageurl}" alt="Profile Image" onerror="this.src='https://mblogthumb-phinf.pstatic.net/MjAyMDA2MTBfMTY1/MDAxNTkxNzQ2ODcyOTI2.Yw5WjjU3IuItPtqbegrIBJr3TSDMd_OPhQ2Nw-0-0ksg.8WgVjtB0fy0RCv0XhhUOOWt90Kz_394Zzb6xPjG6I8gg.PNG.lamute/user.png?type=w800';"></td>
          <td id="personname"><a href="upform?no=${person.no}">${person.name}</a></td>
          <td>${person.age}</td>
          <td>${person.job}</td>
          <td>${person.phone}</td>
          <td style="text-align: center;">
            <c:choose>
              <c:when test="${person.bookmark == 1}">
                <i class="fa-solid fa-star" style="color: gray;"></i>
              </c:when>
              <c:when test="${person.blacklist == 1}">
                <i class="fa-solid fa-ban" style="color: gray;"></i>
              </c:when>
            </c:choose> 
          </td>
        </tr>
      </c:forEach>		    
    </table>  
  </c:if>	  
  <c:if test="${empty list}" > 
    <img id="noimg" src="https://cdn.icon-icons.com/icons2/67/PNG/512/emptybox_vacio_13363.png"></img>
    <p>등록된 정보가 없습니다.</p>
  </c:if>
  <br>
  <div>
<!--   <a id="total-link" href="blacklist">차단목록확인</a>
  <a id="total-link" href="bookmark">즐겨찾기확인</a> -->
  </div>
  
</body>
</html>
