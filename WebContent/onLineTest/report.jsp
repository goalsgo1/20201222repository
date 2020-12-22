<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String isPass = request.getParameter("isPass");
	out.print(isPass);
	boolean b_pass = Boolean.parseBoolean(isPass);
	if(b_pass){
		out.print("당신은 <font color='blue'>합격</font> 입니다.");
	}
	else{
		out.print("당신은 <font color='red'>불합격</font> 입니다.");
	}
%>