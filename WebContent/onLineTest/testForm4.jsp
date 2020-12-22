<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String test3 = request.getParameter("htest3");
	out.print("3번 문제 답안 - "+test3);
	Cookie c = new Cookie("test3",test3);
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
location.href="testForm3.jsp";
}
function next(){//다음 문제 보고 싶어? 눌러봐
var temp = 1;//정답은 1번 부터 이므로 1로 초기화 합니다.
for(var i=0;i<document.f_test1.cb.length;i++){
	if(document.f_test1.cb[i].checked==1){
		document.f_test1.htest4.value=temp;
	}else{
		temp = temp + 1;
	}
}		
document.f_test1.submit();//다음 문제로 이동합니다. - form전송으로 페이지를 이동시킴.		
}
</script>
</head>
<body>
<form name="f_test1" method="get" action="testForm5.jsp">
<input type="hidden" name="htest4"/>
문제4. 다음 중 테이블에 대한 설명으로 틀린 것을 고르시오.<br>
<input type="checkbox" name="cb" onChange="test(0)">
row와 column으로 구성되어있다.<br>
<input type="checkbox" name="cb" onChange="test(1)">
테이블에는 반드시 index가 있어야 한다.<br>
<input type="checkbox" name="cb" onChange="test(2)">
컬럼에는 적당한 타입을 선택하고 담을 수 있는 크기도 설정할 수 있다.<br>
<input type="checkbox" name="cb" onChange="test(3)">
테이블에는 PK도 올 수 있고 FK도 올 수 있다.
<input type="button" value="이전문제" onClick="prev()"/>
<input type="button" value="다음문제" onClick="next()"/>
</form>
</body>
</html>