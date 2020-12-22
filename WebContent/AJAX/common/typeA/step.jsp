<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 공통코드 삽입 시작 
	같은 프로젝트이고 같은 UI/UX솔루션을 사용한다.
	jsp상에 선언문도 중복되니까 한번만 작성해야 함.
-->
<%@ include file="/common/easyUI_common.jsp" %>
<!-- 공통코드 삽입   끝  -->
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			url:"innerStep1.jsp?mem_id=apple&mem_pw=123"
		   ,dataType:"html"//or json or xml or text
			//jsonTest.jsp                      
		   ,success:function(data){
			   //document.getElementById().innerText="";
			   //document.getElementById().innerHTML="";
			   //$("#d_result").text(data);
			   $("#d_result").html(data);
		   }
		});
	});
</script>
<div id="d_result">여기</div>
</body>
</html>