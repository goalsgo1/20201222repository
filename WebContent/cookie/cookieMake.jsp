<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹서버에서 쿠키 생성하기</title>
</head>
<body>
<%
	Cookie c_dap1 = new Cookie("c_dap1","2");
    c_dap1.setMaxAge(60);//초
	Cookie c_dap2 = new Cookie("c_dap2","3");
    c_dap2.setMaxAge(60);
    c_dap2.setDomain("http://192.168.0.244:9000/cookie");
	Cookie c_name = new Cookie("c_name",URLEncoder.encode("김유신","utf-8"));
    c_name.setMaxAge(60);
    response.addCookie(c_dap1);
    response.addCookie(c_dap2);
    response.addCookie(c_name);
%>
</body>
</html>