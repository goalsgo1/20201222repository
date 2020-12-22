<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 전[indexVer1.jsp]</title>
<!-- 공통코드 include처리 -->
<%@ include file="/common/easyUI_common.jsp" %>
	<style type="text/css">
		#d_login{
			border: 1px solid #CCCCCC;
			background: orange;
			width: 192px;
			height: 105px;
		}
	</style>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		var cname=null;//쿠키에서 가져온 이름 담기
		cname = $.cookie('cname');
		//너 로그인한 거야?
		if(cname == null){
			$("#d_login").show();
			$("#d_logout").hide();
		}else{//난 로그인하고 왔어
			$("#d_logout").show();
			$("#d_login").hide();			
		}
	});
</script>
<!-- EasyUI layout -->
<div id="lay_movie" class="easyui-layout" style="width:1000px;height:500px;">
    <div data-options="region:'west',title:'CGV',split:true" style="width:200px;">
    <!-- 마진속성을 이용해서 간격 벌리기 -->
    	<div style="margin:10px 0;"></div>
    <!--########################### [[ 로그인 영역 ]] ############################  -->
    	<div id="d_login" align="center">
    		<input id="mem_id" name="mem_id" class="easyui-textbox">
    		<script type="text/javascript">
    			$("#mem_id").textbox({
    				iconCls:'icon-man'
    			   ,iconAlign:'right'
    			   ,prompt:'아이디'
    			});
    		</script>
    		<div style="margin:3px 0;"></div>
    		<input id="mem_pw" name="mem_pw" class="easyui-passwordbox">
    		<script type="text/javascript">
    			$("#mem_pw").passwordbox({
    			    iconAlign:'right'
    			   ,prompt:'비밀번호'
    			});
    		</script>
    		<div style="margin:3px 0;"></div>
			<a href="javascript:loginAction()" class="easyui-linkbutton" 
			   data-options="iconCls:'icon-man'">로그인</a>    		
			<a href="javascript:memberAction()" class="easyui-linkbutton" 
			   data-options="iconCls:'icon-add'">회원가입</a>    		
    	</div>
    <!--########################## [[ 로그아웃 영역 시작 ]] ###########################  -->
    	<div id="d_logout" align="center">
    		<div style="margin:5px 0;"></div>
    		<div id="d_ok">강감찬님 환영합니다.</div>
    		<div style="margin:3px 0;"></div>
			<a href="javascript:loginAction()" class="easyui-linkbutton" 
			   data-options="iconCls:'icon-man'">로그아웃</a>    		
			<a href="javascript:memberAction()" class="easyui-linkbutton" 
			   data-options="iconCls:'icon-add'">정보수정</a>    
    	</div>
    <!--########################### [[ 로그아웃 영역 끝  ]] ############################  -->
    <!--########################## [[ 메뉴 트리 영역 시작  ]] ###########################  -->
    
    </div>
    <div data-options="region:'center',title:'영화예매 시스템'" style="padding:5px;background:#eee;"></div>	
</div>
</body>
</html>















