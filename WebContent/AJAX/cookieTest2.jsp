<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키관리 2번째[jquery API활용하기]</title>
<style type="text/css">
	#d_cookie{
		border: 1px solid black;
		background: pink;
		width: 500px;
		height: 250px;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn_make").click(function(){
			$.cookie('c_id','tomato');
			$.cookie('c_gender','남자'
					,{expires:1, path:'/dev_html/ajax', domain:'localhost', secure: false});
			$.cookie('c_name','이순신',{expires:7, path:'/', domain:'localhost', secure: false});
		});
		$("#btn_update").click(function(){
			$.cookie('c_id','apple');
		});
		$("#btn_delete").click(function(){
			$.cookie('c_id',null);
		});
		$("#btn_move").click(function(){
			location.href="cookieMove.jsp";
		});
		$("#btn_confirm").click(function(){
			$("#d_cookie").append('c_id:'+$.cookie('c_id')+"<br>");
			$("#d_cookie").append('c_gender:'+$.cookie('c_gender')+"<br>");
			$("#d_cookie").append('c_name:'+$.cookie('c_name')+"<br>");
		});
	});
</script>
<div id="d_cookie">쿠키정보 전광판<br><br></div>
<br><br>
<button id="btn_make">쿠키생성</button>
<button id="btn_update">쿠키수정</button>
<button id="btn_delete">쿠키삭제</button>
<button id="btn_move">페이지이동</button>
<button id="btn_confirm">쿠키값 확인</button>
</body>
</html>