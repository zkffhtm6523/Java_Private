<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/css/home.css">
<title>홈 화면</title>
</head>
<body>
    <div class="container">
        <div class="header">
			<img alt="모두의 웹툰" 	src="/images/logo.png" id="logo" onclick="goHome()">            
            <!-- 사이트 대표 아이콘 홈으로 돌아오는 링크 -->
			<div class="topMenu">
				<input type="search" id="search" placeholder="웹툰, 작가를 검색하세요" onkeydown="moveToResult()">
            <c:choose>
            	<c:when test="${loginUser.name == null}">
		            <button id="login" onclick="moveToLogin()">로그인</button>
		            <button id="signin" onclick="moveToJoin()">회원가입</button>
            	</c:when>
            	<c:otherwise>
            		<div class="containerPImg">
						<img class="pImg" src="${loginUser.profile}">
					</div>
            		<button id="myPage" onclick="moveToPage()">${loginUser.name}님</button>
		            <button id="logout" onclick="moveToLogOut()">로그아웃</button>
            	</c:otherwise>
            </c:choose>
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
    	function moveToPage() {
			location.href = '/myPage'
		}
    	function moveToLogOut() {
    		if(confirm('로그아웃 하시겠습니까?')){
	    		location.href = '/logout'
    		}
		}
    </script>
</body>
</html>
