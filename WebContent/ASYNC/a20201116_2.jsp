<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.List, java.util.HashMap" %>        
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
<script type="text/javascript">
	$(document).ready(function(){
		$("#dg_emp").datagrid({
			//url:'./empAction.jsp' //jsp에는 오라클 연동 코드를 적지 않습니다.
			url:'/erp/empCRUD.kos?work=empAction'    //서블릿에는 화면을 그리지 않습니다.
		   ,columns:[[
			   {field:'ename', title:'라벨', width:100}
			  ,{field:'gender', title:'라벨', width:100}
		   ]]
		});
	});
</script>
<table id="dg_emp" class="easyui-datagrid"></table>
</body>
</html>