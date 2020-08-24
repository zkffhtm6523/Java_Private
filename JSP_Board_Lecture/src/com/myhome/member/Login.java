package com.myhome.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myhome.dao.MemberDao;
import com.myhome.dto.MemberDto;

@WebServlet("/Login")
public class Login extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("user_id");
		String password = request.getParameter("user_password");
		
		MemberDao dao = new MemberDao();
		MemberDto dto = dao.select(id, password);
		
		boolean rememberMe = Boolean.parseBoolean(request.getParameter("remember_me"));
		if (rememberMe) {
			Cookie cookie = new Cookie("rememberId", id);
			cookie.setMaxAge(60 * 60 * 24 * 365);//1년
			cookie.setPath("/");
			response.addCookie(cookie);
		} else {	//체크가 안 되었다면, 기존에 있을 수 있는 쿠키를 삭제
			Cookie cookie = new Cookie("rememberId", null); //rememberId 임시 쿠키 만들기
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);//기존 rememberId 쿠키 덮어쓰기
		}
		
		if(dto != null){
			// request.setAttribute("nickname", dto.getNickname());
			HttpSession session = request.getSession();
			session.setAttribute("currentNickname", dto.getNickname());
		}
//		pageContext.forward("loginResultView.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("loginResultView.jsp");
		rd.forward(request, response);
		
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
