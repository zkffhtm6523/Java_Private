package com.myhome.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.Action;

import com.myhome.board.action.ActionForward;
import com.myhome.board.action.BoardListAction;
import com.myhome.board.action.BoardWriteAction;

@WebServlet("*.do") // *do로 끝나는 모든 것을 서블릿으로 요청하겠다
public class Controller extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// URI에서 사용자가 요청한 페이지 추출
		String requestURI = request.getRequestURI(); // 요청된 URI(주소) : "/myhome/board/BoardList.do"
		int lstIndex = requestURI.lastIndexOf("/") + 1; // 13 + 1 --> 14
		//마지막 슬레쉬가 몇 번에 위치하니? ->그래서 BoardList.do를 추출하기 위해서 위치 구하기
		String requestPage = requestURI.substring(lstIndex); // "BoardList.do"

		System.out.println("requestURI : " + requestURI); // "/myhome/board/BoardList.do"
		System.out.println("requestPage : " + requestPage); // "BoardList.do"

		Action action = null;
		ActionForward actionForward = null;
		try {
			if (requestPage.equals("BoardList.do")) {
				action = (Action) new BoardListAction();
				actionForward = ((BoardListAction) action).execute(request, response);
				// nextPath : "BoardListView.do"
				// isRedirect : false
			} else if (requestPage.equals("BoardListView.do")) {
				actionForward = new ActionForward();
				actionForward.setNextPath("boardListView.jsp");
				actionForward.setRedirect(false);
				// nextPath : "boardListView.jsp"
				// isRedirect : false
			} else if (requestPage.equals("BoardWriteForm.do")) {
				actionForward = new ActionForward();
				actionForward.setNextPath("boardWriteView.jsp");
				actionForward.setRedirect(false);
			} else if (requestPage.equals("BoardWrite.do")) {
				action = (Action) new BoardWriteAction();
				actionForward = ((BoardListAction) action).execute(request, response);
			} else if (requestPage.equals("Result.do")) {
				actionForward = new ActionForward();
				actionForward.setNextPath("boardResultView.jsp");
				actionForward.setRedirect(false);
			}

			if (actionForward != null) {
				if (actionForward.isRedirect()) {
					response.sendRedirect(actionForward.getNextPath()); // nextPath로 redirect
				} else {
					request.getRequestDispatcher(actionForward.getNextPath()).forward(request, response);
					// nextPath로 redirect
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
