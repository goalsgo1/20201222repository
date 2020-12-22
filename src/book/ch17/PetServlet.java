package book.ch17;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.util.HashMapBinder;
//jsp페이지 기준으로 업무명(폴더명) 결정함.
@WebServlet(urlPatterns="/ch17/petChoice")
public class PetServlet extends HttpServlet {
	Logger logger = Logger.getLogger(PetServlet.class);
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	throws ServletException,IOException
	{
		logger.info("doGet 호출 성공");
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException,IOException
	{
		logger.info("doPost 호출 성공");
		 HashMapBinder hmb = new HashMapBinder(req);
		 //insert here
		 Map<String,Object> pmap = new HashMap<>();
		 hmb.bind(pmap);
		 //Map의 구조 이므로 키값을 가져와야 함.
		 Object obj[]= null;
		 obj = pmap.keySet().toArray();
		 for(int i=0;i<obj.length;i++){
			 String key = (String)obj[i];
			if("name".equals(key)){
				logger.info("name 파라미터 ="+ pmap.get(key)+"<br>");
			}
			if("address".equals(key)){
				logger.info("address 파라미터 ="+ pmap.get(key)+"<br>");
			}
			if("h_imsi".equals(key)){
				logger.info("hidden속성 값 ="+ pmap.get(key)+"<br>");
			}
		 }///////////////////end of for		
	}
}
