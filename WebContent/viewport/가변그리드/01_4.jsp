<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>가변그리드:1-4</title>
<style type="text/css">
	*{margin:0; padding:0;}
	#wrap{/* 가장 바깥쪽에 있는 div영역 */
		width:90%;/* 960px */
		height:500px;
		margin:0 auto;
		border: 5px solid #000000;
	}
	#wrap div{/* div내부에 있는 div전체 적용 */
		width:31.25%;/* 300/960 */
		height: 100%;
		display: inline-block;
	}
	#wrap div:first-child{
		margin-right: 37.5%;
		background:#1f518b;
	}
	#wrap div:first-child + div{
		background:#f7e041;/* 색상만 다르게 표시 */
	}
	
	
</style>
</head>
<body>
	<div id="wrap">
		<div></div><div></div>
	</div>
</body>
</html>