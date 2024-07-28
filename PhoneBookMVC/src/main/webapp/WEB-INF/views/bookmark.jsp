<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북마크</title>
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

    h3 {
        margin-top: 50px;
        text-align: center;
        font-size: 2em;
    }

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
    i{
      	margin-left: -150px ;
    
    }

	div{
	    margin-left: 700px;
	
	}
    #total-link {
        margin-top: 20px;
        margin-right: 20px;
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
    <a href="list"><i class="fa-solid fa-list"></i> 전체 목록</a>
    <a href="blacklist"><i class="fa-solid fa-ban"></i > 차단 목록</a>
    <a href="bookmark"><i class="fa-solid fa-star"></i> 즐겨찾기</a>
    <a href="keypad"><i class="fa-solid fa-keyboard"></i> 키패드</a>
</div>

  <h3>즐겨찾기목록</h3>
  <hr>

  <c:if test="${!empty bookmark}">
    <table>
      <tr>
        <th></th>
        <th>이름</th>
        <th>나이</th>
        <th>직업</th>
        <th>전화번호</th>
        <th>즐겨찾기</th>
      </tr>	   
      <c:forEach items="${bookmark}" var="person">
        <tr>
          <td><img class="profile-image" src="${person.imageurl}" alt="Profile Image" onerror="this.src='https://mblogthumb-phinf.pstatic.net/MjAyMDA2MTBfMTY1/MDAxNTkxNzQ2ODcyOTI2.Yw5WjjU3IuItPtqbegrIBJr3TSDMd_OPhQ2Nw-0-0ksg.8WgVjtB0fy0RCv0XhhUOOWt90Kz_394Zzb6xPjG6I8gg.PNG.lamute/user.png?type=w800';"></td>
          <td><a href="upform?no=${person.no}">${person.name}</a></td>
          <td>${person.age}</td>
          <td>${person.job}</td>
          <td>${person.phone}</td>
          <td style="text-align: center;">
            <c:choose>
              <c:when test="${person.bookmark == 1}">
                <i class="fa-solid fa-star" style="color: gray;"></i>
              </c:when>
              <c:otherwise>
                <i class="fa-regular fa-star" style="color: gray;"></i>
              </c:otherwise>
            </c:choose> 
          </td>
        </tr>
      </c:forEach>		    
    </table>  
  </c:if>	  
  <c:if test="${empty bookmark}">  
    <p>즐겨찾는 사람이 없습니다.</p>
  </c:if>
  <br>
  <div>
<!--   <a id="total-link" href="blacklist">차단목록확인</a>
  <a id="total-link" href="list">전체목록확인</a> -->
  </div>
  
</body>
</html>
