<%@page import="com.webtoon.vo.BoardVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.webtoon.test.DbCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<%
	List<BoardVO> arr = new ArrayList<BoardVO>();
	
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = " select i_board, i_title, i_ctnt, i_author " 
			+ " from t_board order by i_board ";
	try{
		
	ps = DbCon.getCon().prepareStatement(sql);
	rs = ps.executeQuery();
	
	while(rs.next()){
		int i_board = rs.getInt("i_board");
		String i_title = rs.getNString("i_title");
		String i_ctnt = rs.getNString("i_ctnt");
		String i_author = rs.getNString("i_author");
		
		BoardVO vo = new BoardVO();
		vo.setI_board(i_board);
		vo.setI_title(i_title);
		vo.setI_ctnt(i_ctnt);
		vo.setI_author(i_author);
		
		arr.add(vo);
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) {try{rs.close();} catch(Exception e){}}
		if(ps != null) {try{ps.close();} catch(Exception e){}}
	}
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%for(BoardVO vo : arr){ %>
	<div>111
	<%=vo.getI_board() %>
	<%=vo.getI_title() %>
	<%=vo.getI_ctnt() %>
	<%=vo.getI_author() %>
	</div>
	<%} %>
</body>
</html>