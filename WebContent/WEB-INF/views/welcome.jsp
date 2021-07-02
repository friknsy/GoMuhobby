
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%--회원가입 이후 환영페이지 특별한 기능은 없음 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to MUHOBBY</title>
</head>
<body>

<div>
	<h1>뮤하비의 회원이 되신 것을 환영합니다 </h1>
	<hr />
	<p>뮤하비의 여러 서비스들을 자유롭게 이용해보세요</p>
	
	<a href="index.jsp">메인페이지로 가기</a>
</div>

</body>
</html>