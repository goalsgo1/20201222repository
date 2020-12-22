<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 //이 코드에 대한 처리 주체는 톰캣이다.
 //화면으로 나오기전에 이미 결정되어 있는 값이다.
 //이 결과에 타입은 text이다.
 //text이면서 json, xml, html
 //contentType="text/html;charset=utf-8"
 //doGet(){ res.setContentType("text/html;charset=utf-8");
//여기
	//url:'XXX.jsp?mem_id=test&mem_pw=123'
	String mem_id = request.getParameter("mem_id");
	String mem_pw = request.getParameter("mem_pw");
	out.print(mem_id+", "+mem_pw);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//저기
%>
<font color="green">비동기통신</font>으로 가져온 새로운 정보
</body>
</html>