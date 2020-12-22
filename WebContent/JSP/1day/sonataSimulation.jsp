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
<!-- 나는 xml이다. jsp는 namespace이다. 태그이름 useBean -->
<jsp:useBean id="myCar" scope="page" class="com.basic.Sonata"/>
<%
	myCar.speed = 10;
	out.print(myCar.speed);//브라우저에 출력하기
	Sonata herCar = new Sonata();
	herCar.speed = 100;
	out.print("<br>");
	out.print(herCar.speed);//브라우저에 출력하기
	//response.sendRedirect("result.jsp");
	request.setAttribute("myCar", myCar);
	RequestDispatcher view = 
			request.getRequestDispatcher("result.jsp");
	view.forward(request,response);
%>
</body>
</html>