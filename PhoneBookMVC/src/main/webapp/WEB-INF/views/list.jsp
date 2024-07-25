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

    h3 {
        margin-top: 50px;
        text-align: center;
        font-size: 2em;
    }

    form {
        margin-bottom: 20px;
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
        text-decoration: underline;
    }
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
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
</head>
<body>
  <h3>전체 목록</h3>
  <hr>

  <form method="get" action="list">
    <input type="text" name="query" placeholder="검색어를 입력하세요" value="${param.query}">
    <button type="submit">검색</button>
  </form>

  <c:if test="${!empty list}">
    <table>
      <tr>
        <th>번호</th>
        <th>이름</th>
        <th>나이</th>
        <th>직업</th>
        <th>전화번호</th>
        <th>즐겨찾기</th>
      </tr>	   
      <c:forEach items="${list}" var="person">
        <tr>
          <td>${person.no}</td>
          <td id = "personname"><a href="upform?no=${person.no}">${person.name}</a></td>
          <td>${person.age}</td>
          <td>${person.job}</td>
          <td>${person.phonenumber}</td>
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
  <c:if test="${empty list}">  
    <p>등록된 Person이 없습니다.</p>
  </c:if>
  <br>
  <div>
  <a id="total-link" href="blacklist">차단목록확인</a>
  <a id="total-link" href="bookmark">즐겨찾기확인</a>
  <a id="total-link" href="form">+</a>
  </div>
  
</body>
</html>
