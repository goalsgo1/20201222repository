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