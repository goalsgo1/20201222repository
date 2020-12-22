<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//여기는 자바땅
	String name = request.getParameter("t_name");
	String addr = request.getParameter("t_addr");
	String good = request.getParameter("t_good");
	out.print("이글자 : "+"<b>"+name+"</b>");
	//document.write()
%>
<!-- 여기는 html영역 -->
<table border="1">
	<tr>
		<td><%out.print(addr); %></td>
	</tr>
</table>