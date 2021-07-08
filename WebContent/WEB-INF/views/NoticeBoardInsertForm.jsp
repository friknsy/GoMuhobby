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
		System.out.println(adminStr + "관리자확인");
	}

	String uniqueId = null;
	
	if(session.getAttribute("uniqueId")!=null)
	{
		uniqueId = (String)session.getAttribute("uniqueId");
		
		System.out.println(uniqueId + "고유식별번호");
	}

	String mynickName = null;

	if(session.getAttribute("mynickName")!=null)
	{
		mynickName = (String)session.getAttribute("mynickName");
		System.out.println(mynickName + "닉네임");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뮤하비 공지사항</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

	<div>
		<h1>뮤하비 공지사항</h1>
		<hr />
	</div>
	<div class="container">
		<div class="row">
		<form method="post" action="noticeinsert.action">
			<input type="hidden" id="uniq_id_num" name="uniq_id_num" value="<%=uniqueId %>">	<!-- 수정 완료 -->
			<table class="table" style=" border: 1px solid #f3ecfd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #f3ecfd; text-align: center;">뮤하비 공지사항 작성</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
						<select name="ntc_cat_code" class="form-control" style="width: 20%;">
							<c:forEach var="list" items="${noticeCat }">
							<option value="${list.ntc_cat_code }">${list.ntc_cat_name }</option>
							</c:forEach>
						</select></td>
					</tr>
				
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="ntc_title" maxlength="50" required="required"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="ntc_content" maxlength="2048" style="height: 350px;" required="required"></textarea></td>
					</tr>
					
				</tbody>
				
			</table>
			<input type="submit" class="btn btn-default pull-right" value="글쓰기">
		</form>
		</div>
	</div>
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>