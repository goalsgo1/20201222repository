package com.basic;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class A3 extends HttpServlet {
	Logger logger = Logger.getLogger(A3.class);
//get호출하거나 post호출하거나 다 모두 service로...
	public void init() {
		
	}
	public void doService(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		logger.info("doService호출 성공");
		//res.sendRedirect("a3_result.jsp");
		RequestDispatcher view = 
				req.getRequestDispatcher("a3_result.jsp");
		view.forward(req, res);
		//이 아래 코드는 실행이 될 기회를 가질 수 있을까?
		//XXX.do?command=empInsert|empUpdate|empDelete|empSelect
		String command=req.getParameter("command");//empInsert|empUpdate|empDelete|empSelect
		logger.info("command:"+command);
		//사원등록할거니?
		if("empInsert".equals(command)) {
			
		}
		//사원수정해야돼는데....
		else if("empUpdate".equals(command)) {
			
		}
		//퇴사한 사원이 있는데 어떻게 하죠?
		else if("empDelete".equals(command)) {
			
		}
		//사원 목록을 보고 싶어 하세요.
		else if("empSelect".equals(command)) {
			
		}
	}
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		logger.info("doGet호출 성공");
		doService(req,res);
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		logger.info("doPost호출 성공");
		doService(req,res);
	}
	public void destroy() {
		
	}
}
