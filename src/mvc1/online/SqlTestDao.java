package mvc1.online;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class SqlTestDao {
	Logger logger = Logger.getLogger(SqlTestDao.class);
	String resource = "com/util/Configuration.xml";
	SqlSessionFactory sqlMapper = null;	
	public List<Map<String, Object>> subjectList() {
		logger.info("시험과목 목록 호출 성공");
		List<Map<String,Object>> subList = null;
		SqlSession session = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader,"development3");
			logger.info("sqlMapper "+sqlMapper);
			session = sqlMapper.openSession();	
			subList = session.selectList("subjectList");//parameter이면서 result IN과 OUT동시에 받아준다.
		} catch(Exception e) {
			logger.info("Exception : "+e.toString());
		}
		return subList;
	}///////////////////end of subjectList
}///////////////////////end of SqlTestDao
