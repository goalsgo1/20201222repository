<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>    
<%@ page import="java.util.ArrayList, java.util.HashMap" %>    
<%@ page import="com.google.gson.Gson" %>    
<%
	out.print("<records>");
	out.print("<record>");
	out.print("<mem_id>apple</mem_id>");
	out.print("<mem_name>나신입</mem_name>");
	out.print("</record>");
	out.print("</records>");
%>