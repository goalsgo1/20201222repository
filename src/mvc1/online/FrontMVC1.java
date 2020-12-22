package mvc1.online;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;


public class FrontMVC1 extends HttpServlet {
	Logger logger = Logger.getLogger(FrontMVC1.class);
	MemberController memCtrl = new MemberController();
	TestController testCtrl = new TestController();
	/*
	 * doService는 표준서블릿에서 제공되는 메소드가 아니다.
	 * @Override라는 어노테이션은 쓸 수 없다.(어노테이션도 컴파일 대상이니까, 문법체크 한다)
	 * 그럼 req, res는 어디서 온거죠?  doGet, doPost에서 왔다.
	 * 파라미터로 왔다.원본이 왔다.
	 */
	public void doService(HttpServletRequest req, HttpServletResponse res)
	throws ServletException,IOException
	{
		logger.info("doService 호출 성공");
		String uri = req.getRequestURI();//  /member/memberList.test
		String context = req.getContextPath();// /   /dev_html, /dev_web
		String command = uri.substring(context.length()+1);
		int end = command.lastIndexOf(".");
		command = command.substring(0,end);// member/memberList
		logger.info("command : "+command);
		String upmu[] = null;
		upmu = command.split("/");
		ActionForward af = null;
		//MemberController에서 객체 주입을 받아온다.- 그래야 null이 아닐테니까
		//viewName은 누가 어디서 결정해야 하나?
		//어떻게 가져오지? getter
		if("member".equals(upmu[0])) {
			req.setAttribute("command", command);
			//MemberController에 값을 넘길 때 request사용한다.
			//왜냐하면 원본이 넘어가니까
			af = memCtrl.execute(req, res);
		}///////////////end of 회원관리
		else if("onLineTest".equals(upmu[0])) {
			req.setAttribute("command", command);
			//MemberController에 값을 넘길 때 request사용한다.
			//왜냐하면 원본이 넘어가니까
			af = testCtrl.execute(req, res);
		}///////////////end of 회원관리
		/////////////////////[[[ 응답 페이지 처리 관련 ]]]//////////////////////
		try {
			if(af!=null) {
				if(af.isRedirect()) {//false
//sendRedirect 파라미터 자리에 null이 오더라도 익셉션이 발생하지 않습니다.
//res.sendRedirect(null);이 코드에 대해서 문제 발생없음.					
					res.sendRedirect(af.getViewName());
					//res.sendRedirect(null);
				}
				else {//여기
					RequestDispatcher view = req.getRequestDispatcher(af.getViewName());
					view.forward(req, res);
				}
			}/////////////////end of 페이지 이동처리
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException,IOException
	{
		doService(req,res);
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException,IOException
	{
		//res.sendRedirect("/onLineTest/index.jsp");
		doService(req,res);
	}

	public void methodA(HttpServletRequest req, HttpServletResponse res)
			throws ServletException,IOException
	{
		//메소드 앞에는 소유주가 온다. 
		//그런데 지역변수이다. 왜냐하면 파라미터 자리에 선언되어 있으니깐...
	}
}














