<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a4.jsp</title>
</head>
<body>
<%
	RequestDispatcher view = request.getRequestDispatcher("b4.jsp");
	view.forward(request,response);
	out.print("여기는 실행 기회를 가질 수 있나?");
%>
</body>
</html>