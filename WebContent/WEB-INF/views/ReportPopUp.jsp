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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
	// 취소 버튼을 클릭하면 창이 닫힌다.
	function closePop()
	{
		window.close();
	}
	
	// 이름변경 버튼을 클릭하면 ajax 를 통해서 값을 변경하고 돌아와서 window.close()를 한다. 
	function submitData()
	{
		$.post("reportprocessingajax.action", {qa_report_reg_code : $("#qa_report_reg_code").val() , a_num : $("#a_num").val(), report_proc_cat_code : $('input:radio[name="chk_info"]:checked').val()}, function(data)
		{
			window.close();
		});
	}
	// ★ 여기서 문제는 팝업창이 close된 후에도 부모페이지가 새로고침 되지 않아서 신고처리가 된 후에도 데이터는 남아있다. 테이블 uk때문에
	// 값이 들어가지 않지만 이미 처리된 신고처리라는 것을 사용자는 모르는 상태(콘솔창에만 unique constraint (MUHOBBY.QRP_REG_CODE_UK) violated) 표시된다.


</script>
</head>
<body>
 
<div>
	<h3>회원 정보 수정</h3>
</div>
<span>${qa_forum_code}</span>  
<div>
	<input type="hidden" id="qa_report_reg_code" name="qa_report_reg_code" value="${qa_report_reg_code}">
	<input type="hidden" id="a_num" name="a_num" value="-1">
	<input type="radio" name="chk_info" value="2">신고처리완료
	<input type="radio" name="chk_info" value="1">신고반려
	<button type="button" onclick="submitData()">확인</button>
	<button type="button" onclick="closePop()">취소</button>
</div>


</body>
</html>