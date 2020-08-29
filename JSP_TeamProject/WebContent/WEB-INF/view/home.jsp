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
            width: 1200px; padding: 10px; height: 100px; margin: 0 auto;	
        }
        .container .header #search {
            margin-right: 10px; 
        }
        .container .header #login {
            margin-right: 10px;
        }
        .container section {
            margin: 0 auto; clear: both;
        }
        #logo{float: left; padding: 20px;}
        .topMenu{width:400px; padding: 20px; float: right; margin-right: 10px;
        }
        .topMenu #search{padding: 10px;}
        .topMenu button{padding:10px;}
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
			<img alt="모두의 웹툰" src="/images/logo.png" id="logo" onclick="goHome()">            
            <!-- 사이트 대표 아이콘 홈으로 돌아오는 링크 -->
			<div class="topMenu">
				<input type="text" id="search" placeholder="웹툰, 작가를 검색하세요" onkeydown="moveToResult()">
	            <button id="btn_login" onclick="moveToLogin()">로그인</button>
	            <button id="signin" onclick="moveToJoin()">회원가입</button>
            </div>
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
    <script>
    	function moveToLogin() {
			location.href = '/login'
		}
    	function moveToJoin() {
			location.href = '/join'
		}
    	function moveToResult() {
			if(event.keyCode == 13){
				var result = search.value
				location.href = '/searchResult?result='+result
			}
		}
    	function goHome() {
    		location.href = '/home'
    	  }
    </script>
</body>
</html>