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
			<input type="hidden" name="uniq_id_num" value="-1">
			<table class="table" style=" border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="6" style="background-color: #f3ecfd; text-align: center;">${notice.ntc_cat_name}</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="background-color: #f3ecfd;">작성자</td>
						<td>${notice.user_nickname}</td>
						<td  style="background-color: #f3ecfd;">조회수</td>
						<td>${notice.ntc_hit}</td>
						<td  style="background-color: #f3ecfd;">작성일</td>
						<td>${notice.ntc_wrt_date}</td>
					</tr>				
					<tr>
						<td colspan="1"  style="background-color: #f3ecfd;">제목</td>
						<td colspan="5">${notice.ntc_title}</td>
					</tr>
					<tr style="min-height: 300px; text-align: left;">
						<td colspan="1" style="background-color: #f3ecfd;">내용</td>
					   <%--  <td colspan="5" >${notice.ntc_content }</td> 이렇게 하면 개행처리가 안되어서 readonly textarea 로 처리해줌--%>
					   <td colspan="5"><textarea class="form-control" name="ntc_content" maxlength="2048" style="height: 350px; background-color: white;" readonly="readonly">${notice.ntc_content }</textarea></td>
						
					</tr>
					
				</tbody>
				
			</table>
			<input type="button" class="btn btn-default pull-left" value="목록으로" onclick="location.href='noticeboardlist.action'">
			<input type="button" class="btn btn-default pull-right" value="수정하기" onclick="location.href='noticeboardupdateform.action?ntc_num=${notice.ntc_num}'">
			<a href="<c:url value="noticeboarddelete.action?ntc_num=${notice.ntc_num}"/>" class="btn btn-default pull-right" onclick="if(!confirm('공지를 삭제하시겠습니까?')){return false;}">삭제</a>
			<%--★onclick 시 javascript 함수를 쓰지 않고 여기서 바로 처리 (삭제여부(yes or no) 확인 한 다음에 바로 해당 url로 전송하거나 return 하거나)  --%>
		</form>
		</div>
	</div>
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>