<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Enumeration, java.util.HashMap" %>
<%@ page import="java.util.Map, com.util.HashMapBinder" %>
<%
//viewParameterVer2.jsp로 저장해주세요.
//HashMapBinder를 사용하여 사용자가 입력한 값을 출력해 보시오.
	request.setCharacterEncoding("utf-8");
%>
<html>
<head><title>요청 파라미터 출력</title></head>
<body>
<b>request.getParameter() 메서드 사용</b><br>
<%
	 HashMapBinder hmb = new HashMapBinder(request);
	//insert here
	 Map<String,Object> pmap = new HashMap<>();
	 hmb.bind(pmap);
	 //Map의 구조 이므로 키값을 가져와야 함.
	 Object obj[]= null;
	 obj = pmap.keySet().toArray();
	 for(int i=0;i<obj.length;i++){
		 String key = (String)obj[i];
		if("name".equals(key)){
			out.print("name 파라미터 ="+ pmap.get(key)+"<br>");
		}
		if("address".equals(key)){
			out.print("address 파라미터 ="+ pmap.get(key)+"<br>");
		}
		if("h_imsi".equals(key)){
			out.print("hidden속성 값 ="+ pmap.get(key)+"<br>");
		}
	 }///////////////////end of for
%>
여러가지 언어가 한꺼번에 등장하므로 위치, 영역에 기준 꼭 세워본다.
<p>
<b>request.getParameterValues() 메서드 사용</b><br>
<%
	String[] values = request.getParameterValues("pet");
	if (values != null) {
	for (int i = 0 ; i < values.length ; i++) {
%>
	<%= values[i] %>
<%
		}
	}
%>
<p>
<b>request.getParameterNames() 메서드 사용</b><br>
<%
	Enumeration paramEnum = request.getParameterNames();
	while(paramEnum.hasMoreElements()) {
		String name = (String)paramEnum.nextElement();
%>
		<%= name %>
<%
	}
%>
<p>
<b>request.getParameterMap() 메서드 사용</b><br>
<%
	Map parameterMap = request.getParameterMap();
	String[] nameParam = (String[])parameterMap.get("name");
	if (nameParam != null) {
%>
name = <%= nameParam[0] %>
<%
	}
%>
</body>
</html>
