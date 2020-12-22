package com.basic;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
/*
 * jsp는 화면을 담당한다.
 * 
 * 서블릿은 request가 있으므로 사용자가 입력한 값을 청취하고 들은 내용으로 사용자가 원하는 기능을 
 * 처리하는 자바클래스와 조인해주고 그 자바 클래스가 처리한 결과를 받아서 res.sendRedirect로 
 * 응답 페이지를 호출하는 일을 맡기면 좋지 않을 까?
 * 서블릿에서 JSP페이지를 호출하는 예제 두 가지를 작성해 볼것.  - 복습하기
 * res.sendRedirect("a.jsp");
 * 
 * view.forward(req,res);
 * 
 * view.include(req,res);
 * 
 */
public class A5 extends HttpServlet {
	Logger logger = Logger.getLogger(A5.class);
//get호출하거나 post호출하거나 다 모두 service로...
	public void init() {
		
	}
	public void doService(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		logger.info("doService호출 성공");
		//ObjectOutputStream oos = socket.getOutputStream();
		PrintWriter out = res.getWriter();
		out.print("<html>");
		out.print("<head><title>사원관리</title></head>");
		out.print("<body>");
		out.print("<h2>내용이 오는 자리</h2>");
		out.print("<div id='d_msg'>내용이 오는 자리</div>");
		out.print("</body>");
		out.print("</html>");
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
