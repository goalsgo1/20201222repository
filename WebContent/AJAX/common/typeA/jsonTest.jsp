<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- application/hwp, application/excel -->
<%
	Gson g = new Gson();
	String imsi = g.toJson(주소번지:List<Map>, List<VO>);
	out.print(imsi);
%>
<script>
	var result = JSON.stringify(imsi);
	var array = JSON.parse(result);
	var temp = '';
	for(var v=0;v<array.length;v++){
		temp+="<b>"+array[v].empno+"</b>";
		temp+="<td>"+array[v].ename+"</td>";
	}
	$("#d_msg").html(temp);//웹 표현
</script>
<div id="d_msg"></div>