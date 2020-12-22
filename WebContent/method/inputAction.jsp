<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.util.HangulConversion" %>    
<%
	out.print(request.getParameter("name"));
	out.print(HangulConversion.toUTF(request.getParameter("name2")));
%>