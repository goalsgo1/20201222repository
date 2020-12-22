<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.util.HangulConversion" %>    
<%
//커피머신 번호
   String coffeemaker = request.getParameter("coffeemaker");
//커피주문자 이름
   String name = HangulConversion.toKor(request.getParameter("name"));
   for(double i=0;i<9000000000.0;i++){
      //커피를 만드는 시늉을 한다.시간을 번다.
   }
   //기존에 갖고 있던 정보를 출력버퍼에서 삭제하기
   //이걸 안하면 계속 1번 머신 정보만 유지될 수도 있다.
   out.clear();
   out.print(coffeemaker+name);//1이순신, 2강감찬
%>