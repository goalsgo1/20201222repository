<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키에 담긴 정보 읽어 오기[cookieRead.jsp]</title>
</head>
<body>
<%
//서버가 클라이언트에 저장되어 있는 문자열을 요청해 하니까 요청객체를 사용해야 한다
//jsp페이지마다 request와 response객체가 서로 다르다.
	Cookie c_daps[] = request.getCookies();
	for(int i=0;i<c_daps.length;i++){
	    out.print(URLDecoder.decode(c_daps[i].getValue(),"utf-8")+", "+c_daps[i].getName());	
	}
%>
</body>
</html>