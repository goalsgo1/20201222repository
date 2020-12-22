package erp.ch17;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class ErpServlet extends HttpServlet{
	Logger logger = Logger.getLogger(ErpServlet.class);
	public void doService(HttpServletRequest req, HttpServletResponse res) 
	throws ServletException, IOException
	{
		logger.info("doService 호출");
		//요청 URL: /erp/empCRUD.kos?work=empAction
		//요청 URL: /erp/empCRUD.kos?work=empInsert
		//요청 URL: /erp/empCRUD.kos?work=empUpdate
		//요청 URL: /erp/empCRUD.kos?work=empDelete
		//요청 URL: /erp/empCRUD.kos?work=empSelect
		String uri = req.getRequestURI();// ==> /erp/empCRUD.kos
		String context = req.getContextPath();// ==> /루트 정보를 가져옴. server.xml에서
		String command = uri.substring(context.length()+1);//==> /erp/empCRUD.kos
		int end = command.lastIndexOf('.');
		command = command.substring(0,end);
		String works[] = null;
		works = command.split("/");
		
		String work = req.getParameter("work");
		//너 사원 등록 할거니?
		//여기 if문을 태우려면 URL을 어떻게 작성해야 하나요?
		//a20201116_2가 바라보는 경로는 어디인지 먼저 생각해 보고 답할것.
		if("empAction".equals(work)) {
			logger.info("사원 등록 요청 성공");
			List<Map<String,Object>> empInfo = new ArrayList<>();
			Map<String,Object> remp = new HashMap<>();
			remp.put("ename","SMITH");
			remp.put("gender",1);
			empInfo.add(remp);
			remp = new HashMap<>();
			remp.put("ename","JOHNS");
			remp.put("gender",0);
			empInfo.add(remp);			
			req.setAttribute("empInfo", empInfo);
			//RequestDispatcher view = req.getRequestDispatcher("/ASYNC/a20201116_2.jsp");
			RequestDispatcher view = req.getRequestDispatcher("/ASYNC/jsonResult.jsp");
			view.forward(req, res);
		}
		/*
		if("empAction".equals(work)) {
			logger.info("사원 등록 요청 성공");
			List<Map<String,Object>> empInfo = new ArrayList<>();
			Map<String,Object> remp = new HashMap<>();
			remp.put("ename","SMITH");
			remp.put("gender",1);
			empInfo.add(remp);
			remp = new HashMap<>();
			remp.put("ename","JOHNS");
			remp.put("gender",0);
			empInfo.add(remp);			
			req.setAttribute("empInfo", empInfo);
			res.sendRedirect("/ASYNC/a20201116_2.jsp");
		}
		*/
		//너 사원 등록 할거니?
		else if("empInsert".equals(work)) {
			logger.info("사원 등록 요청 성공");
		}
		else if("empUpdate".equals(work)) {
			logger.info("사원 수정 요청 성공");
			
		}
		else if("empDelete".equals(work)) {
			logger.info("사원 삭제 요청 성공");
			
		}
		else if("empSelect".equals(work)) {
			logger.info("사원 목록 조회 요청 성공");
			
		}
	}
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException
	{
		doService(req,res);
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException
	{
		doService(req,res);		
	}
}
