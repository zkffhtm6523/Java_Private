<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String s = request.getParameter("aa");
	// 아무거나에 "aa"라는 이름표도 같이 따라간다.
	String ss = request.getParameter("Aa");
	// 하단에 입력받은 값 입력을 s만 했으므로 null이 나온다.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	입력받은 값 : <%= s %>
</body>
</html>