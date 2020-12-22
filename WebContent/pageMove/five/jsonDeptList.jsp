<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.google.gson.Gson"%>
<%
	List<Map<String,Object>> deptList = null;
	deptList = 
	(List<Map<String,Object>>)request.getAttribute("deptList");
	Gson g = new Gson();
	String imsi = g.toJson(deptList);
	out.print(imsi);
%>