<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 연략처</title>
<style>
#formtitle{
	margin-bottom: 20px; 
	font-size: 2em; 
}
</style>
</head>
<body>
  <h3 id="formtitle">새로운 연락처</h3>
  <% 
    String phonenumber = request.getParameter("phonenumber");
    if (phonenumber == null) {
      phonenumber = "";
    }
  %>
  
  <form method="post">
  	<h3>이름</h3>
    <input type="text" name="name"><br>
    <hr>
    <h3>나이</h3>
    <input type="text" name="age"><br>
    <hr>
    <h3>직업</h3>
    <input type="text" name="job"><br>
    <hr>
    <h3>전화번호</h3>
    <input type="text" name="phonenumber" value="<%= phonenumber %>"><br>
   <button>추가하기</button>
  </form>
  <br>
  <a href="list">사람목록보기</a>
</body>
</html>
