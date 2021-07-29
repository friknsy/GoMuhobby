<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>팝업창 자동으로 닫고 부모창에서 session.invalidate()</title>
<script type="text/javascript">
	<%
	session.invalidate();
	%>
	
	function windowClose()
	{
		/* opener.document.location.reload(); */
		opener.document.location.href="mainpage.action";
	   	window.open('', '_self', '').close();
	   
	   	
	}
</script>
</head>
<!-- <body onLoad="setTimeout('window.close()',0.0001);"> -->
<body onLoad="windowClose()">
</body>
</html>