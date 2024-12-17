<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
</head>
<body>
	========== toString() 내용 ===== <br>
	<h1><%=exception.toString() %></h1> <%--NumberFormatException 출력--%>
	
	========== getMessage() 내용 ===== <br> <%--출력메세지가 뭔지 알려줌--%>
	<h1><%=exception.getMessage() %></h1>
	
	========== printStackTrace() 내용 ===== <br>
	<h1><% exception.printStackTrace(); %></h1> <%--콘솔에 에러내용 출력--%>
	
	<h3>
		숫자만 입력 가능합니다. 다시 시도하세요.
		<a href='add.html'>다시 하기</a>
	</h3>
</body>
</html>