package mvc1.online;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

public class TestController implements Action {
	Logger logger = Logger.getLogger(TestController.class);
	//개발자가 라이프 사이클을 직접 관리하기
	//객체 주입도 개발자가 직접 처리하기
	TestLogic tLogic = new TestLogic();//tLogic = null;
	//외부에서 필요한 순간에 객체를 주입해 준다.
	TestLogic tLogic2 = null;//반드시 null로 초기화 할것.
	//tLogic2 = new TestLogic()하는것 대신 아래 코드를 사용함.
	//둘의 차이점은 무엇입니까?
	//아래는 객체 주입을 외부에서 따로 해줌-라이프사이클 관리를 받는다.
	public void settLogic2(TestLogic tLogic2) {
		this.tLogic2 = tLogic2;
	}
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward af = new ActionForward();
		String viewName = null;
		boolean isRedirect = false;
		String command = (String)request.getAttribute("command");
		if("member/subjectList".equals(command)) {
			logger.info("시험과목 목록 호출 성공");
			List<Map<String,Object>> subList = null;
			subList = tLogic.subjectList();//select하는구나
			request.setAttribute("subList", subList);//forward고려
			viewName="jsonSubjectList.jsp";
			//세션에 값을 저장하므로 요청이 유지 되지 않아도 된다.
			isRedirect = false;//false이면 forward 이다.
			af.setRedirect(isRedirect);
			af.setViewName(viewName); 
		}
		return af;
	}

}
