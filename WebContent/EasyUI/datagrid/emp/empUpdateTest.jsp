<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
</head>
<body>
<div id="dlg_empUPD" style="width:600px; padding:30px 30px;" class="easyui-dialog" data-options="closed:false, title:'사원정보 수정', footer:'#d_upd'">
	<form id="f_empUPD">
         <div style="margin-bottom:10px">
         <input class="easyui-numberbox" id="u_empno" name="empno" label="사원번호" data-options="prompt:'Enter a EmpNO'" style="width:150px">
         </div>
         <div style="margin-bottom:10px">
         <input class="easyui-textbox" id="u_ename" name="ename" label="사원명" data-options="prompt:'Enter a ENAME'" style="width:250px">
         </div>
         <div style="margin-bottom:10px">
         <input class="easyui-textbox" id="u_job" name="job" label="JOB" data-options="prompt:'Enter a JOB'" style="width:250px">
         </div>
         <div style="margin-bottom:10px">
         <input class="easyui-textbox" id="u_hiredate" name="hiredate" label="입사일자" data-options="prompt:'Enter a 입사일자'" style="width:250px">
         </div>
         <div style="margin-bottom:10px">
         <input class="easyui-numberbox" id="u_sal" name="sal" label="급여" data-options="prompt:'Enter a 급여'" style="width:250px">
         </div>         
         <div style="margin-bottom:10px">
         <input class="easyui-numberbox" id="u_comm" name="comm" label="인센티브"  data-options="prompt:'Enter a 인센티브'" style="width:250px">
         </div>         
         <div style="margin-bottom:10px">
         <input class="easyui-combobox" id="u_deptno" name="deptno" label="부서번호" style="width:250px"
          data-options="prompt:'Enter a 부서번호1'
                      ,valueField: 'DEPTNO'
                         ,textField: 'DNAME'
                         ,url: '/EasyUI/geDeptList.jsp'
                         ,onSelect: function(rec){
                      }" 
         >
         </div>         
         <div style="margin-bottom:10px">
         <input class="easyui-textbox" id="zipcode" name="zipcode" label="우편번호"  data-options="prompt:'Enter a ZIPCODE'" style="width:160px">
         <a id="btn_zipcode" href="#" class="easyui-linkbutton">우편번호찾기</a>
         </div>
         <div style="margin-bottom:10px">
         <input class="easyui-textbox" id="mem_addr" name="mem_addr" label="주소"  data-options="prompt:'Enter a ADDRESS'" style="width:420px">
         </div>	
	</form>
	<div>
	<!-- a태그는 문단이동 혹은 링크 마지막 자바스크립트 함수 호출 가능함. -->
	<div id="d_upd" style="margin-bottom:10px" align="right">   
	   <a href="javascript:updAction()" class="easyui-linkbutton" iconCls="icon-save" plain="true">저장</a>
	   <a href="javascript:$('#dlg_empUPD').dialog('close')" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">닫기</a>
	</div>
	</div>
</div>
</body>
</html>