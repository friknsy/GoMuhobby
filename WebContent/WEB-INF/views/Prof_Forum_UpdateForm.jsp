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
<title>Prof_Forum_InsertForm.jsp</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="<%=cp %>/assets/favicon.ico" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<%=cp %>/css/mainpage.css" rel="stylesheet" />
<link href="<%=cp %>/css/myPage1.css" rel="stylesheet" />


<!-- 부트스트랩 css -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> --> 

<!-- 제이쿼리 script -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script> -->
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>

	
<!-- 부트스트랩 script -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


</head>
<body>


<div class="container">
	<br><br>
	<div>
		<div style="float: left;"><h2>게시글 수정</h2></div>
		<div style="clear:both;"></div>
		<hr>
	</div>
	<br>
	
	<div class="col-lg-10" style="text-align: center; margin: auto;">
		<form action="">
			<table class="table">
				<tr>
					<th>내용</th>
				</tr>		
				<tr>
					<td>
						<textarea rows="5" class="form-control" required="required"
						placeholder="내용을 입력해주세요."></textarea>
					</td>
				</tr>		
			</table>
			<button type="button" class="btn btn-default">뒤로가기</button>
			<button type="submit" class="btn btn-outline-light btn-sm1">수정하기</button>
			<!-- <button type="reset" class="btn btn-default">취소하기</button> -->
		</form>
	</div>

	
</div>

</body>
</html>