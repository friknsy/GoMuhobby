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
<title>Inserttitlehere</title>
</head>
<body>
<fieldset>
	<legend>파일 업로드</legend>
	<table>
	<form action="ProfileUpload.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" value="${param.uniqueId}" name="uniqueId">
		<tr>
			<td>프로필업로드</td>
			<td><input type="file" value="파일 선택" name="file"> </td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="업로드"> </td>
		</tr>
		</form>
		
<%-- 		<%=request.getAttribute("author") %>		
		<%=request.getAttribute("fileName") %> --%>
	</table>
</fieldset>
</body>
</html>