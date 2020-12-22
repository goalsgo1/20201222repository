<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.List, java.util.HashMap" %>    
<%
	int size = 0;
	List<Map<String,Object>> empList = null;
//서블릿에서는 request.setAttribute("empList",주소번지);
	empList = 
	(List<Map<String,Object>>)request.getAttribute("empList");
	if(empList!=null){
		size = empList.size();
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr><th></th></tr>
<%	
	if(size>0){//데이터가 존재하니? 네
//	for(int i=0;i<size;i++){
	for(int i=0;i<empList.size();i++){
		if(size==i)  break;
		Map rmap = empList.get(i);
%>
		<tr><th><%=rmap.get("EMPNO") %></th></tr>
<%
	}////////////////end of for		
	}else{//조회결과가 없는데....
 %>	
		<tr><th>조회결과가 없습니다.</th></tr>
<%
	}
%>	
</table>
</body>
</html>