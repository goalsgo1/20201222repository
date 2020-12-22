<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>    
<%@ page import="com.google.gson.Gson" %>    
<%
	//입양할 때 더 집중해야 함
	//오히려 부분적으로 수정해야 하므로 연관되는 것들은 모두 함께 수정해야 함.
	//오히려 실수가 더 많이 발생함.
	//위치 먼저 파악을 해야 함.
	//위치  앞뒤에는 표식을 남김
		List<Map<String, Object>> deptList = new ArrayList<>();//n개 로우를 담기 위해서
		Map<String, Object> rmap = null;//선언만 해야 됨. 나머지는 어디에 해야 하나요?
		//그안 에 있는 Map은 한 개 로우만 담음.
		try {    
			/******* JDBC Connection *******/
			Connection conn = null;//물리적으로 떨어져 있는 오라클 서버에 연결통로 선언
			Statement  stmt = null;//쿼리문을 담을 전령 객체 선언
			ResultSet  rs   = null;//커서를 조작하는 객체 선언
			
			//넥사 그린 화면에 그리드에 매칭될 데이터셋 객체를 생성해요
			//아이피로 접근하니까 예외처리 해야 됨.
			try { 
				//오라클 회사 제품인걸 확인할 수 있어요.
				Class.forName("oracle.jdbc.driver.OracleDriver");
				//오라클서버에 물리적인 정보를 알수 있음.
				conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl11","scott","tiger");
				//select문을 자바에서 오라클서버로 전달하기
				stmt = conn.createStatement();
			  
				/******* SQL ************/
				//테이블 이름과 컬럼명만 바꾼다. - 나머지는 모두 반복이다. -  반복되는 코드는 줄인다. - myBatis사용이유
				String SQL;//쿼리문을 담아요-select
				SQL  = "SELECT deptno    \n" +
					   "     , dname     \n" +
					   "     , loc       \n" +
					   "  FROM dept      \n";
				//System.out.println(SQL);//작성한 쿼리문을 토드에서 테스트 해보고 싶다      
				rs = stmt.executeQuery(SQL);//오라클에게 select문 처리해달고 부탁함

				//화면에 매칭(id:ds_emp)할 데이터셋 자바에서 초기화 하기 - 오라클에 있는 컬럼을 모두 꺼내서 자바코드롤 옮겨보는 연습
				//조회 로우 수 만큼 반복하면서 61번에서 추가될 공간을 먼저 확보하고	
				while(rs.next())
				{
					rmap = new HashMap<>();
					//int row = ds.newRow();//공간확보- 사전에 반드시 먼저 해야 함.
					//63부터 읽어온 정보를 초기화 해줌. 어디에?
					rmap.put("DEPTNO"      ,rs.getInt("deptno"));
					rmap.put("DNAME"       ,rs.getString("dname"));
					rmap.put("LOC"         ,rs.getString("loc"));
					deptList.add(rmap);
				}///////////////end of while			  				
			} catch (SQLException se) {
				out.print("SQLException : "+se.toString());
			}/////////////////////end of inner try...catch    
			
			/******** JDBC Close ********/
			if ( stmt != null ) try { stmt.close(); } catch (Exception e) {}
			if ( conn != null ) try { conn.close(); } catch (Exception e) {}
		}catch(Exception e){
			out.print("Exception : "+e.toString());
		}/////////////////////end of outter try...catch   
		Gson g  = new Gson();//google-json API
		String imsi = g.toJson(deptList);
		//out.print(deptList);
		out.print(imsi);
%>













