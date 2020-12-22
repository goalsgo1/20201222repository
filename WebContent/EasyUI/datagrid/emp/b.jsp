<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//파라미터값은 절대로 id는 불가함.-UI쪽에서만 사용할것.
	String b_no = request.getParameter("b_no");
	out.print("b_no:"+b_no);
	String ord_no = (String)request.getAttribute("ord_no");
	out.print("ord_no:"+ord_no);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b.jsp[도착지 페이지]</title>
<script type="text/javascript">
	function move(){
		location.href="b.jsp";
	}
</script>
</head>
<body>
여기가 결과 페이지 입니다.<br>
<input type="button" value="이동" onclick="move()">
</body>
</html>