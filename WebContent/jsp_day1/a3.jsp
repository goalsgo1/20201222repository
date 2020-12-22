<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_id="apple";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a3.jsp</title>
</head>
<body>
<script type="text/javascript">
	var mem_id = "<%=mem_id%>";
	alert("mem_id : "+mem_id);
</script>
</body>
</html>