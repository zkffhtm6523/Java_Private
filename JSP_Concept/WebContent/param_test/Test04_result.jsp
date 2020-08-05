<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
		//모든 파라미터를 받는 메소드
		Map<String, String[]> map = request.getParameterMap();
		//제네릭을 설정할 때 첫 번째는 key, 두 번째는 value
		//key : 파라미터 이름 / value : 파라미터의 값(들)
		Set<String> pNames = map.keySet();
		String[] pValues = null;
		for(String p : pNames){
			pValues = map.get(p);
			out.write("파라미터 명 : "+p+"<br>");
			out.write("파라미터 값 : ");
			for(String val : pValues){
				out.write(val + " ");
			}
			out.write("<br>");
		}
	%>
</body>
</html>