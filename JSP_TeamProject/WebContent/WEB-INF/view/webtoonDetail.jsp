<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Cute+Font&family=Noto+Sans+KR&family=Noto+Serif+KR:wght@600&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>웹툰 상세 페이지</title>
<style>
	.container {width: 100%; margin: 0 auto; font-family: 'Noto Serif KR', serif ;}
	#btn_login {text-decoration: none; color: black;}
	.detail {border: 1px solid black; margin: 0 auto; width: 1200px; padding: 10px; clear: both; position: relative;}
	#thumnail img {	border: 1px solid black;width: 200px;height: 200px;	margin: 20px;display: inline-block;}
	#title, #writer, #story, #platform {display: inline-block;position: absolute;}
	#title {left: 230px;top: 10px;}
	#writer {left: 230px;top: 40px;}
	#platform {	left: 230px;top: 70px;}
	#story {left: 230px;top: 100px;}
	.comment {border: 1px solid black; margin: 50px auto; width: 1200px; padding: 10px; }
	#cmtFrm, #comment {margin: 10px;}
	.star-box, #comment, #submit{text-align: center;}
	#comment {height: 60px;}
	#comment #cmt {width: 800px; height: 40px; padding: 5px;}
	.star {	display: inline-block;	width: 30px;height: 60px;cursor: pointer;}
	.star_left {background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat 0 0;background-size: 60px;	margin-right: -3px;}
	.star_right {background: url(http://gahyun.wooga.kr/main/img/testImg/star.png)	no-repeat -30px 0;	background-size: 60px;margin-left: -3px;}
	.star.on {background-image:	url(http://gahyun.wooga.kr/main/img/testImg/star_on.png);}
	#cmt_btn {margin: 10px; width: 300px; border: none; height: 50px; background-color: #d8b4b4; color: white;
			 font-size: 1.1em;}
			 
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
		<div class="detail">
			<div id="thumbnail">
				<img src="${data.w_thumbnail }">
			</div>
			<div id="title">${data.w_title }</div>
			<div id="writer">${data.w_writer }</div>
			<div id="story">${data.w_story}</div>
			<div id="platform">${data.w_plat_nm }</div>
		</div>
		<!-- 댓글 부분 -->
		<div class="comment">
			<form action="#" method="post" id="cmtFrm" onsubmit="return chk()">
				<div class="star-box">
					<span class="star star_left" onclick="score(0.5)"></span> <span class="star star_right" onclick="score(1)"></span>
					<span class="star star_left" onclick="score(1.5)"></span> <span class="star star_right" onclick="score(2)"></span>
					<span class="star star_left" onclick="score(2.5)"></span> <span class="star star_right" onclick="score(3)"></span>
					<span class="star star_left" onclick="score(3.5)"></span> <span class="star star_right" onclick="score(4)"></span>
					<span class="star star_left" onclick="score(4.5)"></span> <span class="star star_right" onclick="score(5)"></span>
					<input type="hidden" id="point" value="0.0" required>
				</div>
					<!-- 댓글 남기기 -->
				<div id="comment"><input type="text" id="cmt" placeholder="댓글을 남겨주세요"></div>
				<!-- 완료 후 보내기 -->
				<div id="submit"><input type="submit" id="cmt_btn" value="작성완료"></div>
			</form>
		</div>
	</div>
	<script>
		function score(star) { // 별점주기
			console.log('star : ' + star)
			point.value = parseFloat(star)
			console.log('point.value : ' + point.value)
		}
	
		function chk() {
			if (point.value <= 0) { // 별점 체크
				alert('별점을 입력해 주세요')
				return false
			} else if (cmtFrm.cmt.value <= 0) { // 댓글 체크
				alert('댓글을 작성해 주세요')
				cmtFrm.cmt.focus()
				return false
			}
		}
		$(".star").on('click', function() {
			var idx = $(this).index();
			$(".star").removeClass("on");
			for (var i = 0; i <= idx; i++) {
				$(".star").eq(i).addClass("on");
			}
		});
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
</body>
</html>