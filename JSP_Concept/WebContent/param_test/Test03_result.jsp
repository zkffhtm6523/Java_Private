<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파라미터 이름을 얻어오고 싶다! ..설명란에 클래스와 리턴타입을 그래도 사용하기.
	Enumeration<String> names = request.getParameterNames();
	//Enumeration은 배열같음.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%while(names.hasMoreElements()){ %>
		<%= names.nextElement() %><br>
	<%} %>
</body>
</html>