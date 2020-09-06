<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
@font-face {font-family: 'GmarketSansMedium';src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');font-weight: normal;font-style: normal;}
    #container {width: 100%; height:1000px;  margin: 0 auto; font-family: 'GmarketSansMedium', serif ;}
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
	section {margin: 0 auto; clear: both;}
	section h1{margin-left: 20px;margin-top: 30px;}
	.indexBlock {margin:0 auto; width: 1200px; height : 260px; margin-bottom: 30px;position: relative;}
	img{width: 180px; height:160px; border-radius: 5%;}
	.imgBlock{display: inline-block; width: 200px; text-align: center;
		   margin-right: -20px; vertical-align: top; margin-left: 50px;}
	.imgBlock:hover{cursor: pointer;}
	.listBlock{vertical-align: top;}
	.material-icons{width: 50px; height: 30px; position: absolute; top: 130px; margin-left: 20px;}
	.material-icons:hover{cursor: pointer;}
</style>
<title>홈 화면</title>
</head>
<body>
	<div id="container">
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
							<img class="pImg" src="${loginUser.profile == null ? '/images/login_logo/default_image.jpg' : loginUser.profile}" alt="프로필 설정 가기">
						</div>
						<button id="myPage" onclick="moveToMyPage()">${loginUser.name}님</button>
						<button id="logout" onclick="moveToLogOut()">로그아웃</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	<section></section>
	</div>
	<script>
		function ToonVO(w_no, w_title, w_thumbnail, w_plat_no){
			this.w_no = w_no;
			this.w_title = w_title;
			this.w_thumbnail = w_thumbnail;
			this.w_plat_no = w_plat_no;
		}
		//HomeSer에서 EL식으로 값을 받아와 자바스크립트 각 배열에 넣어주기
    	var naverList = new Array();
    	var kakaoList = new Array();
    	var lezhinList = new Array();
    	var daumList = new Array();
    	var komikoList = new Array();
		//배열에 넣어주기 위한 JSTL For-Each문  
		<c:forEach items="${list}" var="item">
 			var toonVO = new ToonVO("${item.w_no}","${item.w_title}","${item.w_thumbnail}","${item.w_plat_no}")
			<c:choose>
				<c:when test="${item.w_plat_no == 1}">
    				naverList.push(toonVO)
    			</c:when>
				<c:when test="${item.w_plat_no == 2}">
    				daumList.push(toonVO)
    			</c:when>
				<c:when test="${item.w_plat_no == 3}">
    				kakaoList.push(toonVO)
    			</c:when>
				<c:when test="${item.w_plat_no == 4}">
    				lezhinList.push(toonVO)
    			</c:when>
				<c:when test="${item.w_plat_no == 5}">
    				komikoList.push(toonVO)
    			</c:when>
 			</c:choose>
    	</c:forEach>
    	
    	//함수 사용으로 인한 간단한 호출...이거만 있으면 됨!!!
	  	makeImage(naverList, "네이버 웹툰 추천",'네이버')
	  	makeImage(kakaoList, "카카오페이지 추천",'카카오')
	  	makeImage(lezhinList, "레진코믹스 추천",'레진')
	  	
	    function makeImage(list,title, result){
			//컨테이너 안 섹션 태그 만들기
		    let section = document.querySelector('section')
		    container.append(section)
		    //추천별 블록 만들기
		    let indexBlock = document.createElement('div')
		    indexBlock.classList.add('indexBlock')
		    section.append(indexBlock)
		    
	    	//추천별 블록->타이틀+구분선
		    let secTitle = document.createElement('h1')
		    secTitle.append(title)
		    indexBlock.append(secTitle) // 타이틀 이름 넣기  
		    indexBlock.append(document.createElement('hr'))
		
		    //배열이 담길 전체 박스
		    let listBlock = document.createElement('div')
		    indexBlock.append(listBlock)
		    listBlock.classList.add('listBlock')
		    //배열 인덱스 및 반복문 체크용
		    var index = 0;
	    	var chk = 0;
		    
		    //좌측 화살표 아이콘 집어넣기
		    var icons = document.createElement('span')
		    icons.classList.add('material-icons')
		    icons.innerHTML = 'keyboard_arrow_left'
	    	icons.addEventListener('click',function(){
	    		if(index-5 > 0){
	    		var imgBlock = document.createElement('div')
		         imgBlock.classList.add('imgBlock')
		         imgBlock.addEventListener('click',function moveToDetail() {
		            location.href = '/webtoon/detail?w_no='+list[index].w_no         
		         })
		         var img = document.createElement('img')
		         img.src = `\${list[index-6].w_thumbnail}`
		         imgBlock.append(img)
		         imgBlock.append(document.createElement('br'))
		         imgBlock.append(list[index-6].w_title)
		         icons.after(imgBlock)
		         index--;
		    	 listBlock.removeChild(listBlock.childNodes[6]); 
	    		}else{
	    			alert('처음입니다.')
	    		}
		    })	
		    listBlock.append(icons)
		    
		    //배열 담길 전체 박스에 이미지 박스 추가
	    	var chkChk = true;
		    while(chkChk){
		    	 if(chk >= 4){chkChk = false}
		         var imgBlock = document.createElement('div')
		         imgBlock.classList.add('imgBlock')
		         imgBlock.addEventListener('click',function moveToDetail() {
		            location.href = '/webtoon/detail?w_no='+list[index].w_no         
		         })
		         var img = document.createElement('img')
		         img.src = `\${list[index].w_thumbnail}`
		         listBlock.append(imgBlock)
		         imgBlock.append(img)
		         imgBlock.append(document.createElement('br'))
		         imgBlock.append(list[index].w_title)
		         chk++;
		         console.log('index : '+index)
		         index++;
		    }
		    console.log('index : '+index)
		    //우측 화살표 아이콘 만들기
		    var icons2 = document.createElement('span')
		    icons2.classList.add('material-icons')
		    icons2.innerHTML = 'keyboard_arrow_right'
		    icons2.addEventListener('click',function(){
		    	 if(list.length > index){
			    	 var imgBlock = document.createElement('div')
			         imgBlock.classList.add('imgBlock')
			         imgBlock.addEventListener('click',function moveToDetail() {
			            location.href = '/webtoon/detail?w_no='+list[index].w_no         
			         })
			         var img = document.createElement('img')
			         img.src = `\${list[index].w_thumbnail}`
			         imgBlock.append(img)
			         imgBlock.append(document.createElement('br'))
			         imgBlock.append(list[index].w_title)
			         icons2.before(imgBlock)
			         index++;
			    	 listBlock.removeChild(listBlock.childNodes[1]); 
		    	 }else{
		    		 if(confirm('추가 목록을 확인하시겠습니까?')){
		    			 location.href = '/searchResult?result='+result
		    		 }
		    	 }
		    })		   
		    listBlock.append(icons2)
	    }
	    //웹툰 디테일 창으로 넘어가기
	    function moveToDetail(w_no) {
    		location.href = '/webtoon/detail?w_no='+w_no
    	}
	  	//로그인으로 넘어가기
    	function moveToLogin() {
			location.href = '/login'
		}
    	//회원가입으로 넘어가기
    	function moveToJoin() {
			location.href = '/join'
		}
    	//검색결과로 넘어가기
    	function moveToResult() {
			if(event.keyCode == 13){
				var result = search.value
				location.href = '/searchResult?result='+result
			}
		}
    	//홈으로 가기
    	function goHome() {
    		location.href = '/home'
    	  }
    	//마이 페이지로 넘어가기
    	function moveToMyPage() {
			location.href = '/myPage?i_user=${loginUser.u_no}'
		}
    	//프로필로 넘어가기
    	function moveToProfile() {
			location.href = '/profile?i_user=${loginUser.u_no}'
		}
    	//로그아웃하기
    	function moveToLogOut() {
    		if(confirm('로그아웃 하시겠습니까?')){
	    		location.href = '/logout'
    		}
		}
    </script>
</body>
</html>