<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ord_no = new String("E202011030005");
	//요청객체에 데이터를 담을 수 있음.
	request.setAttribute("ord_no", ord_no);
	RequestDispatcher view = request.getRequestDispatcher("c.jsp");
	view.forward(request,response);
%>    
