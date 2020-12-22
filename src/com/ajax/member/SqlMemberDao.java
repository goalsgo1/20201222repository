package com.ajax.member;

import java.io.Reader;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
//클래스 조립해 보기
//myBatis에서 프로시저 사용 단위테스트 코딩 전개해 보기 
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class SqlMemberDao {
	Logger logger = Logger.getLogger(SqlMemberDao.class);
	String resource = "com/util/Configuration.xml";
	SqlSessionFactory sqlMapper = null;	
	public String login(Map<String,Object> pMap) {//프로시저의 파라미터 맵은 파라미터이면서 리절트 인식
		String mem_name = null;
		SqlSession session = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader,"development3");
			logger.info("sqlMapper "+sqlMapper);
			session = sqlMapper.openSession();	
			session.selectOne("proc_ajaxLogin",pMap);//parameter이면서 result IN과 OUT동시에 받아준다.
			logger.info("이름 : "+pMap.get("msg"));
			mem_name = pMap.get("msg").toString();
		} catch(Exception e) {
			logger.info("Exception : "+e.toString());
		}
		return mem_name;
	}
	public static void main(String args[]) {
		SqlMemberDao smDao = new SqlMemberDao();
		Map<String,Object> pMap = new HashMap<>();
		pMap.put("mem_id","apple");
		pMap.put("mem_pw","123");
		smDao.login(pMap);
	}
}
