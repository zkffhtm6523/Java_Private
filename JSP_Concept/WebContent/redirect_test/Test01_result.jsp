<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	도착 페이지! (Test01_result.jsp) <br>
	user_age : <%= request.getAttribute("user_age") %>
	<!--  redirect는 파라미터나 인자 값을 전달하지 못한다 -->
</body>
</html>