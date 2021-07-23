<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>뮤하비 관리자</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript">
	
	/* 계정복구 버튼 클릭 시 */
	function move(url){
	q = confirm("본인인증이 완료된 계정이라면 확인 버튼을 눌러주세요.");
	if(q){
	
	location.replace(url);
	}
	}
	
	function showPopup(uniq_id_num) { 
		window.open("namepopup.action?uniq_id_num="+uniq_id_num, "이름변경", "width=400, height=300, left=100, top=50"); 
		/* 요청 url 에서 /namepopup.action 이라고 『/』를 앞에 붙여주면 경로를 찾지 못한다. 요청url 에는  /를 붙여주지 않는다!! 주의!! */
		
	}
	
</script>


</script>

</head>

<body>



			
			<div class="container-fluid">

				<!-- Page Heading -->
				<h1 class="h3 mb-2 text-gray-800">뮤하비들의 가입 및 탈퇴내역 </h1>
				<p class="mb-4">
					뮤하비들의 가입 및 탈퇴이력을 조회할 수 있어요<a target="_blank"
						href="#">official DataTables
						documentation</a>.
				</p>

				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">회원 계정 상태 조회</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>번호</th>
										<th>고유식별번호</th>
										<th>가입일자</th>
										<th>탈퇴일자</th>
										<th>아이디</th>
										<th>이름</th>
										<th>이메일</th>
										<th>연락처</th>
										<th></th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>번호</th>
										<th>고유식별번호</th>
										<th>가입일자</th>
										<th>탈퇴일자</th>
										<th>아이디</th>
										<th>이름</th>
										<th>이메일</th>
										<th>연락처</th>
										<th></th>
									</tr>

								</tfoot>
								<tbody>
 									<c:forEach var="member" items="${memberList }">
										<tr>
											<th>${member.rnum }</th>
											<th>${member.uniq_id_num }</th>
											<th>${member.u_join_date }</th>
											<th>${member.u_drop_date }</th>
											<th>${member.u_id }</th>
											<th>${member.u_name }</th>
											<th>${member.u_email }</th>
											<th>${member.u_tel }</th>
											<th><button type="button"  onclick="showPopup(${member.uniq_id_num });">수정하기</button></th>
											
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<!-- Page Heading -->
				<h1 class="h3 mb-2 text-gray-800">탈퇴계정 조회 및 복구 </h1>
				<p class="mb-4">
					탈퇴한 뮤하비의 내역을 조회하고 계정복구를 진행할 수 있어요<a target="_blank"
						href="#">official DataTables
						documentation</a>.
				</p>
				
				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">탈퇴 회원 조회</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>번호</th>
										<th>고유식별번호</th>
										<th>탈퇴일자</th>
										<th>아이디</th>
										<th>이름</th>
										<th>이메일</th>
										<th>연락처</th>
										<th></th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>번호</th>
										<th>고유식별번호</th>
										<th>탈퇴일자</th>
										<th>아이디</th>
										<th>이름</th>
										<th>이메일</th>
										<th>연락처</th>
										<th></th>
									</tr>

								</tfoot>
								<tbody>
 									<c:forEach var="quitMember" items="${quitList }">
										<tr>
											<th>${quitMember.rnum }</th>
											<th>${quitMember.uniq_id_num }</th>
											<th>${quitMember.u_drop_date }</th>
											<th>${quitMember.u_id }</th>
											<th>${quitMember.u_name }</th>
											<th>${quitMember.u_email }</th>
											<th>${quitMember.u_tel }</th>
											<th><button type="button"  onclick="move('memberrecovery.action?uniq_id_num=${quitMember.uniq_id_num }')">계정복구</button></th>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

			</div>
			<!-- /.container-fluid -->	
</body>

</html>