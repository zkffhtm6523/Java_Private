<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sUserDab = request.getParameter("userDab");
	//답은 숫자인데?? getParameter는 리턴 타입을 String으로 반환
	int userDab = Integer.parseInt("sUserDab");
	int realDab = Integer.parseInt("RealDab");
	//삼항연산자로 대입해서 body 부분에 바로 출력할 수 있음.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(userDab == realDab){ %>
		정답!!
	<%}else{ %>
		땡..
	<%} %>
</body>
</html>