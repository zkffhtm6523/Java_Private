package com.myhome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.myhome.dto.BoardDto;

public class BoardDao {
	//되게 신기한 패턴, 하나의 객체를 만들기 위해서.
	private static BoardDao dao;
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;
	private static DataSource ds;
	static {
		try {
			System.out.println("start DBCP!");
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	//싱글톤 패턴.. 매번 객체 생성을 하는 게 아니고, 필요할 때마다 가져다 씀.
	private BoardDao() {} //생성자를 아무도 생성할 수 없게 private 선언
	public static BoardDao getInstance() {
		//객체가 null, 즉 없을 때는 만들어내자.
		if (dao == null) {
			dao = new BoardDao();
		}
		return dao; //주소값만 리턴해라.
	}
	// close하는 메소드1 - 매번 try-catch문으로 닫아줘야 했었음, 불편해서 메소드로 만들어버림
	//3개가 모두 사용되었을 때를 대비해서 만듬
	private static void close(Connection con, PreparedStatement ps, ResultSet rs) {
		try {
			if(rs != null) {
				rs.close();
			}
			if(ps != null) {
				ps.close();
			}
			if(con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//close하는 메소드2, 메소드 오버로딩
	//2개만 사용되었을 때를 대비해서 만듬
	private static void close(Connection con, PreparedStatement ps) {
		close(con,ps,null);
	}
	//게시글 추가 메소드
	public boolean insert(BoardDto dto) {
		boolean result = false;
		sql = "INSERT INTO board VALUES( board_seq.NEXTVAL, ?, ?, ?, ?, 0, SYSDATE)";
										//글 번호는 시퀀스가 알아서 해줌//글제목, 글본문, 작성자id, 작성자 nick
		try {
			con = ds.getConnection(); //데이터 소스에 커넥션을 빌려서 con에 대입
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setString(3, dto.getWriter());
			ps.setString(4, dto.getNickname());
			result  = ps.executeUpdate() == 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps);
		}
		return result;
	}
	
	//게시글 목록 메소드
	public ArrayList<BoardDto> getList(){
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		BoardDto dto = null;
		sql = "SELECT num, title, content, nickname, hit, regdate FROM board ORDER BY regdate DESC";
		
		try { 
			con = ds.getConnection(); // DBMS 연결
			ps = con.prepareStatement(sql); //쿼리문 연결
			rs = ps.executeQuery(); //쿼리문 실행
			while (rs.next()) { //줄 추가
				dto = new BoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setNickname(rs.getString("nickname"));
				dto.setHit(rs.getInt("hit"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto); //배열에 넣어줌
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		}
		return list.isEmpty() ? null : list;
	}
	// 게시글 본문 조회 메소드
	public BoardDto select(int num) { //매개변수로 글번호가 들어감
		BoardDto dto = null;
		sql = "SELECT * FROM board WHERE nul = ?";
		
		try {
			con = ds.getConnection(); // DBMS 연결
			ps = con.prepareStatement(sql); //쿼리문 연결
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new BoardDto(); //식판에 가져오고
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("content"));
				dto.setWriter(rs.getString("writer"));
				dto.setNickname(rs.getString("nickname"));
				dto.setHit(rs.getInt("hit"));
				dto.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		}
		return dto;
	}
	
	//게시글 수정 메소드(글 제목 혹은 글 내용 수정)
	public boolean update(int num, String newTitle, String newContent) {
		boolean result = false;
		sql = "UPDATE board SET title = ?, content = ? WHERE num = ?";
		
		try {
			con = ds.getConnection(); // DBMS 연결
			ps = con.prepareStatement(sql); //쿼리문 연결
			ps.setString(1, newTitle);
			ps.setString(2, newContent);
			ps.setInt(3, num);
			result = ps.executeUpdate() == 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		}
		return result;
	}
	public boolean delete(int num) {
		boolean result = false;
		sql = "DELETE FROM board WHERE num = ?";
		
		try {
			con = ds.getConnection(); // DBMS 연결
			ps = con.prepareStatement(sql); //쿼리문 연결
			ps.setInt(1, num);
			result = ps.executeUpdate() == 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		}
		return result;
	}
	//조회수 1 증가 메소드
	public boolean updateHit(int num) {
		boolean result = false;
		sql = "UPDATE board SET hit = hit + 1 WHERE num = ?";
		try {
			con = ds.getConnection(); // DBMS 연결
			ps = con.prepareStatement(sql); //쿼리문 연결
			ps.setInt(1, num);
			result = ps.executeUpdate() == 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		}
		return result;
	}
	
}
