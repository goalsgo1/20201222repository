package web.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class TestController extends HttpServlet {
	Logger logger = Logger.getLogger(TestController.class);
	private static final long serialVersionUID = 1L;
	/***************************************************************************************
	 * @param1 : req - 톰캣 서버가 제공해주는 객체 - servlet-api.jar
	 * @param2 : res - 톰캣 서버가 제공해 주는 객체
	 * 메소드 이름 뒤에 throws로 예외를 던지면 예외가 발생되었을 때 나를 호출한 곳에서 처리해 주세요.
	 * 서블릿은 톰캣 서버가 싱글톤 패턴으로 직접 관리하니까 내가 예외처리 불가함.
	 * doGet은 일종의 콜백메소드임.
	 * 질문:나는 자바코드인데 브라우저에서 실행시키고 싶다. 어떡하지?
	 * 힌트:나는 메인메소드가 없다.
	 *     나는 url도 없다.
	 *     나는 doGet메소드만 있다.
	 **************************************************************************************/
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException
	{
		logger.info("doGet 호출 성공");
		//응답객체를 통해서 마임타입을 지정할 수 있고 한글 인코딩도 추가할 수  있음.
		res.setContentType("text/xml;charset=utf-8");
		//브라우저에 쓰기를 위해서 객체를 생성함.
		PrintWriter out = res.getWriter();
		//브라우저에 쓰기(태그)를 함.
		out.print("<b>서블릿으로 그린 웹페이지 입니다.</b>");
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException
	{
		logger.info("doPost 호출 성공");
		//응답객체를 통해서 마임타입을 지정할 수 있고 한글 인코딩도 추가할 수  있음.
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<b>Post전송으로 요청된 웹페이지 입니다.</b>");
	}

}







