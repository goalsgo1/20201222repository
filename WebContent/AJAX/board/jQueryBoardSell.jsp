<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보드 판매량 - 마진금액 계산</title>
<script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
<style type="text/css">
   body {
      font-family: sans-serif;
      text-align: center;
   }
   table {
       margin-left: auto;
       margin-right: auto;
      border: 1px solid black;
   }
   td,th {
      border: 1px dotted gray;
      text-align:center;
   }
   th {
      background-color: #FFAAAA;
   }
</style>
<script type="text/javascript">
	//span태그가 가지고 있는 텍스트 노드값을 읽어오기
	function getText(el){
	   var text="";
	   if(el!=null){
	      if(el.childNodes){
	         for(var i=0;i<el.childNodes.length;i++){
	            var childNode = el.childNodes[i];
	            //너 텍스트 노드니?
	            if(childNode.nodeValue !=null){
	               text = text+childNode.nodeValue;
	            }      
	         }
	      }
	   }
	   return text;
	}
	//기존 TextNode의 값을 다른 문자열로 바꾸기
	/***********************************************
	param1 :document.getElementById("boardSold")
	param2 :xhrObject. 
	************************************************/
	function replaceText(el, value){
	   if(el !=null){
	      clearText(el);//기존에 있던 10을 지워주세요.
	      //새로운 텍스트 노드 15를 생성하기
	      var newNode = document.createTextNode(value);//15
	      //위에서 생성한 텍스트 노드 값을 el에 붙이는 함수 호출하기
	      el.appendChild(newNode);
	   }
	}
	//기존 태그안에 문자열 지우는 함수 구현
	function clearText(el){
	   if(el !=null){
	      if(el.childNodes){
	         for(var i=0;i<el.childNodes.length;i++){
	            var childNode = el.childNodes[i];
	            el.removeChild(childNode);
	         }
	      }
	   }
	}
	function getBoardSold(){
		var cost = $("#cost").text();//100 구매가를 담을 변수 선언
		console.log('구매가2:'+cost);
		var price = $("#price").text();//100 구매가를 담을 변수 선언
		console.log('소비자가2:'+price);
		var cashPerBoard = price-cost;
		console.log(cashPerBoard);
	}
</script>
</head>
<body>
<h2>보드 판매량</h2>
<table width="300px" height="80px">
   <tr>
      <th width="120px">보드 판매량</th>
      <td width="180px"><span id="boardSold">10</span></td>
   </tr>
   <!-- 
   소비자가-구매가=보드 한개당 마진 금액
   한개당 마진 금액*판매량=마진금액계산
    -->
   <tr>
      <th>구매가</th>
      <td><span id="cost">100</span>원</td>
   </tr>
   <tr>
      <th>소비자가</th>
      <td><span id="price">120</span>원</td>
   </tr>
</table>
<h2>마진금액 : <span id="cash">0</span>원</h2>
<button onclick="getBoardSold()">마진은?</button>
</body>
</html>









