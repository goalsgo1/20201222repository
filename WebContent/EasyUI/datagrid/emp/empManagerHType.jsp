<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원관리(empManagerCType.html)</title>
<!-- 공통코드 추가 시작 
나중에는 이것들을 include를 사용해서 한 줄 추가로 하면 좋을거 같아요.
-->
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
    <style type="text/css">
        
    	#d_msg {
    		border: 5px solid orange;
    		width: 700px;
    		height: 120px;
    	}
    </style>
<!-- 공통코드 추가   끝  -->
	<script type="text/javascript">
	    var g_cnt=0;//사용자가 선택한 로우의 갯수 담기 - 선택은 개발자가 아니라 업무 담당자가 한다. - 컬럼을 선택할 것인가 아니면 로우를 선택할 것인가? - 한번 클릭으로 정할 것인가 아니면 더블 클릭으로 정할까?
	    var g_empno = 0;//만일 0이면 선택을 안한 경우 이다.		
    	var v_date;//사용자가 선택한 날짜 정보를 담을 변수 선언.
        var editIndex = undefined;
    	var g_address;
    	/* param1:사용자가 searchbox에 입력한 값
    	   param2:searchbox에 등록한 name값-jsp나 서블릿에서 사용자가 입력한 값을 요청할 때
    	   ==> request.getParameter("sb_keyword")
    	*/
    	///////////////////////////[[[[ 우편번호 탐색기 추가 시작 ]]]]//////////////////////////
    	function zipcode_search(){
    		var u_dong = $("#dong").val();//document.getElementById("dong").value	
    		if(u_dong == null || u_dong.length<1){
    			alert("동을 입력하세요.");
    			return;
    		}else{
    			$("#dg_zipcode").datagrid({
    				url:"jsonZipCodeList.jsp?dong="+u_dong
    			});
    		}
    	}
        ////////////////////[[데이터그리드에서 입력|수정|삭제하기 시작]]////////////////////////
        function empUpdate(){
    		alert("g_empno : "+g_empno);
    		   //$.messager.progress();
    		if(g_cnt==0 | g_empno==0){
    			$.messager.alert('INFO','수정할 사원을 선택하세요');
    			return;//empUpdate() 탈출
    		}   
    		else{
    			//before-오라클서버에 언제 갔다와야 하나요? - 전에 갔다오는 게 좋을 거 같아요 왜냐하면 화면이 열리기 전에 값이 결정되기 때문이죠
    			//어떤 테이블에 갔다와야 하는건가요? emp		=> 서버에서 처리됨- select -> 1건
    			$.ajax({
    				url:'../../getEmpList2.jsp?h_empno='+g_empno //xxx.jsp?empno=7566[사용자가 선택한 로우에서 가져옴]
    			   ,datatype:'json'// or html or xml
    			   ,success:function(data){
    				   //$("#d_msg").append(data);//json포맷형식
    				   var result = JSON.stringify(data);
    				   //alert("result:"+result);
    				   var arr = JSON.parse(result);
    				   for(var i=0;i<arr.length;i++){
    					   $("#u_empno").numberbox('setValue',arr[i].EMPNO);//초기화
    					   $("#u_ename").textbox('setValue',arr[i].ENAME);//초기화
    					   $("#u_deptno").combobox('setValue',arr[i].DEPTNO);//초기화
    					   $("#u_job").textbox('setValue',arr[i].JOB);//초기화
    					   $("#u_hiredate").textbox('setValue',arr[i].HIREDATE);//초기화
    					   $("#u_sal").numberbox('setValue',arr[i].SAL);//초기화
    					   $("#u_comm").numberbox('setValue',arr[i].COMM);//초기화
    					   //alert(arr[0].ENAME);//유효한지 여부 체크하기-토드
    				   }
    			   }
    			});
    			$("#dlg_empUPD").dialog('open');	//브라우저
    			//after
    			
    		}
    	}
        function insert(){
   			var row = $('#dg_emp').datagrid('getSelected');//선택한 로우의 번호 가져옴 null
   			$("#d_msg").append('row:'+row+'<br>');//null
			if (row){
				var index = $('#dg_emp').datagrid('getRowIndex', row);
			} else {
				index = 0;
			}
			$('#dg_emp').datagrid('insertRow', {
				index: index
			   ,row:{
				   CK: 0
				  ,EMPNO: 0
				  ,ENAME:''
				  ,JOB:''
				  ,SAL:'0.0'
				  ,COMM:'0.0'
				  ,DEPTNO:''
			   }
			});
   			$("#d_msg").append('index:'+index+'<br>');
			$('#dg_emp').datagrid('selectRow',index);
			$('#dg_emp').datagrid('beginEdit',index);    		
    	}
    	function getRowIndex(target){
   			$("#d_msg").append('target:'+target+'<br>');    		
    	    var tr = $(target).closest('tr.datagrid-row');
    	    return parseInt(tr.attr('datagrid-row-index'));
    	}
    	function editrow(target){
    	    $('#dg_emp').datagrid('beginEdit', getRowIndex(target));
    	}
    	function deleterow(target){
    	    $.messager.confirm('Confirm','Are you sure?',function(r){
    	        if (r){
    	            $('#dg_emp').datagrid('deleteRow', getRowIndex(target));
    	        }
    	    });
    	}
    	function saverow(target){
    	    $('#dg_emp').datagrid('endEdit', getRowIndex(target));
    	}
    	function cancelrow(target){
    	    $('#dg_emp').datagrid('cancelEdit', getRowIndex(target));
    	}    	
        ////////////////////[[데이터그리드에서 입력|수정|삭제하기 끝]]////////////////////////
    	
        function empSearch(){
            //화면에 갱신처리 하기
            //페이지를 이동해야 하는가?
            //아니면 현재 보고 있는 페이지에서 처리가능한가?-갱신처리 가능
            //datagrid를 활용함. -url통해서 jsp 혹은 서블릿을 경유		
            $("#dg_emp").datagrid({
            	url:'../../getEmpList2.jsp?cols='+$("#cb_gubun").val()+"&keyword="+$("#sb_keyword").val()/* 전체조회와 조건검색 조회를 하나의 메소드로 할지|다른 메소드 할지 결정해야 함. */
               ,method:'post'
               /**/
               ,onLoadSuccess:function(data){
            	   var result = JSON.stringify(data);
            	   alert("onload..."+result);//조회 결과 확인
               }
            	   
            });
        }    	
        function empSearch2(){	
            $("#dg_emp").datagrid({
            	url:'../../getEmpList2.jsp?cols='+$("#cb_gubun").val()+"&keyword="+$("#tb_keyword").val()/* 전체조회와 조건검색 조회를 하나의 메소드로 할지|다른 메소드 할지 결정해야 함. */
               ,method:'post'
               /**/
               ,onLoadSuccess:function(data){
            	   var result = JSON.stringify(data);
            	   alert("onload..."+result);//조회 결과 확인
               }
            	
            });
        }    	
        function empSearch3(){	
        	var keyword;//사용자가 입력한 값 담기
        	if($("#tb_keyword").val().length>0){
        		keyword=$("#tb_keyword").val();
        	}
        	if($("#sb_keyword").val().length>0){
        		keyword=$("#sb_keyword").val();
        	}
        	$("#d_msg").append(tb_keyword+","+sb_keyword+","+keyword+"<br>");
            $("#dg_emp").datagrid({
            	url:'../../getEmpList2.jsp?cols='+$("#cb_gubun").val()+"&keyword="+keyword
            			+"&timestamp="+new Date().getTime()/* 전체조회와 조건검색 조회를 하나의 메소드로 할지|다른 메소드 할지 결정해야 함. */
               /**/
               ,onLoadSuccess:function(data){
            	   var result = JSON.stringify(data);
            	   alert("onload..."+result);//조회 결과 확인
               }
            
            });
            keyword='';
            $("#tb_keyword").textbox('setValue','');
            $("#sb_keyword").searchbox('setValue','');
        }    	
        function endEditing(){
            if (editIndex == undefined){return true}
            if ($('#dg_emp').datagrid('validateRow', editIndex)){
                $('#dg_emp').datagrid('endEdit', editIndex);
                editIndex = undefined;
                return true;
            } else {
                return false;
            }
        }
        function onClickCell(index, field){
            if (editIndex != index){
                if (endEditing()){
                    $('#dg_emp').datagrid('selectRow', index)
                            .datagrid('beginEdit', index);
                    var ed = $('#dg_emp').datagrid('getEditor', {index:index,field:field});
                    if (ed){
                        ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
                    }
                    editIndex = index;
                } else {
                    setTimeout(function(){
                        $('#dg_emp').datagrid('selectRow', editIndex);
                    },0);
                }
            }
        }
        /*
        function onEndEdit(index, row){
            var ed = $(this).datagrid('getEditor', {
                index: index,
                field: 'EMPNO'
            });
            //row.DEPTNO = $(ed.target).combobox('getText');
        }
        */
        function append(){
            if (endEditing()){
                $('#dg_emp').datagrid('appendRow',{status:'P'});
                editIndex = $('#dg_emp').datagrid('getRows').length-1;
                $('#dg_emp').datagrid('selectRow', editIndex)
                        .datagrid('beginEdit', editIndex);
            }
        }
        function removeit(){
            if (editIndex == undefined){return}
            $('#dg_emp').datagrid('cancelEdit', editIndex)
                    .datagrid('deleteRow', editIndex);
            editIndex = undefined;
        }
        function acceptit(){
            if (endEditing()){
                $('#dg_emp').datagrid('acceptChanges');
            }
        }
        function reject(){
            $('#dg_emp').datagrid('rejectChanges');
            editIndex = undefined;
        }
        function getChanges(){
            var rows = $('#dg_emp').datagrid('getChanges');
            alert(rows.length+' rows are changed!');
        } 	
		//너 조회할거야?
		function empList(){
			$("#d_msg").append("empList호출 성공<br>");
			$("#dg_emp").datagrid({
			   url: "../emp.json"/* 서버의 이전이나 소스의 재사용성을 고려하여 상대경로로 작성할것. */	
			});
		}						
	</script>
</head>
<body>
<script type="text/javascript">	
	$(document).ready(function (){
		var t =  $('#dong');
		$("#dlg_zipcode").dialog({
			title:'우편번호 검색기'
		   ,width:650
		   ,height: 550
		   ,closed:true
		});//////////////////end of datagrid
		$("#dg_zipcode").datagrid({
			title:'우편번호 찾기 검색 결과'
		   ,columns:[[
			   {field: 'zipcode', title:'우편번호', width:100, align:'center'}
			  ,{field: 'address', title:'주소', width:350, align:'left'}
		   ]]
		});//////////////////end of datagrid
		t.textbox('textbox').bind('keydown', function(e){
			if(e.keyCode == 13){
				alert("엔터를 쳤을 때....");
				$("#dg_zipcode").datagrid({
					url:'jsonZipCodeList.jsp?dong='+$(this).val()
				   ,singleSelect:true
				   ,onLoadSuccess:function(data){
					   alert("data" +data);
				   }
				   ,onSelect:function(index,row){
					   g_address = row.address;
				   }
				   ,onDblClickCell:function(index,field, value){
					   //우편번호를 선택한 거야?
					   if("zipcode"==field){
						   alert("value: "+value);
						   $("#zipcode").textbox('setValue',value);
						   $("#mem_addr").textbox('setValue',g_address);
						   $("#dg_zipcode").datagrid('clearSelections');
						   $("#dlg_zipcode").dialog('close');
					   }
				   }
				});
			}
		});
		$("#btn_zipcode").linkbutton({
			onClick:function(){
				alert("찾기 버튼");
				$("#dlg_zipcode").dialog({
					closed: false
					,title:'우편번호 검색기'
				});
			}
		});/////////////end of 우편번호 찾기
		//텍스트박스 초기화 및 설정
		$("#tb_keyword").textbox('textbox').bind('keydown', function(e){
			if (e.keyCode == 13){	// when press ENTER key, accept the inputed value.
				alert("엔터 이벤트");
				//empSearch();
				//empSearch2();
				empSearch3();
			}
		});
		//콤보박스 초기화 및 설정하기
		$("#cb_gubun").combobox({
			data: [
				{cols:'empno', label:'사원번호'},
				{cols:'ename', label:'사원명'},
				{cols:'sal', label:'급여'}
			]
		   ,onSelect:function(rec){//콤보에서 선택했을때 @param:object로 로우에 주소번지를 갖는다. row.empno, row.ename
			   alert("선택한 로우의 컬럼정보:"+rec.cols);
		   }
		});
		//데이터그리드 초기화 및 설정하기
		$("#dg_emp").datagrid({
			   //url: "../../getEmpList2.jsp"/* 서버의 이전이나 소스의 재사용성을 고려하여 상대경로로 작성할것. */	
			   toolbar:'#tbar_emp'
			  ,singleSelect:true
		   	  ,columns:[[
		                 {field:'CK',checkbox:true, width:50, align:'center'}
		                ,{field:'EMPNO',title:'사원번호',width:150, editor:'text'}
		                ,{field:'ENAME',title:'사원명',width:150, editor:'text'}
		                ,{field:'JOB',title:'job',width:150, editor:'text'}
		                ,{field:'MGR',title:'그룹번호',width:150, editor:'text', hidden: 'true'}
		                ,{field:'SAL',title:'급여',width:150, editor:'text'}
		                ,{field:'HIREDATE',title:'입사일자',width:150, editor:'text', hidden: 'true'}
		                ,{field:'COMM',title:'인센티브',width:150, editor:'text'}
		                ,{field:'DEPTNO',title:'부서번호',width:150,
		                    editor:{
		                    	type:'combobox'
		                       ,options:{
		                    	   valueField: 'DEPTNO'//실제 서버에 넘어가는 필드
		                    	  ,textField: 'DNAME'
		                    	  ,url:'http://localhost:9000/EasyUI/geDeptList.jsp'
		                       }
		                    }
		                }
		               ,{field:'action',title:'Action',width:120,align:'center',
		                    formatter:function(value,row,index){
		                        if (row.editing){
		                            var s = '<a href="javascript:void(0)" onclick="saverow(this)">Save</a> ';
		                            var c = '<a href="javascript:void(0)" onclick="cancelrow(this)">Cancel</a>';
		                            return s+c;
		                        } else {
		                            var e = '<a href="javascript:void(0)" onclick="editrow(this)">Edit</a> ';
		                            var d = '<a href="javascript:void(0)" onclick="deleterow(this)">Delete</a>';
		                            return e+d;
		                        }
		                    }
		                }
		       ]]	
				,onDblClickRow: function(index,row){
					g_cnt = 1;
					g_empno = row.EMPNO;//0-> 7499
				}
               //,onClickCell: onClickCell
               //,onEndEdit: onEndEdit
//////////////////////////////////////[[데이터그리드관련 이벤트핸들러 이름 시작]]/////////////////////////////////////////               
               /* */
               ,onEndEdit:function(index,row){
                   var ed = $(this).datagrid('getEditor', {
                       index: index,
                       field: 'productid'
                   });
                   //row.productname = $(ed.target).combobox('getText');
               }
              
               ,onBeforeEdit:function(index,row){
                   row.editing = true;
                   $(this).datagrid('refreshRow', index);
               },
               onAfterEdit:function(index,row){
                   row.editing = false;
                   $(this).datagrid('refreshRow', index);
               },
               onCancelEdit:function(index,row){
                   row.editing = false;
                   $(this).datagrid('refreshRow', index);
               }
//////////////////////////////////////[[데이터그리드관련 이벤트핸들러 이름  끝]]/////////////////////////////////////////               
               
			});	
	});
</script>
<!-- 이 페이지에 대한 에러 메시지나 힌트문을 출력하자. -->
<div id="d_msg"></div>
<!--================== [[ToolBar 추가하기 시작]] =================-->
<div id="tbar_emp">
	<!-- 테이블 태그를 활용하여 조건 검색하는 화면을 추가하고 그 아래 버튼을 배치하시오. -->
	<table border="0" width="100%">
	<!-- 조건 검색 화면 시작 -->	
		<tr>
			<td>
			<table border="0">
				<tr>
					<td width="300px">
					<label width="100px">사원번호</label>
					<input id="nb_empno" class="easyui-numberbox" value="0">
					</td>
					<td width="300px">
					<label width="70px">급여</label>
					<input id="nb_sal" class="easyui-numberbox" value="0">
					</td>
					<td width="400px"><input id="dd_hiredate" label="입사일자" class="easyui-datebox" style="width:200px;" required="required" ></td>
				</tr>
				<tr>
<!-- combobox추가 시작(위치선택, 공간 확보, 코드 추가) 이름|job|부서번호-->				
					<td width="1000px" colspan="3">
					<label width="100px">검색분류</label>
<!--======================== 이순신 2020.11.02 추가 시작 =======================-->					
					<input id="cb_gubun" class="easyui-combobox" data-options="
					        valueField: 'cols',
					        textField: 'label'">					
<!--======================== 이순신 2020.11.02 추가   끝  =======================-->		
					<input id="sb_keyword" name="sb_keyword" class="easyui-searchbox" data-options="searcher:empSearch3,prompt:'Please Input Value'" style="width:300px">			
					<input id="tb_keyword" name="tb_keyword" class="easyui-textbox" onclick="empSearch3()" data-options="prompt:'Please Input Value'" style="width:300px">			
					</td>
<!-- combobox추가 시작 -->				
				</tr>
			</table>		
			</td>
		</tr>
	<!-- 조건 검색 화면  끝  -->	
	<!-- 업무관련 버튼 시작 -->	
		<tr>
			<td>
               <a href="javascript:void(0)" class="easyui-linkbutton" onclick="insert()">Insert Row</a>			
			   <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="empList()">조회</a>
			   <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addEmp()">입력</a>
			   <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="empUpdate()">수정</a>
			   <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="removeEmp()">삭제</a>
			</td>
		</tr>
	<!-- 업무관련 버튼   끝   -->	
	</table>
</div>
<!--================== [[ToolBar 추가하기   끝 ]] =================-->
<table id="dg_emp" class="easyui-datagrid" width="1100" title="사원관리" data-options="onDblClickRow:function(index,row){var ename=row.ENAME}">	
</table>

<!--================== [[사원카드 등록 하기  시작 ]] =================-->
<div id="dlg_empINS" class="easyui-dialog" data-options="closed:false, title:'사원정보 등록'">
	<form id="f_empINS">
	
	</form>
	<div>
			   <a href="javascript:updAction()" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="empList()">저장</a>
			   <a href="javascript:$('#dlg_empINS').dialog('close')" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="addEmp()">닫기</a>
	</div>
</div>
<!--================== [[사원카드 등록 하기    끝  ]] =================-->
<!--================== [[우편번호 찾기  시작 ]] =================-->
<div id="dlg_zipcode" class="easyui-dialog" data-options="closed:true">
	<input class="easyui-textbox" id="dong" name="dong" 
	       labelPosition="top" style="width:210px"
	       data-options="prompt:'동이름을 입력하세요'">
	<a href="javascript:zipcode_search()" id="btn_search" class="easyui-linkbutton">찾기</a> 
	<div style="margin-bottom:10px;"></div>
	<table id="dg_zipcode" class="easyui-datagrid"></table>      
</div>
<!--================== [[우편번호 찾기    끝  ]] =================-->
<!--================== [[사원카드 수정 하기  시작 ]] =================-->
<div id="dlg_empUPD" style="width:600px; padding:30px 30px;" class="easyui-dialog" data-options="closed:true, title:'사원정보 수정', footer:'#d_upd'">
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
          data-options="prompt:'Enter a 부서번호'
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
	<!-- a태그는 문단이동 혹은 링크 마지막 자바스크립트 함수 호출 가능함. 
	data-options="toolbar:#tbar_emp",  footer:'#d_upd'
	-->
	<div id="d_upd" style="margin-bottom:10px" align="right">   
	   <a href="javascript:updAction()" class="easyui-linkbutton" iconCls="icon-save" plain="true">저장</a>
	   <a href="javascript:$('#dlg_empUPD').dialog('close')" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">닫기</a>
	</div>
	</div>
</div>
<!--================== [[사원카드 수정 하기    끝  ]] =================-->



</body>
</html>



























