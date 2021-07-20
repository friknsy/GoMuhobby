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
<title>질문수정하기</title>
</head>
<body>
<div>
	<h1>질문 수정하기</h1>
</div>

<form action="classquestionupdate.action" method="post">

	<!-- 질문번호 받기 -->
	<input type="hidden" name="c_qa_num" value="${c_qa_num } ">
	
	<table>
	  <tr>
	    <th><textarea cols="50" rows="5" name="c_qa_content"></textarea>  </th>
	    
	  </tr>
	  <tr>
	    <td ><button type="reset">취소</button> <button type="submit" onclick="javascript:confirm('답변을 수정하시겠습니까?')">수정</button> </td>
	    
	  </tr>
	</table>


</form>

</body>
</html>