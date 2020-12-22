<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function methodA(){
			document.write("<b>html</b>");
		}
	</script>
</head>
<body>
여기<!-- html영역 -->
<script type="text/javascript">
//자바스크립트
	document.write("<b>ajax</b>");
</script>
<input type="button" onclick="methodA()">
</body>
</html>