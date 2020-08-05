<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	Test01 페이지는 보일까?
	<%
		request.setAttribute("user_age", 25);
		response.sendRedirect("Test01_result.jsp");
	%>
		<!--  redirect는 파라미터나 인자 값을 전달하지 못한다 -->
</body>
</html>