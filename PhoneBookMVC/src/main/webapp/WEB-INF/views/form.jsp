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
}

#formtitle { 
    margin-top: 100px; 
    text-align: center;
    font-size: 2em; 
}

form {
    width: 300px;
}

#star {
    cursor: pointer;
    font-size: 1.5em;
    color: gray;
    margin-left: 230px;
    margin-top: -10px;
    
    }

input[type="text"] {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    border-radius: 5px;
    border: 1px solid #ccc;
}

#addbutton, a {
    display: inline-block;
    background: black;
    color: white;
    padding: 10px 20px;
    text-decoration: none;
    border: none;
    border-radius: 5px;
    font-size: 1em;
    margin-top: 70px;
}

a {
    background: black;
    color: white;
    margin-right: 20px;
}

#addbutton {
    margin-right: 20px;
}

#button-container {
    margin-left: -25px;
    display: flex;
    justify-content: flex-start;
    width: 450px;
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
  
  <form method="post">
    <div style="display: flex; align-items: center;">
      <h3>이름</h3>
      <i id="star" class="fa-regular fa-star"></i>
    </div>
    <input type="text" name="name"><br>
    <h3>나이</h3>
    <input type="text" name="age"><br>
    <h3>직업</h3>
    <input type="text" name="job"><br>
    <h3>전화번호</h3>
    <input type="text" name="phonenumber" value="<%= phonenumber %>"><br>
    <!-- Hidden input to store the bookmark status -->
    <input type="hidden" name="bookmark" id="bookmark" value = "0"><br>
    <div id="button-container">
        <button type="submit" id="addbutton">추가하기</button>
        <a id="total" href="list">전체목록확인</a>
        <a id="black" href="list">차단목록확인</a>     
    </div>
  </form>
  
  <script>
    document.getElementById('star').addEventListener('click', function() {
      this.classList.toggle('fa-regular');
      this.classList.toggle('fa-solid');

      // Update the hidden input value based on the star's state
      var isSolidStar = this.classList.contains('fa-solid');
      document.getElementById('bookmark').value = isSolidStar ? "1" : "0";
    }); 
  </script>
</body>
</html>
