package com.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

import com.google.gson.Gson;

public class PrintJson extends HttpServlet {
	Logger logger = Logger.getLogger(PrintJson.class);
	//xml문서가 물리적으로 어디에 있는지를 알아야 함.
	String resource = "com/util/Configuration.xml";
	//MyBatis에서 지원하는 클래스로 
	SqlSessionFactory sqlMapper = null;	
	/**********************************************************
	 * 조회 결과를 JSON 포맷으로 내보내기 구현
	 * url-pattern:web.xml에 먼저 등록 할것.
	 * common/toJson.do
	 *********************************************************/
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	throws ServletException, IOException
	{
		logger.info("doGet 호출 성공");
		PrintWriter out = res.getWriter();
		res.setContentType("application/json; charset=UTF-8");
		SqlSession session = null;
		List<Map<String,Object>> empList = null;
		String imsi = null;
		try {
			//물리적으로 떨어져 있는 소스에서 필요한 정보를 읽어와야 함.Reader<->Writer
			//문서를 읽는데 필요한 클래스
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader,"development3");
			logger.info("before===>"+sqlMapper);
			session = sqlMapper.openSession();
			logger.info("after===>"+session);
			Map<String,Object> target = new HashMap<>();
			empList = session.selectList("getEmpList", target);
			 session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}	
		if(empList ==null) {//조회 결과가 없을 때
			empList = new ArrayList<>();
		}else {//조회 결과가 존재하는 경우
			Gson g = new Gson();
			imsi = g.toJson(empList);
		}
		out.print(imsi);
//		out.print("[{deptno:10}]");
	}
}
