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



</script>

</head>

<body>



			
			<div class="container-fluid">

	
				
				<!-- Page Heading -->
				<h1 class="h3 mb-2 text-gray-800">환불요청 </h1>
				<p class="mb-4">
					원데이클래스 환불 요청을 처리해 주세요
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
										<th>신청일자</th>
										<th>신청인</th>
										<th>신청인연락처</th>
										<th>결제일자</th>
										<th>결제금액</th>
										<th>클래스</th>
										<th>클래스예정일자</th>
										<th>강사이름</th>
										<th>전화번호</th>
										<th>확정여부</th>
										<th>남은기간</th>
									</tr>
								</thead>
								<tbody>
								<%-- rnum, refund_req_num,refund_req_date,u_name,	u_tel,pay_date,	pay_price,c_title,c_open_date,p_name,p_tel,confirm_check,days_left --%>
  									<c:forEach var="refundRequest" items="${refundRequestList }">
										<tr>
											<th>${refundRequest.rnum }</th>
											<%-- <th>${refundRequest.refund_req_num }</th> --%>
											<th>${refundRequest.refund_req_date }</th>
											<th>${refundRequest.u_name }</th>
											<th>${refundRequest.u_tel }</th>
											<th>${refundRequest.pay_date }</th>
											<th>${refundRequest.pay_price }</th>
											<th>${refundRequest.c_title }</th>
											<th>${refundRequest.c_open_date }</th>
											<th>${refundRequest.p_name }</th>
											<th>${refundRequest.p_tel }</th>
											<th>${refundRequest.confirm_check }</th>
											<th>${refundRequest.days_left }</th>
											<th><button type="button"  onclick="location.href='refundprocessingpage.action?refund_req_num=${refundRequest.refund_req_num}&days_left=${refundRequest.days_left }&pay_price=${refundRequest.pay_price }'">환불처리</button></th>
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