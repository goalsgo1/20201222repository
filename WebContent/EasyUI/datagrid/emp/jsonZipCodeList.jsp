<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.mvc.ZipCodeDao,web.mvc.ZipCodeVO" %>    
<%@ page import="java.util.List" %>    
<%@ page import="com.google.gson.Gson" %>    
<%
//jsp이지만 json역할을 함-DefaultTable, DataSet역할
	ZipCodeDao zcDao = new ZipCodeDao();
	//사용자가 입력한 동이름을 파라미터로 넘겨야 함.
	String dong = request.getParameter("dong");
	List<ZipCodeVO> zcList = zcDao.getZipCodeList(dong);
	Gson g = new Gson();
	String imsi = g.toJson(zcList);
	out.print(imsi);
%>