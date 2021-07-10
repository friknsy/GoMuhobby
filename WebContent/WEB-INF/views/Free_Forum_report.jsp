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
<title>Insert title here</title>


<script type="text/javascript">

		$(function()
		{
			
			$("#submit").click(function()
			{
				var cat = document.getElementByName("report_cat_num").length;
				
				if(confirm("게시물을 신고하시겠습니까?"))
				{	
					if(document.getElementsByName("report_cat_num")[i].checked == true)
					{
						$(location).attr("href", "ffreportreg.action?report_cat_num=" + document.getElementsByName("report_cat_num").value);	
					}
					
				}
				
			});
			
			$("#cancle").click(function()
			{
					
				$(location).attr("href", "fflist.action");
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
			<label for="report1"><input type="radio" name="report_cat_num" value="1" 
			name="radio">도배성, 무의미성, 무성의한 게시글, 댓글</label>
			<br>
			<label for="report2"><input type="radio" name="report_cat_num" value="2" 
			name="radio">상업적 광고(홍보) 의도가 있는 게시글/댓글</label>
			<br>
			<label for="report3"><input type="radio" name="report_cat_num" value="3" 
			name="radio">혐오감을 줄 수 있는 사진, 내용이 포함되어있는 게시글/댓글</label>
			<br>
			<label for="report4"><input type="radio" name="report_cat_num" value="4" 
			name="radio">개인 간의 싸움, 갈등 유발성 게시글/댓글</label>
			<br>
			<label for="report5"><input type="radio" name="report_cat_num" value="5" 
			name="radio">음란성 사진, 내용이 있는 게시글/댓글</label>
			<br>
			<label for="report6"><input type="radio" name="report_cat_num" value="6" 
			name="radio">게시판 성격에 맞지 않는 게시글/댓글</label>	
		</div>
		
		
		<div class="container" id="btnSubmit">
			<input type="submit" value="신고하기" class="btn btn-default" id="submit">
			<input type="button" value="취소" class="btn btn-default" id="cancle">
		</div>		
	</form>
</div>

</body>
</html>