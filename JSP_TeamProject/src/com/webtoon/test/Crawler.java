package com.webtoon.test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawler {
	static String url = "https://comic.naver.com/webtoon/weekday.nhn";
	static Document doc = null;
	
	public static void main(String[] args) {
		List<String> list = new ArrayList<String>();
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Elements element = doc.select("div.list_area");
		
		Iterator<Element> ie1 = element.select("a.title").iterator();
		
		while(ie1.hasNext()) {
			list.add(ie1.next().text());
		}
	}
}
