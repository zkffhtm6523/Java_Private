<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모두의 웹툰(검색 결과)</title>
<style type="text/css">
   .container {width: 100%; margin: 0 auto;}
    .header #logo{width: 300px;   }
    .header {width: 1200px; padding: 10px; height: 50px; margin: 0 auto;}
    .header #search {margin-right: 10px;}
    .header #login {margin-right: 10px;}
    #logo{float: left; padding: 20px;}
    .topMenu{width:400px; padding: 20px; float: right; margin-right: 10px;}
    .topMenu #search{padding: 10px;}
    .topMenu button{padding:10px;}
    .container section {width: 1200px; padding: 10px; margin: 0 auto; clear: both;}
    h2{margin-top: 0px;}
    #webtoonContainer {width: 500px; border: 1px solid black; margin: 5px; padding: 10px;}
    ul {list-style-type: none;}
    ul li:nth-child(1) {float: left; padding: 30px;}
    ul{ clear: both;}
    .thumbnail{width: 200px; height: 200px;}
</style>
</head>
<body>
   <div class="container">
      <div class="header">
         <img alt="모두의 웹툰" id="logo" onclick="goHome()">            
            <!-- 사이트 대표 아이콘 홈으로 돌아오는 링크 -->
         <div class="topMenu">
            <input type="text" id="search" placeholder="웹툰, 작가를 검색하세요" onkeydown="moveToResult()">
               <button id="btn_login" onclick="moveToLogin()">로그인</button>
               <button id="signin" onclick="moveToJoin()">회원가입</button>
            </div>
        </div>
        <section>
           <div class="box1">
                <div class="web1"><h2>상위 검색 결과</h2></div>
                <hr>
         <c:forEach items="${result}" var="item">
            <div class="webtoonContainer">
               <ul class="itemRow">
                  <li><img class="thumbnail" src=" ${item.w_thumbnail }"></li>
                  <li>${item.w_title }</li>
                  <li></li>
                  <li>${item.w_story }</li>
                  <li>${item.w_platform }</li>
               </ul>
            </div>
         </c:forEach>
            </div>
        </section>
   </div>
   <script type="text/javascript">
	   function moveToResult() {
			if(event.keyCode == 13){
				var result = search.value
				console.log('result'+result)
				location.href = '/searchResult?result='+result
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