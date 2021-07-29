<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%
	String adminStr = null;

if (session.getAttribute("adminStr") != null) {
	adminStr = (String) session.getAttribute("adminStr");
}

String uniqueId = null;

if (session.getAttribute("uniqueId") != null) {
	uniqueId = (String) session.getAttribute("uniqueId");
}

String mynickName = null;

if (session.getAttribute("mynickName") != null)
	mynickName = (String) session.getAttribute("mynickName");
else
	// 로그인 정보가 없을 때 메인 페이지로 이동!
	out.println("<script>location.href=" + "'mainpage.action'" + ";</script>");

String photo = null;

if (session.getAttribute("photo") != null)
	photo = (String) session.getAttribute("photo");
else
	photo = "undraw_profile_1.svg";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호변경</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

	/* rupy.0729.ajax 활용 현재 비밀번호와 일치하는 값을 입력했는지 확인한다. !!생각해보면 ajax는 보안상 안좋을듯하다. 버튼클릭해서 확인하는 방법이 맞을 것 같다. 여러 번 불일치 시 비밀번호 변경 못하게 막기 위해서.*/
	function pwdCheck(thisValue,uniqueId)
	{
		
		$.post("pwdcheck.action", {uniq_id_num : uniqueId, u_pwd:thisValue}, function(data)
				{
					
					
					if(data=="0") /* 비밀번호가 일치하지 않을 시에는 컨트롤러에서 0 반환 */
		            {
						
						$('#chkMessage').html("비밀번호가 일치하지 않습니다.");
						
		            }
					
		            else
		            {
		            	
						$("#password").attr("disabled",true);
						$('#chkMessage').html("");			
						$("#newPwd").attr("disabled", false);
						
		            }
		});
	}
	
	function checkNewPwd(thisValue)
	{
		 var pw = thisValue;
		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-z]/ig);
		 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		 
		 $("#equalChk").attr("disabled", true);
		 $("#equalChk").val('');
		 $("#chkMessage3").html("");
		 $("#submit").attr("disabled", true);
		 

		 if(pw.length < 8 || pw.length > 20){
			    $('#chkMessage2').html("8자리 ~ 20자리 이내로 입력해주세요.");
				
				$("#equalChk").attr("disabled", true);
			
		  
		 }else if(pw.search(/\s/) != -1){
			    $('#chkMessage2').html("비밀번호는 공백 없이 입력해주세요.");
			   
			    $("#equalChk").attr("disabled", true);
		  
		  
		 }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
			    $('#chkMessage2').html("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
			    
			    $("#equalChk").attr("disabled", true);
		  
		 }else {
				 $('#chkMessage2').html("");
				 
				 $("#equalChk").attr("disabled", false);
		 }
		
	}
	
	function checkPwdEqual(thisValue)
	{
		var pw = $("#newPwd").val();
		var chkPw = thisValue;
		
		if (pw != chkPw)
		{
			 $('#chkMessage3').html("변경할 비밀번호와 일치하지 않습니다.");
			 $("#submit").attr("disabled", true);
		}
		else
		{
			
			$("#chkMessage3").html("");
			$("#submit").attr("disabled", false);
		}

	}

</script>
</head>
<body>
	현재비밀번호
	<input type="password" onkeyup="pwdCheck(this.value,<%=uniqueId%>)" id="password">
	<div id="chkMessage" style="color: red; font-size: small;"></div>
	변경비밀번호
	<input type="password" onkeyup="checkNewPwd(this.value)" id="newPwd" disabled="disabled">
	<div id="chkMessage2" style="color: red; font-size: small;"></div>


	<form action="updatepassword.action" method="get">
		<input type="hidden" value="<%=uniqueId%>" name="uniq_id_num"> 
		비밀번호확인 <input type="password" name="u_pwd" onkeyup="checkPwdEqual(this.value)" id="equalChk" disabled="disabled">
		<div id="chkMessage3" style="color: red; font-size: small;"></div>

		<button type="button" onclick="javascript:window.close()">취소</button>
		<button type="submit" id="submit" disabled="disabled">변경</button>


	</form>


</body>
</html>