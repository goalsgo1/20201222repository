package com.basic;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class A extends Object{
	public void doGet(HttpServletRequest req, HttpServletResponse res) {
		try {
			//톰캣서버에서 요청하는게 아니잖아- 상대가 생각하게 만든다.
			res.sendRedirect("/index.jsp");//NullPointerException발생
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		A a = new A();
		HttpServletRequest req = null;
		//HttpServletRequest req1 = new HttpServletRequest();
		HttpServletResponse res = null;
		//doGet메소드를 내가 호출하였다.
		//톰캣서버랑 통신만 할 수 있다면 직접 호출 안함. - 콜백메소드
		//누가 호출하나요? 톰캣
		//언제 호출되나요?  XXX.do로 요청했을때
		//누가 주입해 주나요? 톰캣
		a.doGet(req, res);

	}

}
