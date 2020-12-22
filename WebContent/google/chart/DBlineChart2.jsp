<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import="java.util.List, java.util.Map"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="web.mvc.EmpDao"%>
<%
	//마이바티스 활용하여 조회하기
	//emp  : 사원번호, 급여, 인센티브
	//SELECT empno, sal, NVL(comm,0) as "comm" FROM emp
	int size = 0;
	EmpDao eDao = new EmpDao();
	//List<Map<String,Object>> empList = null;
	List<Map<String,Object>> empList = new ArrayList<>();//empList.size()=0이다.
	 empList = eDao.getEmpList(null);
	if(empList!=null){
		size = empList.size();
	}
%>	
  <html>
  <head>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>  
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  
/*     	  $.ajax({
    		  url:'./jsonEmpList.jsp'
    		 ,dataType:'json'
    		 ,success:function(data){
    			 alert(data);
    			 var result = JSON.stringify(data);
    			 alert(result);
    			 var docArr = JSON.parse(result);//array
    			 alert(docArr);
    			 for(var i=0;i<docArr.length;i++){
    				 var v_empno = docArr[i].EMPNO;
    			 }
    		 }
    	  }); */
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses']
<%
		for(int i=0;i<size;i++){
			Map<String,Object> rmap = empList.get(i);
%>
          ,['<%=rmap.get("EMPNO").toString()%>',  <%=rmap.get("SAL")%>,  <%=400%>]
<%
		}
%>
          ]);

        var options = {
          title: 'Company Performance',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="curve_chart" style="width: 900px; height: 500px"></div>
  </body>
</html>
