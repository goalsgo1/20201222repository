<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a2.jsp</title>
</head>
<body>
<%
	out.print("여기는 실행 기회를 가질 수 있나?");
	response.sendRedirect("b2.jsp");
%>
</body>
</html>