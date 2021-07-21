<%@ page import="java.io.PrintWriter"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
   String adminStr = null;

if (session.getAttribute("adminStr") != null) {
   adminStr = (String) session.getAttribute("adminStr");
   
}

String uniqueId = null;

if (session.getAttribute("uniqueId") != null) {
   uniqueId = (String) session.getAttribute("uniqueId");
   
}
String mynickName = null;

if (session.getAttribute("mynickName") != null) {
   mynickName = (String) session.getAttribute("mynickName");
   
}

%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>뮤하비 - 타성에 젖은 당신의 변화</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="css/mainpage.css" rel="stylesheet" />
<link href="css/myPage1.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<!-- 맨 위 상단 바 -->
	<c:choose>
		<c:when test="${mynickName eq null}">
			<nav class="navbar navbar-expand-lg navbar-dark">
				<div class="container px-5 mt-2">
					<div>
						<a href="mainpage.action"><img src="images/muhobbytext3.png"
							width="200px" height="40px"></a>
					</div>
					<!-- <a class="navbar-brand" href="SampleTest.jsp">M U H O B B Y</a> -->
					<div class="input-group ms-4">
						<input class="form-control" type="text" placeholder="통합 검색"
							aria-describedby="btnNavbarSearch" />
						<button class="btn btn-primary" id="btnNavbarSearch" type="button">
							<i class="bi bi-search"></i>
						</button>
					</div>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
							<li class="nav-item "><a class="nav-link me-3"
								href="classmain.action">ONEDAY클래스</a></li>
							<li class="nav-item dropdown me-3"><a
								class="nav-link dropdown-toggle " id="navbarDropdownPortfolio"
								href="#" role="button" data-bs-toggle="dropdown"
								aria-expanded="false">서비스</a>
								<ul class="dropdown-menu dropdown-menu-end">
									<li><a class="dropdown-item" href="noticeboardlist.action">공지사항</a></li>
									<c:if test="${uniqueId ne null}">
										<li><a class="dropdown-item" href="qnaboard.action">1:1
												문의내역</a></li>
									</c:if>
								</ul></li>

							<li class="nav-item dropdown me-3"><a
								class="nav-link dropdown-toggle" id="navbarDropdownPortfolio"
								href="#" role="button" data-bs-toggle="dropdown"
								aria-expanded="false">커뮤니티</a>
								<ul class="dropdown-menu dropdown-menu-end">
									<li><a class="dropdown-item" href="qa_forum.action">Q&A
											게시판 </a></li>
									<li><a class="dropdown-item" href="fflist.action">자유게시판</a></li>
								</ul></li>
							<li class="nav-item"><a class="nav-link me-3"
								href="loginform.action">로그인</a></li>
							<li class="nav-item"><a class="nav-link me-3"
								href="registerform.action">회원가입</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</c:when>

		<c:otherwise>
			<nav class="navbar navbar-expand-lg navbar-dark">
				<div class="container px-5 mt-2">
					<div>
						<a href="mainpage.action"><img src="images/muhobbytext3.png"
							width="200px" height="40px"></a>
					</div>
					<!-- <a class="navbar-brand" href="SampleTest.jsp">M U H O B B Y</a> -->
					<div class="input-group ms-4">
						<input class="form-control" type="text" placeholder="통합 검색"
							aria-describedby="btnNavbarSearch" />
						<button class="btn btn-primary" id="btnNavbarSearch" type="button">
							<i class="bi bi-search"></i>
						</button>
					</div>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
							<li class="nav-item me-3"><a class="nav-link"
								href="classmain.action">ONEDAY클래스</a></li>
							<!-- <li class="nav-item "><a class="nav-link" href="noticeboardlist.action">공지사항&nbsp;&nbsp;&nbsp;&nbsp;</a></li> -->

							<li class="nav-item dropdown me-3"><a
								class="nav-link dropdown-toggle " id="navbarDropdownPortfolio"
								href="#" role="button" data-bs-toggle="dropdown"
								aria-expanded="false">서비스</a>
								<ul class="dropdown-menu dropdown-menu-end">
									<li><a class="dropdown-item "
										href="noticeboardlist.action">공지사항</a></li>

									<!-- 관리자가 아니라면 -->
									<c:if test="${adminStr eq null}">
										<li><a class="dropdown-item " href="qnaboard.action">1대1
												문의</a></li>
									</c:if>

									<!-- 관리자라면 -->
									<c:if test="${adminStr ne null}">
										<li><a class="dropdown-item " href="qnaboardadmin.action">관리자
												1:1 문의</a></li>
									</c:if>
								</ul></li>

							<li class="nav-item dropdown me-3"><a
								class="nav-link dropdown-toggle" id="navbarDropdownPortfolio"
								href="#" role="button" data-bs-toggle="dropdown"
								aria-expanded="false">커뮤니티</a>
								<ul class="dropdown-menu dropdown-menu-end">
									<li><a class="dropdown-item " href="qa_forum.action">Q&A
											게시판 </a></li>
									<li><a class="dropdown-item " href="fflist.action">자유게시판</a></li>
								</ul></li>
							<li class="nav-item dropdown me-3"><a
								class="nav-link dropdown-toggle " id="navbarDropdownPortfolio"
								href="#" role="button" data-bs-toggle="dropdown"
								aria-expanded="false"> <%
 	out.print(mynickName);
 %> 님
							</a>
								<ul class="dropdown-menu dropdown-menu-end">
									<li><a class="dropdown-item " href="mypageform.action">마이페이지</a></li>
									<li><a class="dropdown-item " href="#">정보 수정</a></li>
									<li><hr></li>
									<li><a class="dropdown-item " href="logoutAction.action">로그아웃</a></li>
								</ul></li>
							<li class="nav-item me-3"><a class="nav-link " href="#">알림&nbsp;<i
									class="bi bi-bell-fill bold"></i>&nbsp;&nbsp;&nbsp;&nbsp;
							</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</c:otherwise>
	</c:choose>
	<br>



	<div class="container">
	<h2>강사님의 전체 후기</h2>
		<div class="row">
			<!-- Blog entries-->
			<div class="col-lg-12">
				<!-- Featured blog post-->
				
					
				
					<div class="card" >
					
					
					<div class="card-body" >
						<div class="d-flex align-items-end justify-content-between" >
							<div class="d-flex align-items-center" >
									
										<div class="col-lg-2" >
											<div class="ms-3"
												style="background: #BDBDBD; width: 200px; height: 200px; border-radius: 70%; overflow: hidden; float: left;">
												<img class="profile" src="img/${profInfos.u_photo }"
													style="width: 100%; height: 100%; object-fit: cover;">
											</div>

										</div>
										<div class="col-lg-10 mt-3" style="background-color: green;">
											<div class="ms-3" style="font-size: large;"><a href="전체후기" style="text-decoration: none; color: black;">${profInfos.u_name}	강사님</a></div><br><br>
											<div class="ms-3">🏛 총 진행 회차 : ${profInfos.total_class_unit } 회</div>
											<div class="ms-3">📝 총 후기 개수 : ${profInfos.total_review_unit } 개</div>
											<div class="ms-3">⭐ 총 별점 평균 : ${profInfos.staravg } 점</div>
										</div>
									<br> <br>${profInfos.u_info} <br> <br> 
									
								</div>
							</div>
						</div><!-- end.card-body -->
					</div><!-- end .card -->
				</div><!-- end .col-lg-12 -->

				<br>


				

				
					<div class="col-lg-12">
						<div class="card mb-4">
							<!-- 아래 a 태그는 상단에서 후기 바로가기 지정 -->
							
							<div class="card-header">전체 후기</div>
							<div class="card-body">
									<c:choose>
									<c:when test="${not empty profReviews }">
									<c:forEach var="profReview" items="${profReviews}"> 							
									
									<div class="row">
										<div class="col-lg-2">
											<div class="box"
												style="background: #BDBDBD; width: 120px; height: 120px; border-radius: 70%; overflow: hidden; margin-left: 30px;">
												<img class="profile" src="img/${profReview.u_photo}"
													style="width: 100%; height: 100%; object-fit: cover;">
											</div>
										</div>

										<div class="col-lg-10">

											<c:choose>
												<c:when test="${profReview.review_star eq '5'}">
													<div
														style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
														<p
															style="WIDTH: 100%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">


														</p>
													</div>
												</c:when>
												<c:when test="${profReview.review_star eq '4'}">
													<div
														style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
														<p
															style="WIDTH: 80%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">


														</p>
													</div>
												</c:when>
												<c:when test="${profReview.review_star eq '3'}">
													<div
														style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
														<p
															style="WIDTH: 60%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">


														</p>
													</div>
												</c:when>
												<c:when test="${profReview.review_star eq '2'}">
													<div
														style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
														<p
															style="WIDTH: 40%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">


														</p>
													</div>
												</c:when>
												<c:otherwise>
													<div
														style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
														<p
															style="WIDTH: 20%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">


														</p>
													</div>
												</c:otherwise>


											</c:choose>

											<br> 
											<span>${profReview.u_name }</span>
											<span>${profReview.review_wrt_date }</span><br>
											<span>수업명 : ${profReview.c_title } </span>
											<br><br>
											${profReview.review_content }<br><br>
										</div>
										<hr>
										<br><br>
										</c:forEach>
									</c:when>
									<c:otherwise>
									등록된 후기가 없습니다.
									</c:otherwise>
									
									
									</c:choose>
							
									
										
										
										
									
									
									</div><!-- end .row -->
									
									
									
									

								


							</div>
						</div>
				
				




			

	</div> 
	
	</div><!-- end container -->

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>


</body>
</html>
