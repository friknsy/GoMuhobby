<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>팝업창 자동으로 닫기</title>
<script type="text/javascript">
	
	/* 팝업창 닫고 부모창도 reload 해주고 싶어서 코드 수정좀 봤습니다 */
	function windowClose()
	{
		opener.document.location.reload();
	   	window.open('', '_self', '').close();
	   
	   	
	}
</script>
</head>
<!-- <body onLoad="setTimeout('window.close()',0.0001);"> -->
<body onLoad="windowClose()">
</body>
</html>