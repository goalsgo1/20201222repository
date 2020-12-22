package web.mvc;

import java.io.Reader;
import java.util.List;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class ZipCodeDao {
	Logger logger = Logger.getLogger(ZipCodeDao.class);
	String resource = "com/util/Configuration.xml";
	SqlSessionFactory sqlMapper = null;	
	/***********************************************************************************************
	 * 제목 : 동정보를 입력받아서 우편번호 조회 구현
	 * @param dong 사용자가 입력한 동이름을 받는다.
	 * @return List<ZipCodeVO> - n건 조회 -> 사용자가 선택(onDblClickRow, onSelect) -> 등록화면에 우편번호 넣기
	 * @author 이순신 2020년 11월 06일 수정 완료
	 ***********************************************************************************************/
	public List<ZipCodeVO> getZipCodeList(String dong) {
		SqlSession session = null;
		List<ZipCodeVO> zipList = null;
		try {
			//물리적으로 떨어져 있는 소스에서 필요한 정보를 읽어와야 함.Reader<->Writer
			//문서를 읽는데 필요한 클래스
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader,"development3");
			logger.info("sqlMapper "+sqlMapper);
			session = sqlMapper.openSession();//연결이 됨 - 쿼리문을 처리 요청할 수 있다.
			zipList = session.selectList("getZipCodeList", dong);
			logger.info("zipList : "+zipList);
			 //session.close(); 
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}	
		return zipList;
	}////////////////////end of getZipCodeList
	public static void main(String args[]) {
		ZipCodeDao zcDao = new ZipCodeDao();
		List<ZipCodeVO> zipList=zcDao.getZipCodeList("마포");
		System.out.println(zipList.size());
	}
}
