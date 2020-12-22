package com.ajax.news;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.ajax.member.MemberLogic;
import com.util.HashMapBinder;

public class FrontController extends HttpServlet {
	Logger logger = Logger.getLogger(FrontController.class);
	//insert here
	//forward, redirect
	//문제1.memGet과 doPost 모두 리턴타입이 void임에도 불구하고 처리된 결과를 jsp페이지에 유지해야 한다.
	//어떡하지?
	//:view.forward(req,res);
	//왜 forward하기 전에 setAttribute를 해야 하지?- 담기
	//담은 내용을 jsp에 유지해야 하므로 반드시 ???해야 한다.
	//String work = req.getParameter();
	/*******************************************************************************************
	 * 톰캣 서버로 부터 req 와 res를 주입 받아야 한다.
	 * 주입 받아야 사용할 수 있다.
	 ******************************************************************************************/
	public void doGet(HttpServletRequest req,HttpServletResponse res)
	throws ServletException,IOException
	{
		logger.info("doGet 호출 성공");
		MemberLogic memLogic = new MemberLogic();
		String work = req.getParameter("work");
		//URL를 통해서 업무에 대한 경우의 수를 나누어야 한다. 그럼 어떡하지?
		//전체 조회 일 때 - n개 rows - list.jsp
		if("login".equals(work)) {
			Map<String,Object> pMap = new HashMap<>();
			pMap.put("mem_id",req.getParameter("mem_id"));
			pMap.put("mem_pw",req.getParameter("mem_pw"));
			String mem_name = memLogic.login(pMap);
			req.setAttribute("mem_name", mem_name);
			//쿠키나 세션에 저장하기
			RequestDispatcher view = req.getRequestDispatcher("./loginAction2.jsp");
			view.forward(req, res);
		}
		else if("getNewsList".equals(work)) {
			List<Map<String,Object>> newsList = null;
			NewsLogic newsLogic = new NewsLogic();
			newsList = newsLogic.getNewsList(0);
			req.setAttribute("newsList", newsList);
			RequestDispatcher view = req.getRequestDispatcher("getNewsList.jsp");
			view.forward(req,res);
		}
		//상세 조회 일 때 - 한개 row - read.jsp 응답페이지가 다르니까 forward되는 페이지가 다르니까
		else if("getNewsDetail".equals(work)) {
			List<Map<String,Object>> newsList = null;
			NewsLogic newsLogic = new NewsLogic();
			int n_no = 0;
			n_no = Integer.parseInt(req.getParameter("n_no"));
			newsList = newsLogic.getNewsList(n_no);
			req.setAttribute("newsList", newsList);
			RequestDispatcher view = req.getRequestDispatcher("getNewsDetail.jsp");
			view.forward(req,res);			
		}
		//등록일때
		else if("newsInsert".equals(work)) {
			int result = 0;
			NewsLogic newsLogic = new NewsLogic();
			//사용자가 입력한 값 받아오기
			Map<String,Object> pmap = new HashMap<>();//사용자가 입력한 값 담기-공통코드 활용해 보기 실습
			HashMapBinder hmb = new HashMapBinder(req);
			hmb.bind(pmap);
			result = newsLogic.newsInsert(pmap);//배달사고가 나지 않도록 주의할것.
			if(result == 1) {//등록에 성공했을 때
				res.sendRedirect("crudNews.mem?work=getNewsList");
			}else {//등록에 실패했을 때
				res.sendRedirect("crudNewsError.jsp");
			}
		}		
		//수정 일때
		else if("newsUpdate".equals(work)) {
			int result = 0;
			NewsLogic newsLogic = new NewsLogic();
			//사용자가 입력한 값 받아오기
			Map<String,Object> pmap = new HashMap<>();//사용자가 입력한 값 담기-공통코드 활용해 보기 실습
			HashMapBinder hmb = new HashMapBinder(req);
			hmb.bind(pmap);
			result = newsLogic.newsUpdate(pmap);//배달사고가 나지 않도록 주의할것.			
			res.sendRedirect("crudNews.mem?work=getNewsList");
		}		
		//삭제 일때
		else if("newsDelete".equals(work)) {
			int result = 0;
			NewsLogic newsLogic = new NewsLogic();
			//사용자가 입력한 값 받아오기
			int n_no = 0;
			n_no = Integer.parseInt(req.getParameter("n_no"));
			result = newsLogic.newsDelete(n_no);//배달사고가 나지 않도록 주의할것.				
			res.sendRedirect("crudNews.mem?work=getNewsList");
		}		
	}	
	public void doPost(HttpServletRequest req,HttpServletResponse res)
			throws ServletException,IOException
	{
		logger.info("doPost 호출 성공");
	}	
}
