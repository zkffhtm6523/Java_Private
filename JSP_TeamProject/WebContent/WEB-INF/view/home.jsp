<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>홈 화면</title>
<style type="text/css">
	 @font-face {font-family: 'GmarketSansMedium';src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');font-weight: normal;font-style: normal;}
    .container {width: 100%; margin: 0 auto; font-family: 'GmarketSansMedium', serif ;}
	.header {width: 1440px; padding: 10px; height: 100px; margin: 60px auto;}
	.header #logo{width: 250px; cursor: pointer; float: left; height: 80px; margin-left: 80px;}
	.header #search {margin: 20px 10px 10px 320px;width: 476px;height: 41px;background: #FFFFFF;padding-left: 30px;border: 1px solid #4FA2C7;box-sizing: border-box;border-radius: 10px;}
	.header #login {margin-right: 10px;background: #4FA2C7;border-radius: 10px;width: 98px;height: 41px;color: white; font-family: 'GmarketSansMedium', serif ;border: none;}
    .header #signin { background: #4FA2C7;border-radius: 10px;width: 98px;height: 41px;color: white; font-family: 'GmarketSansMedium',serif;border: none;}
	.container section {margin: 0 auto; clear: both;}
	section h1{margin-left: 20px;}
	.box1, .box2, .box3 {margin:0 auto; width: 1200px; height : 320px; margin-bottom: 10px;}
	.container section ul {list-style-type: none; height: 100px;}
	.container section ul li {float: left; margin: 20px; border: 1px solid black;padding: 10px;}
	#btn_login {text-decoration: none; color: black;}
	.naver{display: inline-block; width: 200px; text-align: center;padding: 10px;
		  height: 260px; margin-top: 20px; margin-left: 13px;}
	img{width: 180px; border-radius: 5%;}
	section img, section span {cursor: pointer;}
	.paramValue{width: 180px; height: 50px;}
</style>
</head>
<body>
    <div class="container">
        <div class="header">
			<img alt="모두의 웹툰" 	src="/images/logo.png" id="logo" onclick="goHome()">            
            <!-- 사이트 대표 아이콘 홈으로 돌아오는 링크 -->
			<div class="topMenu">
				<input type="text" id="search" placeholder="웹툰, 작가를 검색하세요" onkeydown="moveToResult()">
	            <button id="login" onclick="moveToLogin()">로그인</button>
	            <button id="signin" onclick="moveToJoin()">회원가입</button>
            </div>
        </div>
        <section>
            <div class="box1">
                <div class="web1"><h1>네이버웹툰 추천</h1></div>
                <hr>
               	<c:forEach items="${list }" var="item">
                	<c:if test="${item.w_plat_no == 1}">
		               <div class="naver" onclick="moveToDetail(${item.w_no})"><img src="${item.w_thumbnail}"><br><div class="paramValue">${item.w_title}</div></div>
	                </c:if>
               </c:forEach>
            </div>
            <div class="box2">
            	<div class="web2"><h1>카카오페이지 추천</h1></div>
                <hr>
               	<c:forEach items="${list }" var="item">
                	<c:if test="${item.w_plat_no == 3}">
		               <div class="naver" onclick="moveToDetail(${item.w_no})"><img src="${item.w_thumbnail}"><br><div class="paramValue">${item.w_title}</div></div>
	                </c:if>
               </c:forEach>
            </div>
            <div class="box3">
            	<div class="web3"><h1>레진코믹스 추천</h1></div>
                <hr>
               	<c:forEach items="${list }" var="item">
                	<c:if test="${item.w_plat_no == 4}">
		               <div class="naver" onclick="moveToDetail(${item.w_no})"><img src="${item.w_thumbnail}"><br><div class="paramValue">${item.w_title}</div></div>
	                </c:if>
               </c:forEach>
            </div>
        </section>
        <footer>
        	
        </footer>
    </div>
    <script>
    	function moveToDetail(w_no) {
    		location.href = '/webtoon/detail?w_no='+w_no
    	}
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
