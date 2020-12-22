<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax를  활용하여 로그인 처리</title>
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
	<script type="text/javascript">
		function logoutAction(){
			$.cookie('cname',null, {expires:-1});
			  $("#mem_id").textbox('setValue','');
			   $("#mem_pw").passwordbox('setValue','');
			   $("#d_login").show();
			   $("#d_logout").hide();			
		}
		function loginAction(){
			var u_id = $("#mem_id").val();
			var u_pw = $("#mem_pw").val();
//http://localhost:9000/AJAX/layout/loginAction3.jsp?mem_id=test&mem_pw=123
//            request.getParameter("mem_id");			
			var param="mem_id="+u_id+"&mem_pw="+u_pw;
			$.ajax({
				url:'loginAction3.jsp'
			   ,type:'post'
			   ,data:param
			   ,dataType:'text'
			   ,success:function(data){
				   if("아이디가 존재하지 않습니다."==data){
					   return;//함수 탈출하기-처음부터 다시 사용할것.
				   }
				   else if("비번이 틀렸습니다."==data){
					   return;
				   }
				   else{
					   $.cookie("cname",data);
					   $("#d_login").hide();
					   $("#d_logout").show();
				   }
			   }////////////////end of success
			});/////////////////end of ajax
		}///////////////////////end of loginAction
	</script>
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
		$('#tre_movie').tree({
			onClick: function(node){
				if(node.text=='회원목록')  // alert node text property when clicked
				{
					if($.cookie("cname")!=null){
						alert("회원목록 페이지를 열어 준다.");
					}
					else{
						alert("로그인 하신 후 이용할 수 있습니다.");
						return;
					}
				}
			}////////////////end of onClick
		});
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
			<a href="javascript:logoutAction()" class="easyui-linkbutton" 
			   data-options="iconCls:'icon-man'">로그아웃</a>    		
			<a href="javascript:memberAction()" class="easyui-linkbutton" 
			   data-options="iconCls:'icon-add'">정보수정</a>    
    	</div>
    <!--########################### [[ 로그아웃 영역 끝  ]] ############################  -->
    <!--########################## [[ 메뉴 트리 영역 시작  ]] ###########################  -->
    	<ul id="tre_movie" class="easyui-tree">
	        <li data-options="state:'closed'">
	            <span>회원관리</span>  
                <ul>
                    <li>
                        <span>회원목록</span>
                    </li>
                    <li>
                        <span>회원등록</span>
                    </li>
                    <li>
                        <span>회원수정</span>
                    </li>
                    <li>
                        <span>회원탈퇴</span>
                    </li>
                </ul>	            
	        </li>      		
	        <li data-options="state:'closed'">
	            <span>예매관리</span>  
                <ul>
                    <li>
                        <span>예매조회</span>
                    </li>
                    <li>
                        <span>예매하기</span>
                    </li>
                    <li>
                        <span>예매수정</span>
                    </li>
                    <li>
                        <span>예매취소</span>
                    </li>
                </ul>	            
	        </li>      		
    	</ul>
    </div>
    <div data-options="region:'center',title:'영화예매 시스템'" style="padding:5px;background:#eee;">
		<div style="margin:5px 0;"></div>    
		<!-- 시스템 메뉴 단계 시작 -->	
		Home > 회원관리 > 회원목록
		<hr>
		<!--============================== 콘텐츠 추가 시작 ==========================-->
		<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 조건검색 추가 시작 @@@@@@@@@@@@@@@@@@@@@@@@-->
		<label>이름 : </label>	
		<input id="sb_name" class="easyui-searchbox"/>
		<label>H.P : </label>	
 		<input class="easyui-maskedbox" mask="(999) 9999-9999" style="width:140px">
		<label>생년월일 : </label>	
 		<input id="db_birth" class="easyui-datebox" style="width:140px">
		<!--============================== 콘텐츠 추가   끝  ==========================-->	
		<div style="margin:5px 0;"></div> 
		<a id="btn_sel" href="javascript:memberList()">조회</a>
		<script type="text/javascript">
			$('#btn_sel').linkbutton({
			    iconCls: 'icon-search'
			});
		</script>
		<a id="btn_ins" href="javascript:memberInsert()">입력</a>
		<script type="text/javascript">
			$('#btn_ins').linkbutton({
			    iconCls: 'icon-add'
			});
		</script>
		<a id="btn_upd" href="javascript:memberUpdate()">수정</a>
		<script type="text/javascript">
			$('#btn_upd').linkbutton({
			    iconCls: 'icon-edit'
			});
		</script>
		<a id="btn_del" href="javascript:memberDelete()">삭제</a>
		<script type="text/javascript">
			$('#btn_del').linkbutton({
			    iconCls: 'icon-remove'
			});
		</script>
		<div style="margin:5px 0;"></div> 
		<table id="dg_member"></table>
		<div id="pp" class="easyui-pagination" style="background:#efefef;border:1px solid #ccc;"
        data-options="total:3,pageSize:10">
        </div>
		<script type="text/javascript">
		$('#dg_member').datagrid({
		    //url:'datagrid_data.json', XXX.do or jsonXXX.jsp
			data: [
				 {mem_id:'test', mem_name:'김유신', mem_addr:'서울시 마포구 공덕동', hp:'010-555-8989'}
				,{mem_id:'apple', mem_name:'이영애', mem_addr:'서울시 구로구 가산동', hp:'010-7777-8989'}
				,{mem_id:'tomato', mem_name:'을지문덕', mem_addr:'서울시 서대문구 합정동', hp:'010-888-8989'}
			]		   
		    ,columns:[[
		        {field:'mem_id',title:'아이디',width:100,align:'center'}
		       ,{field:'mem_name',title:'이름',width:100,align:'center'}
		       ,{field:'mem_addr',title:'주소',width:350,align:'left'}
		       ,{field:'hp',title:'hp',width:150,align:'left'}
		    ]]
		});		
		</script>
    </div>	
</div>
</body>
</html>















