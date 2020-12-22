<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보드 판매량 - 마진금액 계산:Step2</title>
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
<script type="text/javascript" src="http://192.168.0.244:9000/js/jsUtil.js"></script>
<script type="text/javascript">
	//비동기 통신 객체 담을 변수 선언
	var xhrObject = null;
	//비동기 통신 객체 생성하기
	function createRequest(){
		try{
			xhrObject = new XMLHttpRequest();//IE8.0이상, 사파리, 오페라 , 크롬, 파이어폭스에서 생성할 때
		}catch(trimicrosoft){
			try{
				xhrObject = new ActivityObject("Msxml2.XMLHTTP");//IE 6.0에서 생성할 때
			}catch(e){
				xhrObject = null;
			}
		}/////////////////////end of try
		if(xhrObject == null){
			alert("비동기 통신 객체 생성 에러");
		}
	}	
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
	//콜백함수 선언 
	function sold_process(){
		alert(xhrObject.readyState);
		if(xhrObject.readyState == 4){
			if(xhrObject.status == 200){//요청에 대한 응답 성공했니?
				//insert here - 여기에 추가하기
				//만일 xml일 경우에는 xhrObject.responseXML;
			
			//몰래, 보이지 않는 곳에서 처리, 내부적으로 처리하기, url이동하지 않기
				var newTotal = xhrObject.responseText;//60
				//alert("새로 집계된 판매량:"+newTotal);
				var boardSoldEL = document.getElementById("boardSold");
				replaceText(boardSoldEL,newTotal);//60
				var costEL = document.getElementById("cost");//구매가를 감싸고 있는 span태그의 주소번지 담기
				var cost = getText(costEL);//100 구매가를 담을 변수 선언
				console.log('구매가:'+cost);
				var priceEL = document.getElementById("price");//구매가를 감싸고 있는 span태그의 주소번지 담기
				var price = getText(priceEL);//100 구매가를 담을 변수 선언
				console.log('소비자가:'+price);
				var cashPerBoard = price - cost;
				var cash = cashPerBoard*newTotal;
				//마진금액을 출력한 위치 정보를 갖는 값
				var cashEL = document.getElementById("cash");
				//현재 값을 새로운값으로 변경해주는 함수 호출
				//@param:값이 출력될 위치 정보
				//@param:대체될 새로운 값
				replaceText(cashEL, cash);				
			}else{
				alert("에러발생");
				return;//콜백함수 탈출하기 입니다.
			}
		}
	}
	function getBoardSold(){
		//비동기 통신 객체 생성하기 - jquery사용할 경우 필요없음.
		createRequest();
		//이 요청을 처리할 url정보임.
//		var url= "./boardSellAction.jsp";
		var url= "/board/bsell.do";
		//통신 전에 필요한 상수값 지정하기
		xhrObject.open("GET",url, true);//true:비동기, false:동기	
		//onreadystatechange속성은 http요청의 상태 변화에 따라 호출되는 이벤트 핸들러임.
		//대입연산자 오른쪽은 상태변화에 따라 호출될 함수 이름을 적는다.
		xhrObject.onreadystatechange=sold_process;
		//이 때 서버로 전송이 일어남. 목적지는 boardSellAction.jsp
		xhrObject.send(null);//전송처리
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









