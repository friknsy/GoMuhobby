<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%  
	String adminStr = null;
	
	if(session.getAttribute("adminStr")!=null)
	{
		adminStr = (String)session.getAttribute("adminStr");
	}
	
	String uniqueId = null;
	
	if(session.getAttribute("uniqueId")!=null)
	{
		uniqueId = (String)session.getAttribute("uniqueId");
	}
	
	String mynickName = null;
	
	if(session.getAttribute("mynickName")!=null)
		mynickName = (String)session.getAttribute("mynickName");
	else
		// 로그인 정보가 없을 때 메인 페이지로 이동!
		out.println("<script>location.href=" + "'mainpage.action'" + ";</script>");
	
	String photo = null;
	
	if(session.getAttribute("photo")!=null)
		photo = (String)session.getAttribute("photo");
	else
		photo = "undraw_profile_1.svg";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가지마</title>
<style type="text/css">
	#image
	{
		text-align: center;
		padding-top: 100px;
	} 
	h1
	{
		text-align: center;
	}
	.container
	{
		text-align: center;
	}
</style>
<script type="text/javascript">
	function beforeCheck()
	{
		
		
		// submit 버튼을 누르면 onsubmit에 의해 beforeCheck() 함수 호출
		
		// 만약 탈퇴사유를 선택하지 않았을 시에는 경고창을 띄운다.
		if(!document.querySelector('input[name="drop_reason_code"]').checked)
		{
			alert("가더라도 탈퇴사유는 눌러주십시오");
			return false;
			
		}
		
		// 탈퇴여부를 마지막으로 묻는다.
		if (!confirm("진심입니까? 실화입니까?"))
		{
			return false; // 폼을 전송하지 않는다.
		}
		else
		{
			alert("지금까지 뮤하비를 이용해주셔서 감사합니다.");
			return true;  // 폼을 전송한다.
			
		}
			
		
		
		
	}

</script>
</head>
<body>

<div id="image">
<img src="images/PLZDONTGO.jpg" style="max-width: 200%; height: auto;"> 
</div>
<h1>뮤하비를 떠나지 말아줬음 해</h1>

<div class="container">
	<div>
		<h3>어디가 그렇게 맘에 안들었니</h3>
	</div>
	
	<form id="report-form" action="memberquit.action" method="post" onsubmit="return beforeCheck()">
		<div class="container" >
			<input type="hidden" id="uniq_id_num" name="uniq_id_num" value="<%=uniqueId%>">

			<label for="check1"><input type="radio" id="check1" name="drop_reason_code" value="1" >이용서비스 품질 부족</label>
			<br>
			<label for="check2"><input type="radio"  id="check2" name="drop_reason_code" value="2" 
			>이용 빈도 낮음</label>
			<br>
			<label for="check3"><input type="radio"  id="check3" name="drop_reason_code" value="3" 
			>개인정보 유출 우려</label>
			<br>
			<label for="check4"><input type="radio"  id="check4" name="drop_reason_code" value="4" 
			>그 외의 사정</label>
			<br><br><br>
			
		</div>	
			
			<input type="submit" value="탈퇴하기" class="btn btn-default" id="submit">
			<input type="button" value="취소" class="btn btn-default" id="cancle" onclick="javascript:history.back()">
			
	</form>
</div>



</body>
</html>