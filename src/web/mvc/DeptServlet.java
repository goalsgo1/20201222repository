package web.mvc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;


public class DeptServlet extends HttpServlet {
	Logger logger = Logger.getLogger(DeptServlet.class);
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	throws ServletException,IOException
	{
		logger.info("doGet 호출 성공");
		DeptDao dDao = new DeptDao();
		List<Map<String,Object>> deptList = new ArrayList<>();//empList.size()=0이다.
		deptList = dDao.getDeptList(null);	
		logger.info("deptList : "+deptList);
		req.setAttribute("deptList", deptList);
		
		RequestDispatcher view = 
				req.getRequestDispatcher("/pageMove/five/a5.jsp");
		view.forward(req,res);
		
	}
}
