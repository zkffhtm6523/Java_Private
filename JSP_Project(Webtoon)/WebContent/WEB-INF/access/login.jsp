<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <style>
        .container {
            width: 600px; margin: 30px auto; border: 1px solid black;
        }
        h1 {
            text-align: center; margin-top: 40px;
        }
        .login_win {
            text-align: center; padding: 20px; margin: 10px;
        }
        #user_id, #user_pw {
            width: 300px; height: 30px; padding: 10px; margin: 10px;
        }
        #login_btn, #kakao, #naver, #facebook {
            width: 320px; padding: 10px; margin: 10px; border: none;
            color: white; font-size: 1.1em;
        }
        #login_btn {
            background-color: #ccb2e5;
        }
        #kakao {
            background-color: #fee800;
        }
        #naver {
            background-color: #03c75a;
        }
        #facebook {
            background-color: #1877f2;
        }
        a {
            text-decoration: none; color: white; 
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>모두의 웹툰과 함께하기</h1>
        <div class="login_win">
            <form action="" method="post">
                <input type="text" id="user_id" placeholder="아이디" autofocus><br>
                <input type="password" id="user_pw" placeholder="비밀번호"><br>
                <button id="login_btn"><a href="/Watcha/home.html">들어가기</a></button>
            </form>
            <div class="kakao"><button id="kakao">카카오로 들어가기</button></div>
            <div class="naver"><button id="naver">네이버로 들어가기</button></div>
            <div class="facebook"><button id="facebook">페이스북으로 들어가기</button></div>
        </div>
    </div>
</body>
</html>