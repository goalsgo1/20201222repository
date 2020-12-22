<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	out.print("<b>before</b>");
	out.print("<hr>");
	RequestDispatcher view = request.getRequestDispatcher("b.jsp");
	view.include(request,response);
	out.print("<b>after</b>");
%>