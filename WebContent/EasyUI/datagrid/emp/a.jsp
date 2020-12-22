<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//직접 인스턴스화 하는 경우 scope가 없다.
//page|request|session|application
	String ord_no = new String("E202011030005");
	//요청객체에 데이터를 담을 수 있음.
	request.setAttribute("ord_no", ord_no);
%>    
<!DOCTYPE html>
<!--  
get방식과 post방식을 구분할 수 있나요?

이 둘 차이점에 대해 기억하는지?
-->
<html>
<head>
<meta charset="UTF-8">
<title>a.jsp</title>
<script type="text/javascript">
	function move(){
		location.href="b.jsp?b_no=5";//이것이 get방식
	}
</script>
</head>
<body>
여기가 시작 페이지 입니다.<br>
<input type="button" value="이동" onclick="move()">
</body>
</html>