<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%--실습했던 페이지. 코드보려고 그냥 둠. 최종에는 지워야함 어차피 지금 db 계정 바꿔놔서 안됨.--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>
<!-- jQuery script  -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function()
	{
		$(".btnDelete").click(function name()
		{
			// 삭제버튼 클릭시
			if(confirm("현재 선택한 데이터를 정말 삭제하시겠습니까?"))
			{
				$(location).attr("href","memberdelete.action?mid=" + $(this).val());
				
			}
		});
		
		
		
		$(".btnUpdate").click(function()
		{
			
			// 업데이트 폼을 따로 구성안하고 입력폼을 사용해서 하기로 함
			// #title 의 내용과 css 속성을 바꿔준다. 
			
			$("#title").html("회원 정보 수정").css({"color":"red", "font-weight":"bold"});
			
			
			// 업데이트 버튼이 포함되어 있는 tr 의 각각 0,1,2 번째 td의 값들을 mid, name, telephone
			// 변수에 초기화시켜준다.
			var mid = $(this).parents("tr").find("td:eq(0)").text();
			var name = $(this).parents("tr").find("td:eq(1)").text();
			var telephone = $(this).parents("tr").find("td:eq(2)").text();
			
			
			// 초기화시켜준 값들을 input폼 안에 넣어준다. (수정의 경우 id도 넘겨줘야 할 필요가 있으므로 
														// hidden 타입으로 #id 인 input도 넣어둔다. )
			$("#mid").val(mid);
			$("#name").val(name);
			$("#telephone").val(telephone);
			
			
			//role="form" 이라고 해준 form 의 action 속성을 memberinsert 에서 memberupdate로 바꿔준다.   
			$("form").attr("action","memberupdate.action");
			
			
			
		});
		
		// 취소버튼을 클릭하면 수정용으로 바뀌었던 폼을 다시 입력용 폼으로 되돌려놓는다.
		$(".btnCancel").click(function()
		{
			// 기존으로 문구를 돌려놓고
			$("#title").html("회원 정보 입력").css({"color":"black", "font-weight":"normal"});
			
			//role="form" 속성인 form 의 action 속성을 다시 memberupdate 에서 memberinsert 로 돌려놓는다. 
			$("form").attr("action","memberinsert.action");
		});
	});
	

</script>

</head>
<body>

<div>
	<h1>회원정보</h1>
	<hr>
</div>


<div class="container">
	<div class="panel-group">
		<div class="panel-default">
			<div class="panel-heading" id="title">
				회원 정보 입력
			</div>
			
			<div class="panel-body">
				<form role="form" action="memberinsert.action" method="post">
				
				<input type="hidden" id="mid" name="mid">
				
					<div class="form-group">
						<label for="name">
							NAME : 
						</label>
						<input type="text" class="form-control" id="name" name="name">
					</div>
					<div class="form-group">
						<label for="telephone">
							TELEPHONE :
						</label>
						<input type="text" class="form-control" id="telephone" name="telephone">
					</div>
					
					<button type="submit" class="btn btn-success btn-sm">SUBMIT</button>
					<button type="reset" class="btn btn-success btn-sm btnCancel">CANCEL</button>
				</form>
			</div>
		</div>
		
		
		<div class="panel panel-default">
		
			<div class="panel-heading">
				회원정보출력
			</div>
			
			<div class="panel-body">
				<table class="table">
					<thead>
						<tr>
							<th>MID</th>
							<th>NAME</th>
							<th>TELEPHONE</th>
							<th>삭제/수정</th>
						</tr>
					</thead>
					<tbody>
<!-- 						<tr>
							<td>1</td>
							<td>전혜림</td>
							<td>010-1111-1111</td>
							<td>
							<button type="button" class="btn btn-default btn-xs btnDelete">삭제</button>
							<button type="button" class="btn btn-default btn-xs btnUpdate">삭제</button>
							</td>
						</tr> -->
						
						<c:forEach var="member" items="${list }">
						<tr>
							<td>${member.mid }</td>
							<td>${member.name }</td>
							<td>${member.telephone }</td>
							<td>
							<button type="button" class="btn btn-danger btn-xs btnDelete" value="${member.mid }">삭제</button>
							<button type="button" class="btn btn-primary btn-xs btnUpdate" value="${member.mid }">수정</button>
							</td>
						</tr>						
						</c:forEach>
					</tbody>
				</table>
				
				<button type="button" class="btn btn-default btn-sm">COUNT<span class="badge">${count}</span>
				</button>
			</div>
		</div>
		
		
	</div>
</div>
</body>
</html>