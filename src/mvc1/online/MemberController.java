package mvc1.online;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.ajax.member.MemberLogic;

public class MemberController extends HttpServlet implements Action {
	Logger logger = Logger.getLogger(MemberController.class);
	MemberLogic mLogic = new MemberLogic();
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		logger.info("execute 호출 성공");
		ActionForward af = new ActionForward();
		String viewName = null;
		boolean isRedirect = false;
		String command = (String)req.getAttribute("command");
		//문제 제기
		//여전히 url과  메소드 이름을 1:1로 매칭하는것은 해결이 안되고 있다.
		if("member/login".equals(command)) {
			logger.info("로그인 호출 성공");
			//사용자가 화면에 입력한 아이디와 비번 넘기기
			Map<String,Object> pMap = new HashMap<>();
			pMap.put("mem_id", req.getParameter("mem_id"));
			pMap.put("mem_pw", req.getParameter("mem_pw"));
			String msg = null;//이름, 아이디가 존재하지 않습니다.  비번이 틀립니다.
			msg = mLogic.login(pMap);
			HttpSession session = req.getSession();
			session.setAttribute("smsg", msg);
			viewName="/onLineTest/loginAccount.jsp";
			//세션에 값을 저장하므로 요청이 유지 되지 않아도 된다.
			isRedirect = true;
			af.setRedirect(isRedirect);
			af.setViewName(viewName); 
		}
		else {
			viewName="/onLineTest/index.jsp";
			isRedirect = true;
			af.setRedirect(isRedirect);
			af.setViewName(viewName);
		}
		return af;
	}

}
