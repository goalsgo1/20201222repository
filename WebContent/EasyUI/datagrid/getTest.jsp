<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>    
<%@ page import="java.util.ArrayList, java.util.HashMap" %>    
<%@ page import="com.google.gson.Gson" %>    
<%@ page trimDirectiveWhitespaces="true" %>
<%
	List<Map<String,Object>> testInfo = new ArrayList<>();
    Map<String,Object> rmap = new HashMap<>();
    rmap.put("code",2560);
    rmap.put("name","이성계");
    testInfo.add(rmap);
    rmap = new HashMap<>();
    rmap.put("code",3560);
    rmap.put("name","김춘추");
    testInfo.add(rmap);
    rmap = new HashMap<>();
    rmap.put("code",5560);
    rmap.put("name","김유신");
    testInfo.add(rmap);  
    Gson g = new Gson();
    String temp = g.toJson(testInfo);
    out.print(temp);
%>