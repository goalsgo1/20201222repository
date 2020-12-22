package com.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class BoardServlet extends HttpServlet {
	Logger logger = Logger.getLogger(BoardServlet.class);
	public void doGet(HttpServletRequest req,HttpServletResponse res)
	throws ServletException,IOException
	{
		logger.info("doGet 호출 성공");
		res.setContentType("text/html;charset=utf-8");
		///board/bsell.do?command=ajax&pageName=AJAX/common/typeA/test
		String command = req.getParameter("command");//ajax or null
		//"/WEB-INF/jsp/null.jsp";
		String pageName = req.getParameter("pageName");//test or null
		
		PrintWriter out = res.getWriter();
		out.print(60);
		if("ajax".equals(command)) {
			logger.info("요기");
			String  url = "/WEB-INF/jsp/"+pageName+".jsp";
			RequestDispatcher view = req .getServletContext().getRequestDispatcher(url);
			view.forward(req, res);
		}
	}
}





