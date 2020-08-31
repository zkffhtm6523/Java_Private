<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <style>
        .container {
            width: 600px; margin: 30px auto;
            border: 1px solid black;
        }
        h1 {
            text-align: center;
        }
        .user_info {
            text-align: center;
        }
        #name, #pw, #pw2, #email {
            width: 300px; height: 30px; margin: 10px;
        }
        button {
            margin-bottom: 20px; margin-top: 10px; width: 310px; padding: 5px;
            font-size: 1.1em; border: none; background-color: #ccb2e5;
            color: white;
        }
        #birth {
            width: 220px; margin: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>모두의 웹툰 일원 되기</h1>
        <div class="user_info">
            <form action="">
                <input type="text" id="name" placeholder="이름" autofocus><br>
                <input type="password" id="pw" placeholder="비밀번호"><br>
                <input type="password" id="pw2" placeholder="비밀번호 확인"><br>
                <input type="email" id="email" placeholder="메일"><br>
              	  생년월일 <input type="date" id="birth"><br>
                <label><input type="radio" id="gender" name="gender" value="man">남자</label>
                <label><input type="radio" id="gender" name="gender" value="girl">여자</label><br>
                <button>가입하기</button>
            </form>
        </div>
    </div>
</body>
</html>