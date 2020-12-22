package mvc1.online;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class TestLogic {
	Logger logger = Logger.getLogger(TestLogic.class);
	SqlTestDao sqlTestDao = null;
	public List<Map<String, Object>> subjectList() {
		logger.info("시험과목 목록 호출 성공");
		List<Map<String,Object>> subList = null;
		subList = sqlTestDao.subjectList();//select하는구나
		if(subList==null) {//NullPointerException방지 코드
			subList = new ArrayList<>();// subList.size()=0
		}
		return subList;
	}
}
