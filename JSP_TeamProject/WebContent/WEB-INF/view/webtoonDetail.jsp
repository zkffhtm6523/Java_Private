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
	#logo{width: 250px; cursor: pointer; float: left; height: 80px;}
	.header {width: 1200px; padding: 10px; height: 100px; margin: 0 auto;}
	.header #search {margin-right: 10px;}
	.header #login {margin-right: 10px;}
	.topMenu{width:400px; padding: 20px; float: right; margin-right: 10px; margin-top: 15px;}
	.topMenu #search{padding: 10px;}
	.topMenu button{padding:10px;}
	.container section {margin: 0 auto; clear: both;}
	#btn_login {text-decoration: none; color: black;}
	img{width: 180px; border-radius: 5%;}
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
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<img src="/images/logo.png" alt="모두의 웹툰" id="logo" onclick="goHome()">
			<!-- 사이트 대표 아이콘 홈으로 돌아오는 링크 -->
			<div class="topMenu">
				<input type="text" id="search" placeholder="웹툰, 작가를 검색하세요"
					onkeydown="moveToResult()">
				<button id="btn_login" onclick="moveToLogin()">로그인</button>
				<button id="signin" onclick="moveToJoin()">회원가입</button>
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
		function moveToResult() {
			if (event.keyCode == 13) {
				var result = search.value
				console.log('result' + result)
				location.href = '/searchResult?result=' + result
			}
		}
		function moveToLogin() {
			location.href = '/login'
		}
		function moveToJoin() {
			location.href = '/join'
		}
		function goHome() {
			location.href = '/home'
		}
	</script>
</body>
</html>