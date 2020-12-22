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
		width:31.25%;
		height:100%;
		/* inline속성값 처럼 요소들이 한 줄로 보이고 block태그에 적용할 수 있는 속성들도 사용이 가능한 속성값임. */
		display: inline-block;/* 디폴트는 블럭요소(자체크기가 정해진)이지만  인라인요소도 같이 사용*/
	}
	
	#wrap div:first-child{
		width:37.5%;/* 360p/960 */
		background:#1f518b;
	}
	#wrap div:first-child + div{
		background:#f7e041;
	}
	
</style>
</head>
<body>
	<div id="wrap">
		<div></div><div></div>
	</div>
</body>
/html>