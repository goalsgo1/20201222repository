package mvc1.online;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class FrontMVC1_1{//나는 서블릿이 아니야
//public class FrontMVC1_1 extends HttpServlet {//나는 서블릿이다
	Logger logger = Logger.getLogger(FrontMVC1_1.class);
	//왜 아래 메소드는 빨갱이 인가요?
	//문법적인 문제를 해결하려면 어떡하죠?
	//상속이 아닌 경우 오버라이드는 생각 말자. 해당사항 무, 어림 없다.
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException,IOException
	{

	}
//그럼 나는? 사용자 정의 메소드 이다.이름만 같다. 무늬만 같다.
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException,IOException
	{
		//res.sendRedirect("/onLineTest/index.jsp");
	}
//사용자 정의 메소드
	//본만큼 구현하는 거다.
	public void methodA(HttpServletRequest req, HttpServletResponse res)
			throws ServletException,IOException
	{
		res.sendRedirect("a.jsp");
		//null.sendRedirect("a.jsp");
	}
	public static void main(String args[]) throws ServletException,IOException{
		FrontMVC1_1 fm = new FrontMVC1_1();//순제어
		fm.methodA(null, null);//자가진단. 널을 넘겨받는 것이다.
	}
}














