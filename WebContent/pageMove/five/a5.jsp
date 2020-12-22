<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map"%>
<%@ page import="java.util.ArrayList"%>    
<%
	List<Map<String,Object>> deptList = 
	(List<Map<String,Object>>)request.getAttribute("deptList");
	out.print("deptList.size():"+deptList.size());
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a5.jsp</title>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
</head>
<body>
<select id="cc" class="easyui-combobox" name="dept" style="width:200px;">
    <option value="aa">aitem11</option>
<%
	for(int i=0;i<deptList.size();i++){
		Map<String,Object> rmap = deptList.get(i);
%>    
    <option><%=rmap.get("DNAME") %></option>
<%
	}
%>
</select>
</body>
</html>