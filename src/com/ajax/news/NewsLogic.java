package com.ajax.news;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class NewsLogic {
	Logger logger = Logger.getLogger(NewsLogic.class);
	/*******************************************************************************
	 * 
	 * @param i : 뉴스번호
	 * @return List<Map<>> : 전체 뉴스 목록 담기 
	 *******************************************************************************/
	public List<Map<String, Object>> getNewsList(int i) {
		logger.info("getNewsList 호출 성공");
		List<Map<String, Object>> newsList = null;
		return newsList;
	}
	public int newsInsert(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int newsUpdate(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int newsDelete(int n_no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
