<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제1[noCookieTest1.jsp]</title>
<script type="text/javascript">
	function test(pcb){//변수 pcb에는 0,1,2,3중 하나씩 값이 들어온다.
		for(var i=0;i<document.f_test1.cb.length;i++){
			if(pcb==i){
				document.f_test1.cb[i].checked=1;
			}else{
				document.f_test1.cb[i].checked=0;
			}
		}
	}
	function next(){
		var temp = 1;//정답은 1번 부터 이므로 1로 초기화 합니다.
		for(var i=0;i<document.f_test1.cb.length;i++){
			if(document.f_test1.cb[i].checked==1){
				document.f_test1.htest1.value=temp;
			}else{
				temp = temp + 1;
			}
		}		
		document.f_test1.submit();//다음 문제로 이동합니다. - form전송으로 페이지를 이동시킴.
	}
</script>
</head>
<body>
<form name="f_test1" method="get" action="testForm2.jsp">
<input type="hidden" name="htest1"/>
문제1. 다음 중 DML구문이 아닌 것을 고르시오.<br>
<input type="checkbox" name="cb" onChange="test(0)">select<br>
<input type="checkbox" name="cb" onChange="test(1)">insert<br>
<input type="checkbox" name="cb" onChange="test(2)">create<br>
<input type="checkbox" name="cb" onChange="test(3)">delete<br>
<br>
<input type="button" value="다음문제" onClick="next()"/>
</form>
</body>
</html>