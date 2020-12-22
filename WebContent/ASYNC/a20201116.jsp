<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
//스크립틀릿:지역변수, 제어문가능, 인스턴스화 가능하나 scope가 없음.
//메소드 호출 가능
	out.print("비동기 출력"); 
%>
<br>
<!-- 익스프레션이라고 읽음, 출력하는 문장
스크립트릿과 비교해 둘것.
 -->
<%="비동기 출력"%>
</body>
</html>