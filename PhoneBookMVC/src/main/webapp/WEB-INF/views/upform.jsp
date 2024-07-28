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
    
     input[type="text"], textarea {
        width: 100%;
        padding: 10px;
        margin: 5px 0;
        border-radius: 5px;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }
    
    textarea {
    height: 130px;
    resize: vertical;
	}
	
	addbutton, #total, #black {
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
    
    #edit,#remove{
    background: black;
    color: white;
    padding: 10px 30px;
    text-decoration: none;
    border: none;
    border-radius: 5px;
    margin-right: 20px;
    
    }
    


    #profile-picture-container {
        text-align: center;
        margin-bottom: 20px;
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

  

  <form method="post" enctype="multipart/form-data">
  	<!-- 프로필 이미지 컨테이너 추가 -->
  	<div id="profile-picture-container">
  		<div id="profile-picture">
    	<img id="profile-img" src="${person.imageurl}" alt="Profile Image" style="width: 200px; height: 200px; border-radius: 50%;" onerror="this.src='https://mblogthumb-phinf.pstatic.net/MjAyMDA2MTBfMTY1/MDAxNTkxNzQ2ODcyOTI2.Yw5WjjU3IuItPtqbegrIBJr3TSDMd_OPhQ2Nw-0-0ksg.8WgVjtB0fy0RCv0XhhUOOWt90Kz_394Zzb6xPjG6I8gg.PNG.lamute/user.png?type=w800';">
  		</div>
  	 	<button id="upload-button" type="button">프로필 사진 수정</button>
        <input type="file" id="file-input" name="file" style="display:none;" accept="image/*">
    </div>
  
    <div id="black_book">
        <i id="star" class="fa-regular fa-star"></i>
        <i id="block" class="fa-solid fa-user"></i>
    </div>
    
    <input type="hidden" name="no" value="${person.no}">
   
    <input type="text" id="name" name="name" value="${person.name}"><br>
    <input type="text" id="age" name="age" value="${person.age}"><br>
    <input type="text" id="job" name="job" value="${person.job}"><br>
    <input type="text" id="phone" name="phone" value="${person.phone}"><br>
    <input type="text" id="email" name="email" value="${person.email}"><br>
    <textarea id="memo" name="memo">${person.memo}</textarea><br>   
    <input type="hidden" name="bookmark" id="bookmark" value="${person.bookmark}"><br>
    <input type="hidden" name="blacklist" id="blacklist" value="${person.blacklist}"><br>
    <input type="hidden" name="profileimage" id="profileimage" value="${person.profileimage}">
    
    
    <div id="button-container">
      <button id="edit" type="submit">수정</button>
      <button id="remove" type="button" onclick="remove()">삭제</button>
    </div>
    <br>
  </form>
  
  <script>
    document.getElementById('star').addEventListener('click', function() {
      this.classList.toggle('fa-regular');
      this.classList.toggle('fa-solid');

      var isSolidStar = this.classList.contains('fa-solid');
      document.getElementById('bookmark').value = isSolidStar ? "1" : "0";
    }); 
  </script>
  
    <script>
    document.getElementById('block').addEventListener('click', function() {
      this.classList.toggle('fa-user');
      this.classList.toggle('fa-user-slash');

      // Update the hidden input value based on the toggle state
      var isSolidBlock = this.classList.contains('fa-user-slash');
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
