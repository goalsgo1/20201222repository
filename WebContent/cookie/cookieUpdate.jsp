<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹서버에서 쿠키 생성하기</title>
</head>
<body>
<%
	Cookie c_dap1 = new Cookie("c_dap1","4");
    c_dap1.setMaxAge(60);
    response.addCookie(c_dap1);
%>
</body>
</html>