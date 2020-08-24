package com.myhome.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action { //Model 구현 시 execute()를 오버라이드해서 사용한다
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
} //리턴 자료형이 ActionForward 
//추상메소드 하나만 들어가있다.