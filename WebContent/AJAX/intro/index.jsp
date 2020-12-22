<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/easyUI_common.jsp" %>
<style type="text/css">
    div#d_login{
		border: 1px solid gray;    	
    }
	div#d_news{
		position: absolute;
	    border: 1px solid blue;
	    width: 350px;
	    height: 50px;
	    margin: 10px auto;
	    padding: 10px;
	    background-color: #333aaa;
	    color: #FFFFFF;
	}
</style>
<script type="text/javascript">
	function login(){
		var u_id = $("#tb_id").val();//사용자가 입력한 아이디 담기
		var u_pw = $("#tb_pw").val();//사용자가 입력한 비번 담기
		$.ajax({
//			url:'./loginAction2.jsp'
			url:'./login.mem?work=login&mem_id='+u_id+'&mem_pw='+u_pw+'&'+new Date().getTime()
		   ,type:'get'
		   ,success:function(data){
			   $("#d_login").text("");
	            var imsi='';            
	            imsi+='<table border="0">';
	            imsi+='<tr><td height="30px">';
	            imsi+=data;
	            imsi+='</td></tr>';
	            imsi+='<tr><td>';
	            imsi+='<a id="btn_logout" class="easyui-linkbutton" onclick="logout()">로그아웃</a>';
	            imsi+='<a id="btn_member" class="easyui-linkbutton" onclick="memberUpdate()">정보수정</a>';            
	            imsi+='</td></tr>';
	            imsi+='</table>';
			   $("#d_login").html(imsi);
		   }
		});
		//$("#d_msg").text("쿠키이름:"+$.cookie("cname"));
		alert("쿠키이름:"+$.cookie("cname"));
	}///////////////end of login
	function logout(){
		//세션을 이용하는 경우 세션정보 삭제(logout.jsp-session.invalidate(), session.removeAttribute(이름))하기 - 페이지 이동- index.jsp
		//세션의 경우 서버측에서 관리되고 캐쉬메모리 저장됨.
		//쿠키의 경우 클라이언트측 관리 text로 저장됨.
		//쿠키를 자바스크립트를 통해관리(jquery-cookie api)
		location.href="./index.jsp";
	}
	function autoReload(){
		//alert("autoReload 호출");
		$.ajax({
			url:'/AJAX/news/jsonNewsList.jsp'
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
		$("#d_news").css("left","400px")
		$("#d_news").css("top","100px")
		
	}
</script>
</head>
<body>
<div id="d_msg"></div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#d_msg").hide();
		$('#btn_login').linkbutton({
		    width:'60px'
		   ,height: '62px'
		});		
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
<table align="center" width="1000px" height="550px">
	<tr>
		<td>
		<table>
<!--==================== [[ top.jsp 시작 ]] ====================-->		
			<tr>
				<td width="1000px" height="50px">
					<%@include file="./top.jsp" %> 
				</td>
			</tr>
<!--==================== [[ top.jsp  끝  ]] ====================-->		
<!--==================== [[ main.jsp 시작 ]] ====================-->		
			<tr>
				<td>
				<table width="1000px" height="470px">
					<tr>
<!--==================== [[ menu.jsp 시작 ]] ====================-->		
						<td width="200px" height="470px">
						<%@include file="./menu.jsp" %>						
						</td>
<!--==================== [[ body.jsp 시작 ]] ====================-->		
						<td>
						<%@include file="./body.jsp" %>												
						</td>
					</tr>
				</table>
				</td>
			</tr>
<!--==================== [[ main.jsp  끝  ]] ====================-->		
<!--==================== [[ bottom.jsp 시작 ]] ====================-->		
			<tr>
				<td width="1000px" height="30px">
				<%@include file="./bottom.jsp" %> 				
				</td>
			</tr>
<!--==================== [[ bottom.jsp 끝    ]] ====================-->					
		</table>
		</td>
	</tr>
</table>
</body>
</html>