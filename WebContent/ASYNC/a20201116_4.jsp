<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String v_name="이순신";
	String v_gender="남자";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		document.write("<table width='350px' border='1' borderColor='green'>");
		document.write("<tr>");
		document.write("<td>");
		document.write("<%=v_name%>");
		document.write("</td>");
		document.write("<td>");
		document.write("<%=v_gender%>");
		document.write("</td>");
		document.write("</tr>");
		document.write("</table>");
		
	});
</script>

</body>
</html>