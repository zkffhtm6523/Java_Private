<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<style type="text/css">
@font-face {font-family: 'GmarketSansMedium';src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');font-weight: normal;font-style: normal;}
    .container {width: 100%; height:1000px;  margin: 0 auto; font-family: 'GmarketSansMedium', serif ;}
	.header {width: 1200px; padding: 10px; height: 80px; margin: 15px auto;}
	#logo{width: 250px; cursor: pointer; float: left; height: 80px; margin-left: 40px; z-index: 100%;}
	#search {margin: 20px 10px 10px 130px;width: 406px;height: 41px;background: #FFFFFF;padding-left: 30px; 
	padding-right:20px; border: 1px solid #4FA2C7;box-sizing: border-box;border-radius: 10px;}
	#login,#myPage {margin-right: 10px;background: #4FA2C7;border-radius: 10px;width: 98px;height: 41px;color: white; font-family: 'GmarketSansMedium', serif ;border: none;
	position: absolute; right: 200px; top: 20px;}
    #signin,#logout { background: #4FA2C7;border-radius: 10px;width: 98px;height: 41px;color: white; font-family: 'GmarketSansMedium',serif;border: none;
    position: absolute; right: 100px; top: 20px;}
	#btn_login {text-decoration: none; color: black;}
	#myPage{position: absolute; right: 200px; top: 20px;}
	#logout{position: absolute; right: 100px; top: 20px;}
	.topMenu{position: relative;}
	.containerPImg {
		display: inline-block;	
		width: 40px;
		height: 40px;
	    border-radius: 50%;
	    overflow: hidden;
	    position: absolute;
	    top: 20px;
	    right: 320px;
	}
	.containerPImg:hover{cursor: pointer;}	
	.pImg {
		object-fit: cover;	
		height: 100%;
		width: 100%;
	}
	button:hover {cursor: pointer;}
</style>
</head>
<body>
<div class="container">
		<div class="header">
			<div class="topMenu">
			<img alt="모두의 웹툰" src="/images/logo2.png" id="logo" onclick="goHome()">
				<input type="search" id="search" placeholder="웹툰, 작가를 검색하세요" onkeydown="moveToResult()">
				<c:choose>
					<c:when test="${loginUser.name == null}">
						<button id="login" onclick="moveToLogin()">로그인</button>
						<button id="signin" onclick="moveToJoin()">회원가입</button>
					</c:when>
				<c:otherwise>
					<div class="containerPImg" onclick="moveToProfile()">
						<img class="pImg" src="${loginUser.profile}" alt="프로필 설정 가기">
					</div>
					<button id="myPage" onclick="moveToMyPage()">${loginUser.name}님</button>
					<button id="logout" onclick="moveToLogOut()">로그아웃</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
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
function moveToMyPage() {
	location.href = '/myPage?i_user=${loginUser.u_no}'
}
function moveToProfile() {
	location.href = '/profile?i_user=${loginUser.u_no}'
}
function moveToLogOut() {
	if(confirm('로그아웃 하시겠습니까?')){
		location.href = '/logout'
	}
}
</script>
</html>