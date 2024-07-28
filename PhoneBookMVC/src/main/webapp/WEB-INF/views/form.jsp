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
    width: 300px;
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
}

input[type="text"], textarea {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    border-radius: 5px;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

textarea {
    height: 100px;
    resize: vertical;
}

#addbutton, #total, #black {
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
    justify-content: space-between;
    width: 100%;
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

<form method="post" enctype="multipart/form-data">
    <div id="profile-picture-container">
        <div id="profile-picture">
            <img id="profile-img" src="${person.profileimage}" alt="Profile Image" onerror="this.onerror=null; this.src='https://via.placeholder.com/200'">
        </div>
        <button id="upload-button" type="button">프로필 사진 선택</button>
        <input type="file" id="file-input" name="file" style="display:none;" accept="image/*">
    </div>

    <div>
        <i id="star" class="fa-regular fa-star"></i>
        <i id="block" class="fa-solid fa-toggle-on"></i>
    </div>
    <input type="text" name="name" placeholder="이름"><br>
    <input type="text" name="age" placeholder="나이"><br>
    <input type="text" name="job" placeholder="직업"><br>
    <input type="text" name="phonenumber" value="<%= phonenumber %>" placeholder="전화번호"><br>
    <input type="text" name="email" placeholder="이메일"><br>
    <textarea name="memo" placeholder="메모"></textarea><br>
    <input type="hidden" name="bookmark" id="bookmark" value="0">
    <input type="hidden" name="blacklist" id="blacklist" value="0">
    <input type="hidden" name="profileimage" id="profileimage" value="${person.profileimage}">

    <div id="button-container">
        <button type="submit" id="addbutton">추가하기</button>
        <a id="total" href="list">전체목록확인</a>
        <a id="black" href="blacklist">차단목록확인</a>
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
  
   <script>
    document.getElementById('block').addEventListener('click', function() {
      this.classList.toggle('fa-toggle-on');
      this.classList.toggle('fa-toggle-off');

      // Update the hidden input value based on the toggle state
      var isSolidBlock = this.classList.contains('fa-toggle-off');
      document.getElementById('blacklist').value = isSolidBlock ? "1" : "0";
    });
  </script>
  

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
            // 여기서 파일 이름을 저장하지 말고, 데이터 URL을 저장하면 더 좋을 수 있습니다.
            // document.getElementById('profileimage').value = e.target.result;
        };
        reader.readAsDataURL(file);
    }
});
</script>
</body>
</html>
