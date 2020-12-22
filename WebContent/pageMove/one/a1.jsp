<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("s_id", "apple");
	request.setAttribute("r_id", "tomato");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a1.jsp</title>
</head>
<body>
<script type="text/javascript">
	location.href="b1.jsp";
</script>
</body>
</html>