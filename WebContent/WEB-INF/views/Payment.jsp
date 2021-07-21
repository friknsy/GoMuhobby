<%@page import="java.io.PrintWriter"%>
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
   System.out.println(adminStr + "관리자확인");
}

String uniqueId = null;

if (session.getAttribute("uniqueId") != null) {
   uniqueId = (String) session.getAttribute("uniqueId");
   System.out.println(uniqueId + "고유식별번호");
}

String mynickName = null;

if (session.getAttribute("mynickName") != null) {
   mynickName = (String) session.getAttribute("mynickName");
   System.out.println(mynickName + "닉네임");
}

/* 만약 로그인 되어 있지 않은 회원이라면 로그인 페이지로 이동  */
if(uniqueId == null )
{
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("alert('로그인 후 이용가능합니다 .')");
   script.println("location.href='login.action'");
   script.println("</script>");
}   



%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment.jsp</title>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Blog Post - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="<%=cp %>/assets/favicon.ico" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<%=cp %>/css/mainpage.css" rel="stylesheet" />
<link href="<%=cp %>/css/myPage1.css" rel="stylesheet" />

<!-- 부트스트랩 css -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> --> 


<!-- 제이쿼리 script -->
<script type="text/javascript" src="<%=cp%>/js/jquery-3.6.0.min.js"></script>
 	
<!-- 부트스트랩 script -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="js/simple-datatables.js""></script>
<script src="js/datatables-simple-demo.js"></script>

<!-- 아임포트 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style type="text/css">
	
	table
	{
		margin-left: auto;
		margin-right: auto;
	}
	
	

</style>

<script type="text/javascript">
	
	$(function()
	{
		
		// 결제 버튼 선택시 색상 변경 및 클래스 추가
		$(".payBtn").focus(function()
		{
			$(".payBtn").css('background-color', '');  //-- 색상 초기화
			$(this).css('background-color', '#D3D3D3');
			
			$(".payBtn").removeClass("class"); //-- 클래스 초기화
			$(this).addClass("class");
		});
		
		// 유효성 체크
		$(".payment").click(function()
		{
			//alert("테스트");
			
			if ( $("#check").is(":checked") == false )
			{
				alert("결제 및 환불 약관에 동의해주세요.");
				return;
			}
			
			if ( $(".class").val() == null )
			{
				alert("결제수단을 선택해주세요.");
				return;
			}
			
			if ( $(".class").val() == "kakao" )
			{
				kakaopay();
				
			}
		
		});
		
		

		
	});
	
	
	
	// 카카오페이 결제
	function kakaopay()
	{
		// 결제시 들어갈 값
		var c_title = document.getElementById("c_title").value;
		var pay_price = document.getElementById("pay_price").value;
		var u_name = document.getElementById("u_name").value;
		var u_tel = document.getElementById("u_tel").value;
		
		
		/* 결제 */
		var IMP = window.IMP; // 생략가능
		IMP.init('imp09580094'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		IMP.request_pay({
		    pg : 'kakao', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : c_title ,
		    amount : pay_price,
		    //buyer_email : 'iamport@siot.do',
		    buyer_name : u_name,
		    buyer_tel : u_tel,
		    //buyer_addr : '서울특별시 강남구 삼성동',
		    //buyer_postcode : '123-456',
		    //m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        $("form").submit();
		        
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
		
	}
	
	
	
</script>

</head>
<body>

<body class="sb-nav-fixed">
       		<!-- 맨 위 상단 바 -->
            <c:choose>
            	<c:when test="${mynickName eq null}">
		            <nav class="navbar navbar-expand-lg navbar-dark">
		                <div class="container px-5 mt-2">
		                    <div>
								<a href="mainpage.action"><img src="images/muhobbytext3.png" width="200px" height="40px"></a>
							</div>
							<!-- <a class="navbar-brand" href="SampleTest.jsp">M U H O B B Y</a> -->
							<div class="input-group ms-4">
		                    	<input class="form-control" type="text" placeholder="통합 검색"  aria-describedby="btnNavbarSearch" />
		                    	<button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="bi bi-search"></i></button>
		                	</div>
		                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
		                        	<li class="nav-item "><a class="nav-link me-3" href="classmain.action" >ONEDAY클래스</a></li>		                        	
		                        	<li class="nav-item dropdown me-3">
		                                <a class="nav-link dropdown-toggle " id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">서비스</a>
		                                <ul class="dropdown-menu dropdown-menu-end">
		                                	<li><a class="dropdown-item" href="noticeboardlist.action">공지사항</a></li>
		                                	<c:if test="${uniqueId ne null}">
												<li><a class="dropdown-item" href="qnaboard.action">1:1 문의내역</a></li>	
											</c:if>
		                                </ul>
		                            </li>
		                        	
		                        	<li class="nav-item dropdown me-3">
		                                <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
		                                <ul class="dropdown-menu dropdown-menu-end">
		                                	<li><a class="dropdown-item" href="qa_forum.action">Q&A 게시판 </a></li>
		                                    <li><a class="dropdown-item" href="fflist.action">자유게시판</a></li>
		                                </ul>
		                            </li>
		                            <li class="nav-item"><a class="nav-link me-3" href="loginform.action" >로그인</a></li>	
		                            <li class="nav-item"><a class="nav-link me-3" href="registerform.action" >회원가입</a></li>
		                        </ul>
		                    </div>
		                </div>
		            </nav>
	            </c:when>
	            
	            <c:otherwise>
		            <nav class="navbar navbar-expand-lg navbar-dark">
		                <div class="container px-5 mt-2">
		                    <div>
								<a href="mainpage.action"><img src="images/muhobbytext3.png" width="200px" height="40px"></a>
							</div>
							<!-- <a class="navbar-brand" href="SampleTest.jsp">M U H O B B Y</a> -->
							<div class="input-group ms-4">
		                    	<input class="form-control" type="text" placeholder="통합 검색"  aria-describedby="btnNavbarSearch" />
		                    	<button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="bi bi-search"></i></button>
		                	</div>
		                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
		                        	<li class="nav-item me-3"><a class="nav-link" href="classmain.action" >ONEDAY클래스</a></li>
		                        	<!-- <li class="nav-item "><a class="nav-link" href="noticeboardlist.action">공지사항&nbsp;&nbsp;&nbsp;&nbsp;</a></li> -->
		                        	
		                        	<li class="nav-item dropdown me-3">
		                                <a class="nav-link dropdown-toggle " id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">서비스</a>
		                                <ul class="dropdown-menu dropdown-menu-end">
		                                	<li><a class="dropdown-item " href="noticeboardlist.action">공지사항</a></li>
											
												<!-- 관리자가 아니라면 -->
												<c:if test="${adminStr eq null}">
													<li><a class="dropdown-item " href="qnaboard.action">1대1 문의</a></li>	
												</c:if>
												
												<!-- 관리자라면 -->
												<c:if test="${adminStr ne null}">
													<li><a class="dropdown-item " href="qnaboardadmin.action">관리자 1:1 문의</a></li>
												</c:if>
		                                </ul>
		                            </li>
		                        	
		                        	<li class="nav-item dropdown me-3">
		                                <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
		                                <ul class="dropdown-menu dropdown-menu-end">
		                                	<li><a class="dropdown-item " href="qa_forum.action">Q&A 게시판 </a></li>
		                                    <li><a class="dropdown-item " href="fflist.action">자유게시판</a></li>
		                                </ul>
		                            </li>
		                            <li class="nav-item dropdown me-3">
		                                <a class="nav-link dropdown-toggle " id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><%out.print(mynickName); %> 님</a>
		                                <ul class="dropdown-menu dropdown-menu-end">
		                                    <li><a class="dropdown-item " href="mypageform.action">마이페이지</a></li>
		                                    <li><a class="dropdown-item " href="#">정보 수정</a></li>
		                                    <li><hr></li>
		                                    <li><a class="dropdown-item " href="logoutAction.action">로그아웃</a></li>
		                                </ul>
		                            </li>
		                            <li class="nav-item me-3"><a class="nav-link " href="#" >알림&nbsp;<i class="bi bi-bell-fill bold"></i>&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		                        </ul>
		                    </div>
		                </div>
		            </nav>
            	</c:otherwise>
            </c:choose>



<br>
<div class="container px-5 mt-6 mb-2">
	<div class="panel-group">
		<div class="panel-default">
			<div class="panel-body">
				<div>
					<h2><b>클래스 신청하기</b></h2>
					<br>
					<div style="background-color :#B9E2FA; height: auto; width:50%">
						<div style="text-align: left; padding: 10px;">
							<a><img src="images/piano.jpg" width="120px" height="120px"></a>
							<div style="float: right; display: inline-block;">
								<ul>
									<li style="font-weight: bold;"><a>${classInfo.c_title}</a></li>
									<li><a>${classInfo.prof_name }<small> 강사</small></a></li>
									<li><a>${classInfo.c_addr }</a></li>
									<li><a>수업날짜 및 시간 / ${classInfo.c_open_date }</a></li>
									<li><a>소요시간 / ${classInfo.c_runtime }시간</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<br><br>
				<div >
					<h4><b>신청자 정보</b></h4>
					신청자 정보가 일치하는지 확인해주세요.
					
				</div>
				<hr>
				<form>	
					<div class="form-group">
						<label for="name">
							이름 
						</label>
						<input type="text" class="form-control" id="name" name="name" style="width: 40%;"
						disabled="disabled" value="${memberInfo.u_name }">
					</div>
					
					<div class="form-group">
						<label for="telephone">
							전화번호 
						</label>
						<input type="text" class="form-control" id="telephone" name="telephone" style="width: 40%;"
						disabled="disabled" value="${memberInfo.u_tel }">
					</div>
				</form>
					<hr>
			
				<div >
					<h4><b>결제수단 </b></h4>
					<b>결제 금액 : ${classInfo.c_price }</b>
					
					
				</div>
				<br><br>
			<form>
					<div>
						<button type="button" class="btn btn-outline-secondary payBtn" value="card">신용카드</button>
						<button type="button" class="btn btn-outline-secondary payBtn" value="telephone">휴대폰 소액결제</button>
						<button type="button" class="btn btn-outline-secondary payBtn" value="virtual">가상계좌</button>
						<button type="button" class="btn btn-outline-secondary payBtn" value="kakao">카카오페이</button>
					</div>
			</form>
			</div>
			<hr>
			<div>
				결제 및 환불에 동의하시겠습니까?    <input type="checkbox" id="check" ><br>
				<p style="font-size: small;"><span style="color: red;">[개인정보 제 3자 제공],[클래스 환불 정책]</span> 적용 동의에 관한 내용을 모두 이해하였으며, 이에 동의합니다.</p> 
			
			</div>
		</div><!-- close .panel-default -->
	</div>
</div>


<div class="col text-center">
	<form id="form" action="paymentresult.action" method="post">
		<!-- 결제 시 필요한 정보 -->
		<input type="hidden" id="c_title" name="c_title" value="${classInfo.c_title }">
		<input type="hidden" id="u_name" name="u_name" value="${memberInfo.u_name }">
		<input type="hidden" id="u_tel" name="u_tel" value="${memberInfo.u_tel }">
		
		<input type="hidden" id="c_open_num" name="c_open_num" value="${classInfo.c_open_num }">
		<input type="hidden" id="uniq_id_num" name="uniq_id_num" value="${memberInfo.uniq_id_num }">
		<input type="hidden" id="pay_price" name="pay_price" value="${classInfo.c_price }">
		<button type="button" class="btn btn-outline-danger payment">결제하기</button>
	</form>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br>

</body>
</html>