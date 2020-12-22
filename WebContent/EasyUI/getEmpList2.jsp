<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>    
<%@ page import="com.google.gson.Gson" %>    
<%@ page import="web.mvc.*" %>    
<%
	int empno = 0;
	String g_empno = request.getParameter("h_empno");//7566
	if(request.getParameter("h_empno")!=null){
		empno = Integer.parseInt(g_empno);//"7566" ==> 7566//NumberFormatException 발생가능성이 있다.	
	}
	
	String cols = request.getParameter("cols");//empno, ename, sal
    String keyword = request.getParameter("keyword");//사용자가 입력한 값
    Map<String,Object> pmap = new HashMap<>();
    //사용자가 선택한 값을 Map에 담아야 한다.
    pmap.put("h_empno",empno);
    if(cols!=null){
    	if("empno".equals(cols)){
    		pmap.put("uempno","empno");
    	}
    	else if("ename".equals(cols)){
    		pmap.put("uename","ename");
    	}
    	else if("sal".equals(cols)){
    		pmap.put("usal","sal");
    	}
    }
    if(keyword!=null){
    	pmap.put("keyword",keyword);//7566 or SMITH or 3000
    }
    StringBuilder sql = new StringBuilder();
	EmpDao dDao = new EmpDao();
	List<Map<String,Object>> empList = dDao.getEmpList(pmap); 
	Gson g  = new Gson();
	String imsi = g.toJson(empList);
	out.print(imsi);
	//out.print(empList);
%>













