package com.ajax.member;

import java.util.Map;

import org.apache.log4j.Logger;
/*
 * Logic 클래스의 역할은 업무에 대한 프로세스(멀티[SELECT,INSERT SELECT, UPDATE, SELECT, DELETE], 다중처리)를 이해하고 있으면서 어떤 테이블에서 조회할 것인가
 * 그 조회한 결과를 어떤 테이블에 추가할 것인가 등을 판단하고 결정하는 일을 담당한다.
 * 하나의 로직 하나의 메소드 안에서 DAO있는 여러개의 메소드를 한 번에 요청할 수도 있다.
 * 트랜잭션 처리는 로직에서 담당하는것이 옳다.
 * commit과 rollback메소드를 호출해야 하는 시점도 여기이다.
 * 공통된 관심사를 분리하기 위해서 AOP API활용 (AOP 프레임워크가 따로 있다)<->  OOP
 * 이것을 사용할 경우 자동으로 트랜잭션 처리를 할 수 있다.
 * 일괄적으로 적용이 가능해서 업무에 시간 절약
 * 반복되는 코드를 줄여줌.
 * con.setAutoCommit(true);즉시 커밋을 함
 * false:기다렸다가(옵션을 false설정 바꿈.) 모두가 정상처리 되었을 때 한번에 커밋함.
 * int r1 = pstmt.executeUpdate();//insert or update or delete
 * int r2 = pstmt.executeUpdate();
 * if(r1==1 && r2==1) con.commit();
 * con.setAutocommit(true)로 바꾸어 두어야 함.디폴트는 true이다
 * 직접 오라클과 연동하지 않아야 함.
 * 그래야 트랜잭션을 적용할 수 있니까....
 * 그래야 재사용성이 높아짐.
 * 그러기 위해 독립적이어야 함.
 * 독립적이니까 결합도는 낮아짐.
 * 결합이 낮으니까 재사용성이 높아짐.
 * 
 */
public class MemberLogic {
	Logger logger = Logger.getLogger(MemberLogic.class);
//오라클과 연동하는 일을 담당하는 클래스 객체 주입 필요함.	
//항상 뒤에 있는 클래스를 앞에서 인스턴스화 해야 함.	
	SqlMemberDao smDao = null;//선언시에는 null로 하였다가 필요한 시점에 객체 주입받는것.- 권장사항
	public String login(Map<String,Object> pMap) {
		logger.info("login 호출 성공");
		String mem_name = null;
		smDao = new SqlMemberDao();
		mem_name = smDao.login(pMap);
		logger.info("오라클에서 꺼낸 이름 : "+mem_name);
		return mem_name;
	}
}
