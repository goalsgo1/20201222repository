<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var g_subcd = null;
</script>
<%@ include file="/common/easyUI_common.jsp" %>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#cb_subject").combobox({
			url:"/onLineTest/subjectList.test?timestamp="+new Date().getTime()
		   ,valueField:
		   ,textField:
		   ,onSelect: function(rec){
		    	g_subcd = rec.SUB_CD;
		    }
		});
	});
</script>
    <div class="easyui-panel" title="Test Takers" style="width:100%;max-width:400px;padding:30px 60px;">
       <form id="f_exam">
       <input type="hidden" id="work" name="work" value="onLineTest">
        <div style="margin-bottom:20px">
            <select class="easyui-combobox" id="cb_subject" label="수험과목선택:" labelPosition="top" data-options="prompt:'수험과목을 선택하세요'" style="width:100%;">
            </select>
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" label="수험번호:" id="exam_no" name="exam_no" labelPosition="top" style="width:100%;">
        </div>
        <div>
            <a href="javascript:examStart()" class="easyui-linkbutton" iconCls="icon-ok" style="width:100%;height:32px">시험시작</a>
        </div>
       </form>
       <div id="d_isOk"></div>
    </div> 
</body>
</html>