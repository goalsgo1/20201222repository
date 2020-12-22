<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>가변그리드-1</title>
<style type="text/css">
	*{margin:0; padding:0;}
	#wrap{
		width:90%;/* 960px */
		height:500px;
		margin:0 auto;
		border: 5px solid #000000;
	}
	#wrap div{
		width:31.25%;/* 300/960 */
		display: inline-block;
	}
	#wrap div:first-child{
		padding: 50px 5.208%;/* 50/960 */
		background:#1f518b;
	}
	#wrap div:first-child + div{
		padding: 130px 13.541%;/* 130/960 */
		background:#f7e041;
	}
	
	
</style>
</head>
<body>
	<div id="wrap">
		<div></div><div></div>
	</div>
</body>
</html>