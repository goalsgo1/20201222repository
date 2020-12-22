<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	out.print(session.getAttribute("s_id"));//apple
	out.print("<br>");
	out.print(request.getAttribute("r_id"));//null
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b1.jsp</title>
</head>
<body>
여기는 b1.jsp페이지 입니다.<br>
url이 바뀐것을 확인하였습니까?<br>
url이 바뀐것은 무엇을 의미하나요?
</body>
</html>