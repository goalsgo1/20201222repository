<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동 갱신 처리 - 샘플</title>
<%@ include file="/common/easyUI_common.jsp" %>
<style type="text/css">
	div#d_news{
		position: absolute;
	}
</style>
<script type="text/javascript">
	function autoReload(){
		//alert("autoReload 호출");
		$.ajax({
			url:'jsonNewsList.jsp'
			,type:'post'
			,dataType:'html'
			,success:function(data){
				//alert("서버에서 가져오는 뉴스 정보");
				$("#d_news").html(data);//태그 번역, 내용만 출력 
			},error:function(e){
				$("#d_msg").show();
				$("#d_msg").text(e.responseText);
			}
		});//////////////end of ajax
		$("#d_news").css("left","300px")
		$("#d_news").css("top","100px")
		
	}
</script>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#d_msg").hide();
		var watch;
		function start(){
			watch=setInterval(autoReload, 5000);
		}/////////////////end of start
		function stop(){
			setTimeout(function(){
				clearInterval(watch);
			},100000);
		}/////////////////end of stop
		start();
		stop();
	});/////////////////////end of ready
</script>
<h3>자동 갱신 페이지 구현</h3>
<!-- 뉴스 목록이 출력될 위치 (좌표값 이용 원하는 위치-CSS) -->
<div id="d_news" width="250px" height="50px">여기</div>
<div id="d_msg" width="250px" height="50px">에러 메시지출력</div>
</body>
</html>



















