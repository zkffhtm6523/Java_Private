<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String str = request.getParameter("food");
	String [] arr = request.getParameterValues("food"); //여러 개의 값이 들어왔을 때 
	//마우스 갖다 대면 설명 나옴. String 배열 타입
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	당신이 좋아하는 음식은 <br>
	<%for(int i = 0; i < arr.length; ++i){%>
		<%= arr[i] %> <br>
	<%} %>
	입니다.
	<%--배열을 사용하지 않으면 중복 선택 해도 한 개의 값만 받아옴.. --%>
	
</body>
</html>