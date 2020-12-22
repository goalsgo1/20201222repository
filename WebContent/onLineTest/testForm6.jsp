<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String test5 = request.getParameter("htest5");
	Cookie c = new Cookie("test5",test5);
	c.setMaxAge(60*60);
	response.addCookie(c);
	response.sendRedirect("./testFormSend.jsp");
%>