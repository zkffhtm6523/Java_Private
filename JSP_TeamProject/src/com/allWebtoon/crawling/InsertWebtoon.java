package com.allWebtoon.crawling;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.json.simple.parser.ParseException;

public class InsertWebtoon {
	public static void main(String[] args) throws UnsupportedEncodingException, IOException, ParseException {
//		ArrayList<WebtoonVO> list = new ArrayList<WebtoonVO>();
//		
//		//1. 레진 데이터 DB 담기
//		list = Lezhin.getLezhin(list);
//		for (int i = 0; i < list.size(); i++) {
//			WebtoonDAO.insWebtoonList(list.get(i));
//		}
		//레진 값 담기 완료(레진 웹 사이트 136개 확인 완료 및 DB 값 확인 완료)
		
		//2. 네이버 데이터 DB 담기
//		list = Naver.getNaver(list);
//		for (int i = 0; i < list.size(); i++) {
//		WebtoonDAO.insWebtoonList(list.get(i));
//		}
		
		//3. 카카오 데이터 DB 담기
//		list = Kakao.getKakao();
//		for (int i = 0; i < list.size(); i++) {
//		WebtoonDAO.insWebtoonList(list.get(i));
//		}
	}
}
