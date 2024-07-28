<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<title>Person 정보 수정</title>
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

    #upformtitle {
        margin-top: 50px;
        text-align: center;
        font-size: 2em;
    }

    form {
        width: 300px;
        background-color: #ffffff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    #profile-picture-container {
        text-align: center;
        margin-bottom: 20px;
    }

    #profile-picture {
        width: 150px;
        height: 150px;
        border-radius: 50%;
        background-color: #ddd;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 15px;
    }

    #profile-picture img {
        width: 100%;
        height: 100%;
        border-radius: 50%;
        object-fit: cover;
    }

    input[type="text"], input[type="hidden"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border-radius: 5px;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

    button {
        display: inline-block;
        background: black;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        border: none;
        border-radius: 5px;
        font-size: 1em;
        margin-top: 20px;
        margin-right: 10px;
        cursor: pointer;
    }

    button:hover {
        background: #333;
    }

    #button-container {
        display: flex;
        justify-content: right;
    }

    a {
        display: inline-block;
        background: black;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        font-size: 1em;
        margin-top: 0px;
        margin-left: 140px;
    }

    a:hover {
        background: #333;
    }
</style>
<script type="text/javascript">
    function remove() {
        location.href = 'delete?no=${person.no}';
    }

    function block() {
        // Redirect to block person endpoint
        location.href = 'block?no=${person.no}';
    }
</script>
</head>
<body>
  <h3 id="upformtitle">Person 정보 수정</h3>
  <hr>
  <!-- 프로필 이미지 컨테이너 추가 -->
  <div id="profile-picture-container">
    <img src="${person.imageurl}" alt="Profile Image" style="width: 100px; height: 100px; border-radius: 50%;" onerror="this.src='https://via.placeholder.com/150';">
  </div>
  

  <form method="post">
    <input type="hidden" name="no" value="${person.no}">
    <div style="display: flex; align-items: center;">
        <h3 for="name">이름</h3>
        <i id="star" class="fa-regular fa-star"></i>
    </div>
    <input type="text" id="name" name="name" value="${person.name}" readonly><br>
    <h3 for="age">나이</h3>
    <input type="text" id="age" name="age" value="${person.age}"><br>
    <h3 for="job">직업</h3>
    <input type="text" id="job" name="job" value="${person.job}"><br>
    <h3 for="phonenumber">전화번호</h3>
    <input type="text" id="phonenumber" name="phonenumber" value="${person.phonenumber}"><br>
    <input type="hidden" name="bookmark" id="bookmark" value="${person.bookmark}"><br>
    <div id="button-container">
      <button type="submit">수정</button>
      <button type="button" onclick="remove()">삭제</button>
      <button type="button" onclick="block()">차단</button>
    </div>
    <br>
    <a href="list">전체목록확인</a>
  </form>
  
  <script>
    document.getElementById('star').addEventListener('click', function() {
      this.classList.toggle('fa-regular');
      this.classList.toggle('fa-solid');

      var isSolidStar = this.classList.contains('fa-solid');
      document.getElementById('bookmark').value = isSolidStar ? "1" : "0";
    }); 
  </script>

</body>
</html>
