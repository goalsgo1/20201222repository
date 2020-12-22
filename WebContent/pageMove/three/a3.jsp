<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a3.jsp</title>
<script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
</head>
<body>
<div id="d_result"></div>
<script type="text/javascript">
	$(document).ready(function (){
		$.ajax({
			url:'b3.jsp'
		   ,dataType:'html'
		   ,success:function(data){
			   $("#d_result").html(data);
		   }
		});
	});
</script>
 after
</body>
</html>