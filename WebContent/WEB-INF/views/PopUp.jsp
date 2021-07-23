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
		$.post("namechangeajax.action", {uniq_id_num : $("#uniq_id_num").val() , u_name : $("#u_name").val()}, function(data)
		{
			opener.document.location.reload();
		   	window.close();
		});
	}

</script>
</head>
<body>
 
<div>
	<h3>회원 정보 수정</h3>
</div>

<!-- <form action="changeName.action" method="post"> -->
<input type="hidden" value="${uniq_id_num }" name="uniq_id_num" id="uniq_id_num">
현재이름 <input type="text" value="${u_name.u_name }" disabled="disabled"><br>
변경이름 <input type="text" name="u_name" id="u_name"><br><br>
<!-- <button type="submit">변경하기</button> -->
<button type="button" onclick="submitData()">이름 변경하기</button>
<button type="button" onclick="javascript:closePop()">취소</button>
</form>



<!-- 만약 팝업창 밖의 공간을 선택하게 되면 창이 저절로 닫히게 된다.  그런데 예를 들면 퀴즈를 풀때 다른 브라우저를 띄워 검색하는것을 막는 기능이라서 현재 찾는 기능(submit 후에 close)은 아니다-->
 <script type="text/javascript">
	$(window).on("blur", function () {
		
	    self.close();
	
	});
</script> 


</body>
</html>