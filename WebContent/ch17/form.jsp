<%@ page contentType = "text/html; charset=utf-8"%>
<html>
<head><title>폼 생성</title></head>
<body>

<!-- <form action="/ch17/viewParameterVer3.jsp" method="post"> -->
<form action="/ch17/petChoice" method="post">
	<input type="hidden" name="h_imsi" value="<%=10%>">
<!-- 만일 화면에서 입력받는 값이 아니라 개발자가 필요한 별도의 값인 경우
화면없이 값을 넘길 수 있는 방법은? hidden속성을 이용한다.
 -->
이름: <input type="text" name="name" size="10"> <br>
주소: <input type="text" name="address" size="30"> <br>
좋아하는 동물:
	<input type="checkbox" name="pet" value="dog">강아지
	<input type="checkbox" name="pet" value="cat">고양이
	<input type="checkbox" name="pet" value="pig">돼지
<br>
<input type="submit" value="전송">
</form>
</body>
</html>
