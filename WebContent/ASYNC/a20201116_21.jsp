<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.List, java.util.HashMap" %>    
<%
	int size = 0;
	List<Map<String,Object>> empInfo = null;
//서블릿에서는 request.setAttribute("empList",주소번지);
	empInfo = 
	(List<Map<String,Object>>)request.getAttribute("empInfo");
	if(empInfo!=null){
		size = empInfo.size();
	}
%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
</head>
<body>
<table border="1" borderColor="green">
<!-- header 영역 시작 -->
	<tr>
		<th>이름</th>
		<th>성별</th>
	</tr>
<!-- header 영역 끝 -->
<%
	for(int i=0;i<size;i++){
		Map rmap = empInfo.get(i);		
%>	
	<tr>
		<td><%=rmap.get("ename") %></td>
		<td>
<!-- 너 1이니? -->		
<!-- 아니면  0이니? -->
<%
	if("1".equals(rmap.get("gender").toString())){
%>		
남자
<%
	}
	else if("0".equals(rmap.get("gender").toString())){
%>
여자
<%
	}
%>
		</td>
	</tr>
<%
	}///////////////////////end of for
%>
</table>
</body>
</html>