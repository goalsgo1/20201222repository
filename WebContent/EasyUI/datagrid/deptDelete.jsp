<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String deptno = request.getParameter("deptno");
	out.print("사용자가 선택한 부서 번호는 "+deptno);
%>