<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 페이지 (보여주는 건 없음.)</title>
</head>
<body>
	<%
		session.invalidate();
	%>
	
	<script>
		location.href = "mainpage.action";
	</script>
	
</body>
</html>