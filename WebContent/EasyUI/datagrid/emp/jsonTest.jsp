<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String imsi="[{ENAME=SMITH, COMM=0, HIREDATE=1980-12-17, EMPNO=7369, MGR=7902, JOB=CLERK, DEPTNO=20, SAL=800}, {ENAME=ALLEN, COMM=300, HIREDATE=1981-02-20, EMPNO=7499, MGR=7698, JOB=SALESMAN, DEPTNO=30, SAL=1760}, {ENAME=WARD, COMM=500, HIREDATE=1981-02-22, EMPNO=7521, MGR=7698, JOB=SALESMAN, DEPTNO=30, SAL=1250}, {ENAME=JONES, COMM=0, HIREDATE=1981-04-02, EMPNO=7566, MGR=7839, JOB=MANAGER, DEPTNO=20, SAL=4791.27}, {ENAME=MARTIN, COMM=1400, HIREDATE=1981-09-28, EMPNO=7654, MGR=7698, JOB=SALESMAN, DEPTNO=30, SAL=1250}, {ENAME=BLAKE, COMM=0, HIREDATE=1981-05-01, EMPNO=7698, MGR=7839, JOB=MANAGER, DEPTNO=30, SAL=2850}, {ENAME=CLARK, COMM=0, HIREDATE=1981-06-09, EMPNO=7782, MGR=7839, JOB=MANAGER, DEPTNO=10, SAL=3528}, {ENAME=SCOTT, COMM=0, HIREDATE=1987-04-19, EMPNO=7788, MGR=7566, JOB=ANALYST, DEPTNO=20, SAL=3000}, {ENAME=KING, COMM=0, HIREDATE=1981-11-17, EMPNO=7839, JOB=PRESIDENT, DEPTNO=10, SAL=6050}, {ENAME=TURNER, COMM=0, HIREDATE=1981-09-08, EMPNO=7844, MGR=7698, JOB=SALESMAN, DEPTNO=30, SAL=1500}, {ENAME=ADAMS, COMM=0, HIREDATE=1987-05-23, EMPNO=7876, MGR=7788, JOB=CLERK, DEPTNO=20, SAL=1100}, {ENAME=JAMES, COMM=0, HIREDATE=1981-12-03, EMPNO=7900, MGR=7698, JOB=CLERK, DEPTNO=30, SAL=950}, {ENAME=FORD, COMM=0, HIREDATE=1981-12-03, EMPNO=7902, MGR=7566, JOB=ANALYST, DEPTNO=20, SAL=3000}, {ENAME=MILLER, COMM=0, HIREDATE=1982-01-23, EMPNO=7934, MGR=7782, JOB=CLERK, DEPTNO=10, SAL=1872}]";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
var result = JSON.stringify('<%=imsi%>');
var jsonDoc = JSON.parse(result);//array
alert("onload..."+jsonDoc+", "+jsonDoc.length);//조회 결과 확인
for(var i=0;i<jsonDoc.length;i++){
	   alert("empno:"+jsonDoc[i].EMPNO);
}	
</script>
</body>
</html>