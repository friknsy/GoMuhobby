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
<title>환불처리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
환불번호와 남은 일수가 넘겨진 상황
남은 일수를 기준으로 환불금액이 달라진다. 
0이면 환불불가
1이면 50% 환불
2이면 100% 환불

환불처리하시겠습니까? 
환불예정금액 ${expectedRefund }

관리자임의환불(특정한 상황에서 관리자가 임의로 가격을 설정하여 환불할 수 있도록 해줌)
환불완료일 경우에는 관리자번호, 환불금액, 환불요청번호가 넘어가야되고
환불반려일 경우에는 관리자번호, 환불금액은0원, 
둘다 환불완료 환불반려 버튼 넘어가야 된다. 

환불예정금액으로 환불해주기
임의금액으로 환불해주기
환불반려하기 
이렇게 세 가지 경우가 있다. 

정규표현식(숫자만 입력하게 해준다) 적용하고 결제금액 이상으로 입력하도록 해주면 안된다.	
<br><br>

<input type="hidden" value="${uniqueId }"></input>
<input type="hidden" value="${refund_req_num }"></input>
<label><input type="radio" name="aaa" id="allowBtn"/>환불처리</label>
<label><input type="radio" name="aaa" id="rejectBtn"/>환불반려</label>

환불가격<input type="text" / value="${expectedRefund }" id="inputBox">
<script type="text/javascript">
//환불반려버튼이 클릭되면 환불가격 인풋박스가 사용할 수 없게 되고 환불가격이 0 이 된다.
$(function()
{
	$("#rejectBtn").click(function()
	{
		$("#inputBox").attr("value",0);
		$("#inputBox").attr("disabled",true);
	});
	
	$("#allowBtn").click(function()
	{
		$("#inputBox").attr("value",${expectedRefund});
		$("#inputBox").attr("disabled",false);
		
		
		
	});
})

</script>
</body>
</html>