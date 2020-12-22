package web.mvc;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sun.istack.internal.logging.Logger;
import com.util.MyBatisCommonFactory;

public class DeptDao {
	Logger logger  = Logger.getLogger(DeptDao.class);
	String resource = "com/util/Configuration.xml";//자원정보를 담고 있는 xml문서
	SqlSessionFactory sqlMapper = null;	
	public List<Map<String,Object>> getDeptList(Map<String,Object> pmap){
		logger.info("getDeptList 호출 성공");
		List<Map<String,Object>> deptList = null;
		SqlSession session = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader,"development3");
			logger.info("sqlMapper "+sqlMapper);
			session = sqlMapper.openSession();
			deptList = session.selectList("getDeptList", pmap);
			logger.info("deptList : "+deptList.size());//
			//아래코드를 쓰지 않으면 오라클서버에서 세션의 수가 너무 많아져서 강제 손절
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}	
		return deptList;
	}	
}
