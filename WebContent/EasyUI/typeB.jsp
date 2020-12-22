<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>typeB.jsp</title>
<script type="text/javascript">
	function send(){
		document.f_test.method="get";
		document.f_test.action="./a3.do";
		document.f_test.submit();
	}
</script>
</head>
<body>
<form name="f_test" action="./a3.do" method="post">
<input type="button" onclick="send()">
</form>
</body>
</html>