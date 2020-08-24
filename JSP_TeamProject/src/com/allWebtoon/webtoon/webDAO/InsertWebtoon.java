package com.allWebtoon.webtoon.webDAO;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import com.allWebtoon.webtoon.Lezhin;
import com.allWebtoon.webtoon.webVO.CartoonVO;

public class InsertWebtoon {
	public static void main(String[] args) throws UnsupportedEncodingException, IOException {
		ArrayList<CartoonVO> list = new ArrayList<CartoonVO>();
		//1. 레진 배열 넘기고 return 값 list에 담기
		list = Lezhin.getLezhin(list);
		
		//2.
	}
}
