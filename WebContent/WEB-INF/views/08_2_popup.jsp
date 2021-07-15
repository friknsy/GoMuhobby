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
	{
		mynickName = (String)session.getAttribute("mynickName");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report.jsp</title>

<link rel="stylesheet" href="css/bootstrap.css">

<!-- <script type="text/javascript" src="js/bootstrap.min.js"></script> -->
<!-- jQuery script  -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">


	$(function()
	{
		$("#submit").click(function()
		{
			var test = $('input[id=f_forum_code]').val();
			
			$.post('<c:out value="${cp}"/>ffreportreg.action',
			{
				f_forum_code : $("#f_forum_code").val(),
				report_cat_num : $('input:radio[name="report_cat_num"]:checked').val(),
				uniq_id_num : $("#uniq_id_num").val()
			},
			
			function(data)
			{
				if(data=="SUCCESS")
				{
					window.close();	
				}else{
					//실패
				}
			});
		});
	});
	
</script>
<style type="text/css">
	
	#report-form
	{
		text-align: center;
		background-color: #d3d3d3;
		padding-top: 50px;
		padding-bottom: 50px;
		margin: auto;
		
	}
	
	#btnSubmit
	{
		width:200px;
		padding-top: 30px;
		margin: auto;
		display: block;
	}
	
	#report-form
	{
		text-align: center;
		background-color: #d3d3d3;
		padding-top: 50px;
		padding-bottom: 50px;
		margin: auto;
		
	}
	
</style>

</head>
<body>

<br><br>

<div class="container">
	<div>
		<h3>신고하기</h3>
		<hr>
	</div>
	
	<form id="report-form">
		<div class="container" >
			<input type="hidden" id="uniq_id_num" name="uniq_id_num" value="<%=uniqueId %>">
			<input type="hidden" id="f_forum_code" name="f_forum_code" value="${param.f_forum_code}">
			<label for="report1"><input type="radio" name="report_cat_num" value="1" 
			>도배성, 무의미성, 무성의한 게시글, 댓글</label>
			<br>
			<label for="report2"><input type="radio" name="report_cat_num" value="2" 
			>상업적 광고(홍보) 의도가 있는 게시글/댓글</label>
			<br>
			<label for="report3"><input type="radio" name="report_cat_num" value="3" 
			>혐오감을 줄 수 있는 사진, 내용이 포함되어있는 게시글/댓글</label>
			<br>
			<label for="report4"><input type="radio" name="report_cat_num" value="4" 
			>개인 간의 싸움, 갈등 유발성 게시글/댓글</label>
			<br>
			<label for="report5"><input type="radio" name="report_cat_num" value="5" 
			>음란성 사진, 내용이 있는 게시글/댓글</label>
			<br>
			<label for="report6"><input type="radio" name="report_cat_num" value="6" 
			>게시판 성격에 맞지 않는 게시글/댓글</label>	
		</div>
		
		
		<div class="container" id="btnSubmit">
			<input type="hidden" id="f_forum_code" name="f_forum_code">
			<input type="button" value="신고하기" class="btn btn-default" id="submit">
			<input type="button" value="취소" class="btn btn-default" id="cancle" onclick="window.close()">
		</div>		
	</form>
</div>

</body>
</html>