package com.myhome.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myhome.dao.MemberDao;

@WebServlet("/findid/findIdLoggic.jsp")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터를 꺼내서 그것들을
		// => DB의 member 테이블의 레코드로 추가 (회원 등록)
		// => 결과페이지(joinResultView.jsp)로 페이지 이동 
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("user_email");
		MemberDao dao = new MemberDao();
		String id = dao.findIdbyEmail(email);
		
		if (id != null) {
			int index = id.length() -2;
			String tmpId = id.substring(0, 2);//0번 문자~ 2번 전까지
			
			for (int i = 0; i < index; ++i) {
				tmpId += "*";
			}
			id = tmpId;
			request.setAttribute("id", id);
		}
		//pageContext.forward("findIdResultView.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("fidnIdResultVidw.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
