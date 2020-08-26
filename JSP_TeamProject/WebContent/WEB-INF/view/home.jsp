<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>홈 화면</title>
    <style>
        .container {
            width: 100%; margin: 0 auto;
        }
        #logo{width: 300px;	}
        .container .header {
            width: 1100px; padding: 10px; height: 100px; margin: 0 auto;	
        }
        .container .header form {
            float: right;
        }
        .container .header #project {
            float: left; font-size: 1.6em; text-decoration: none;
            color: green;
        }
        .container .header #search {
            margin-right: 10px; clear: both;
        }
        .container .header #login {
            margin-right: 10px;
        }
        .container section {
            margin: 0 auto;
        }
        .box1, .box2, .box3 {
           margin:0 auto; width: 1200px; margin-bottom: 40px; padding: 5px;
        }
        .container section ul {
            list-style-type: none; height: 100px;
        }
        .container section ul li {
            float: left; margin: 20px; border: 1px solid black;
            padding: 10px;
        }
        #btn_login {
            text-decoration: none; color: black;
        }
        .naver{display: inline-block; width: 200px; text-align: center;
        	padding: 10px;}
        img{width: 180px;}
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
			<img alt="모두의 웹툰" src="https://raw.githubusercontent.com/truespring/Team_Project/master/logo.png?token=AP45MSJZTID3QDXF2C3KZSK7I2M7M" id="logo">            
            <!-- 사이트 대표 아이콘 홈으로 돌아오는 링크 -->
            <form action="" method="get" id="signin">
                <button>회원가입</button>
                <!-- 회원가입 버튼 -->
            </form>
            <form action="/Watcha/login.html" method="post" id="login">
                <button><a href="/Watcha/login.html" id="btn_login">로그인</a></button>
                <!-- 로그인 버튼 -->
            </form>
            <form action="" method="get">
                <input type="text" name="search" id="search" placeholder="웹툰, 작가를 검색하세요">
                <!-- 검색창 -->
            </form>
        </div>
        <section>
        	
            <div class="box1">
                <div class="web1">네이버웹툰 추천</div>
                <hr>
               	<c:forEach items="${list }" var="item">
                	<c:if test="${item.w_platform == 1}">
		               <div class="naver"><img src="${item.w_thumbnail}"><br>${item.w_title}</div>
	                </c:if>
               </c:forEach>
            </div>
            <div class="box2">
            	<div class="web2">카카오페이지 추천</div>
                <hr>
               	<c:forEach items="${list }" var="item">
                	<c:if test="${item.w_platform == 3}">
		               <div class="naver"><img src="${item.w_thumbnail}"><br>${item.w_title}</div>
	                </c:if>
               </c:forEach>
            </div>
            <div class="box3">
            	<div class="web3">레진코믹스 추천</div>
                <hr>
               	<c:forEach items="${list }" var="item">
                	<c:if test="${item.w_platform == 4}">
		               <div class="naver"><img src="${item.w_thumbnail}"><br>${item.w_title}</div>
	                </c:if>
               </c:forEach>
            </div>
        </section>
    </div>
    <img src="https://github.com/truespring/Team_Project/blob/master/logo.png?raw=true">
    <script>
    </script>
</body>
</html>