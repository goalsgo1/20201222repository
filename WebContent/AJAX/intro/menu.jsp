<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table width="100%" height="100%" border="1" borderColor="green">
	<tr>
		<td align="center" valign="top">
			<table>
<!-- 로그인 화면 시작  -->		
				<tr>
					<td width="190px" height="75px" align="left">
				<div id="d_login">	
					<table border="0">
						<tr>
						<td><input id="tb_id" class="easyui-textbox" data-options="iconCls:'icon-man', prompt:'아이디'" style="width:130px"></td>
						<td rowspan="2"><a id="btn_login" class="easyui-linkbutton" onclick="login()">로그인</a></td>
						</tr>
						<tr>
						<td><input id="tb_pw" class="easyui-textbox" data-options="iconCls:'icon-lock', prompt:'비밀번호'" style="width:130px"></td>
						</tr>
					</table>
				</div>
				<div id="d_msg"></div>
					</td>
				</tr>
<!-- 로그인  화면    끝  -->					
				
				<tr>
					<td height="25px">로그인</td>
				</tr>
				<tr>
					<td height="25px">게시판</td>
				</tr>
				<tr>
					<td height="420px">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
</table>