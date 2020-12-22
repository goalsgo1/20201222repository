<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String test1 = request.getParameter("htest1");
	out.print("1번 문제 답안 - "+test1);
	Cookie c = new Cookie("test1",test1);
	c.setMaxAge(60*60);
	response.addCookie(c);//이코드 없으면 저장안됨 주의할것.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function test(pcb){
		for(var i=0;i<document.f_test1.cb.length;i++){
			if(pcb==i){
				document.f_test1.cb[i].checked=1;
			}else{
				document.f_test1.cb[i].checked=0;
			}
		}		
	}
	function prev(){//이건 이전 문제를 볼 때쓰고....
		location.href="testForm1.html";
	}
	function next(){//다음 문제 보고 싶어? 눌러봐
		var temp = 1;//정답은 1번 부터 이므로 1로 초기화 합니다.
		for(var i=0;i<document.f_test1.cb.length;i++){
			if(document.f_test1.cb[i].checked==1){
				document.f_test1.htest2.value=temp;
			}else{
				temp = temp + 1;
			}
		}		
		document.f_test1.submit();//다음 문제로 이동합니다. - form전송으로 페이지를 이동시킴.		
	}
</script>
</head>
<body>
<form name="f_test1" method="get" action="testForm3.jsp">
<input type="hidden" name="htest2"/>
문제2. 다음 중 DDL구문이 아닌 것을 고르시오.<br>
<input type="checkbox" name="cb" onChange="test(0)">create<br>
<input type="checkbox" name="cb" onChange="test(1)">drop<br>
<input type="checkbox" name="cb" onChange="test(2)">alter<br>
<input type="checkbox" name="cb" onChange="test(3)">delete<br>
<input type="button" value="이전문제" onClick="prev()"/>
<input type="button" value="다음문제" onClick="next()"/>
</form>
</body>
</html>