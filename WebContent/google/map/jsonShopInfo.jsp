<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %>    
<%@ page import="java.util.HashMap, com.google.gson.Gson" %>    
<%
	//jsonShopInfo.jsp파일을 추가 합니다.
	List<Map<String,Object>> shopList = new ArrayList<>();
    Map<String,Object> info = new HashMap<>();
    info.put("loc", "애슐리");//37.481774, 126.881570
    info.put("lat", 37.481774);
    info.put("lng", 126.881570);
    shopList.add(info);
    info = new HashMap<>();
    info.put("loc", "맥도널드");//37.485155, 126.895073
    info.put("lat", 37.485155);
    info.put("lng", 126.895073);
    shopList.add(info);
    info = new HashMap<>();
    info.put("loc", "김밥나라");//37.483000, 126.901056
    info.put("lat", 37.483000);
    info.put("lng", 126.901056);
    shopList.add(info);   
    Gson g = new Gson();
    String temp = g.toJson(shopList);
    out.print(temp);
%>