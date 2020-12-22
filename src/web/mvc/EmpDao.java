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


public class EmpDao {
	Logger logger  = Logger.getLogger(EmpDao.class);
	//myBatis연동시 공통부분을 클래스로 분할해 보기(반복되는 코드는 개선해 본다)
	//공통코드로 만들어서 여러 사람이 협업할 때 하나의 클래스로 객체 생성 해 보기
	MyBatisCommonFactory mcf = new MyBatisCommonFactory();
	//xml문서가 물리적으로 어디에 있는지를 알아야 함.-어느 회사 제품인지, 서버의 IP주소, port번호, 계정정보
	//자바와 비교해서 컴파일을 안해도 된다.
	//버전관리가 용이하다.
	//선언 한 번으로 재사용이 가능하다.
	//업무에 대한 복잡도가 높을 경우 select, insert, update, delete가 복합적으로 일어나게 된다.
	//이 때 한 번 읽어들인 오라클서버의 정보로 공유할 수 있다.
	String resource = "com/util/Configuration.xml";//자원정보를 담고 있는 xml문서
	//MyBatis에서 지원하는 클래스로 물리적으로 떨어져 있는 오라클 서버에 연결통로를 확보하는데 사용됨.
	//또한 JDBC와는 다르게 DML구문을 xml문서에 관리하게 되는데 하나의 xml문서안에 여러개의 sql문을 관리할 수 있어서
	//주문관리, 사원관리, 배송관리와 같은 전체 업무에 필요한 sql문을 한 자리에서 다 볼 수 있다.
	
	SqlSessionFactory sqlMapper = null;	
	public List<Map<String,Object>> getEmpList(Map<String,Object> pmap){
		List<Map<String,Object>> empList = null;
		//여기서의 세션은 서버의 캐쉬메모리에 관리되는 API를 말하는것이 아니라 SqlSession의 인스턴스 변수명으로 사용하였다.
		//이것으로 insert("empInsert"), update("empUpdate",pmap), delete("empDelete",pmap)
		//selectOne("empDetail"), selectList("empList"), selectMap("empMap") 같은 메소드를 호출할 수 있음.
		//insert, update, delete의 경우 실제 테이블의 변화를 주는 쿼리문이므로 물리적인 테이블에 변경사항을 적용하는
		//commit과 rollback에 오라클 명령어를 자바단에서 대신 호출할 수 있다.
		//자바의 경우 con.setAutoCommite(true) 이어서 자동 커밋이 일어나지만
		//마이바티스의 경우 반드시 별도로 해주어야 함.
		//con.commit(), con.rollback()
		//session.commit(), session.rollback()
		//이 세가지가 트랜잭션처리의 대상이 되는 DML구문임.
		SqlSession session = null;
		try {
			//물리적으로 떨어져 있는 소스에서 필요한 정보를 읽어와야 함.Reader<->Writer
			//문서를 읽는데 필요한 클래스
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader,"development3");
			logger.info("sqlMapper "+sqlMapper);
			//커넥션 연결 위한 사전 코드
			//아래서 생성한 session은 insert(), update(), delete(), selectOne, selectList, selectMap
			session = sqlMapper.openSession();
			//logger.info("사용자가 선택한 사원번호:"+pmap.get("h_empno"));//7788
			empList = session.selectList("getEmpList2", pmap);
			logger.info("empList : "+empList.size());//1
			 session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}	
		return empList;
	}	
}
