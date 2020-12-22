<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.basic.Sonata" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//Sonata myCar = new Sonata();복사본이니까
	Sonata himCar = (Sonata)request.getAttribute("myCar");
	out.print(himCar.speed);//null
	//테스트 시나리오는  
%>
</body>
</html>