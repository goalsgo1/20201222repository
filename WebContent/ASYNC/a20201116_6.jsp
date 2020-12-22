<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %>    
<%@ page import="java.util.HashMap" %>    
<%
	List<Map<String,Object>> empList = new ArrayList<>();
	Map<String,Object> remp = new HashMap<>();
	remp.put("ename","SMITH");
	remp.put("gender",1);
	empList.add(remp);
	remp = new HashMap<>();
	remp.put("ename","JOHNS");
	remp.put("gender",0);
	empList.add(remp);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	for(int i=0;i<empList.size();i++){
		Map rmap = empList.get(i);		
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












