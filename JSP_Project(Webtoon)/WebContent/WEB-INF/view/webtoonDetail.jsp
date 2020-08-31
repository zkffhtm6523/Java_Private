<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>웹툰 상세 페이지</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
	     .container {
	     	width: 80%; margin: 0 auto;
	     }
	    .header #logo{
	    	width: 300px;   
	    }
	    .header {
	    	width: 1200px; padding: 10px; height: 50px; margin: 0 auto;
	    }
	    .header #search {
	   		margin-right: 10px;
	    }
	    .header #login {
	    	margin-right: 10px;
	    }
	    #logo{
	    	float: left; padding: 20px;
	     }
        .detail {
            border: 1px solid black; margin: 20px;
            position: relative;
            
        }
        #thumnail img {
            border: 1px solid black; width: 200px; height: 200px; margin: 10px;
            display: inline-block;
        }
        #title, #writer, #story, #platform {
            display: inline-block; position: absolute;
        }
        #title {
            left: 230px; top: 10px;
        }
        #writer {
            left: 230px; top: 40px;
        }
        #platform {
            left: 230px; top: 70px;
        }
        #story {
            left: 230px; top: 100px;
        }
        .comment {
            border: 1px solid black;
        }
        #score, #comment {
            margin: 10px;
        }
        #comment {
            height: 60px;
        }
        .star{
		  display:inline-block;
		  width: 30px;height: 60px;
		  cursor: pointer;
		}
		.star_left{
		  background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat 0 0; 
		  background-size: 60px; 
		  margin-right: -3px;
		}
		.star_right{
		  background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat -30px 0; 
		  background-size: 60px; 
		  margin-left: -3px;
		}
		.star.on{
		  background-image: url(http://gahyun.wooga.kr/main/img/testImg/star_on.png);
		}
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
        <div class="detail">
            <!-- 웹툰 썸네일 -->
            <div id="thumnail"><img src="${data.w_thumbnail }"></div>
            <div id="title">${data.w_title }</div>
            <div id="writer">writer</div>
            <div id="story">${data.w_story }</div>
            <div id="platform">${data.w_platform }</div>
        </div>
        <!-- 댓글 부분 -->
        <div class="comment">
        	<form action="#" method="post" id="cmtFrm" onsubmit="return chk()">
	            <div class="star-box">
					  <span class="star star_left"></span>
					  <span class="star star_right"></span>
					
					  <span class="star star_left"></span>
					  <span class="star star_right"></span>
					
					  <span class="star star_left"></span>
					  <span class="star star_right"></span>
					
					 <span class="star star_left"></span>
					 <span class="star star_right"></span>
					
					 <span class="star star_left"></span>
					 <span class="star star_right"></span>
				</div>
	            <div id="comment">
                    <!-- 댓글 남기기 -->
	                <textarea name="cmt" id="cmt" cols="60" rows="3" placeholder="댓글남기기"></textarea>
                </div>
                <!-- 완료 후 보내기 -->
                <div id="submit">
                    <input type="submit" id="cmt_sub_btn" value="작성완료">
                </div>
            </form>
        </div>
    </div>
    <script>
        function chk() {
            if(cmtFrm.score.value <= 0){
                alert('별점을 입력해 주세요')
                frm.score.focus()
                return false
            } else if(cmtFrm.cmt.value.length <= 0) {
                alert('댓글을 작성해 주세요')
                frm.cmt.focus()
                return false
            }
        } 
        $(".star").on('click',function(){
        	   var idx = $(this).index();
        	   $(".star").removeClass("on");
        	     for(var i=0; i<=idx; i++){
        	        $(".star").eq(i).addClass("on");
        	   }
        	 });
    </script>
</body>
</html>