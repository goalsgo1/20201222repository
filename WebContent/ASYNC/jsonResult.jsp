<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>    
<%@ page import="java.util.List" %>    
<%@ page import="com.google.gson.Gson" %>    
<%
	int size = 0;
	List<Map<String,Object>> empInfo = null;
//서블릿에서는 request.setAttribute("empList",주소번지);
	empInfo = 
	(List<Map<String,Object>>)request.getAttribute("empInfo");
	if(empInfo!=null){
		size = empInfo.size();
	}
	Gson g = new Gson();
	String imsi = g.toJson(empInfo);
	out.print(imsi);
%>