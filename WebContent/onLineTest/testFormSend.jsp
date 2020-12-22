<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//내 이름은 testFormSend.jsp입니다.
//나는 채점하는 페이지 입니다.
//채점에 필요한 변수를 선언해 보자.
//1문제당 배점을 담을 변수 선언임.
	int perJumsu = 20;
//맞힌 갯수 카운트하기
	int cnt = 0;
//판정하기
	boolean isPass = false;//true이면 합격, false이면 불합격
//몇 점이 합격인데?
	int pass = 60;
	String daps[] ={"3","4","1","2","4"};
	String tests[] = new String[5];
	Cookie[] cs = request.getCookies();
	if(cs!=null && cs.length>0){//쿠키가 존재하니?
		for(int i=0;i<cs.length;i++){
			String c_name = cs[i].getName();//test1,test2,test3,test4, test5
			if("test1".equals(c_name)){//1번 답인거야?
				tests[0] = cs[0].getValue();
			}
			else if("test2".equals(c_name)){//1번 답인거야?
				tests[1] = cs[1].getValue();
			}
			else if("test3".equals(c_name)){//1번 답인거야?
				tests[2] = cs[2].getValue();
			}
			else if("test4".equals(c_name)){//1번 답인거야?
				tests[3] = cs[3].getValue();
			}
			else if("test5".equals(c_name)){//1번 답인거야?
				tests[4] = cs[4].getValue();
			}
			
		}////////////////////////end of for
	}////////////////////////////end of if
	//수험생이 선택한 답안지 정보를 출력하기
	for(String dap:tests){
		out.print(dap+" ===> ");
	}
	//그래서 정답을 몇 개나 맞춘거니?
	for(int i=0;i<daps.length;i++){
		for(int j=0;j<daps.length;j++){
			if(daps[i].equals(tests[j])){
				if(i==j){//자리까지 일치하는 거니? strike++
					cnt++;
				}
			}
		}
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기서 채점 해봐요</title>
</head>
<body>
맞힌 갯수 : <%= "맞힌 갯수 : "+cnt %>  입니다.<br>
당신의 점수는 <%= perJumsu*cnt %> 입니다.
<%
	if((perJumsu*cnt)>=pass){
		isPass = true;
	}else{
		isPass = false;
	}
	response.sendRedirect("report.jsp?isPass="+isPass);
%>
</body>
</html>





















