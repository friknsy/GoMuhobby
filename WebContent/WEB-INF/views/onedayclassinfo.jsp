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

	<!-- DTO 로 넘어오는 값 "classinfo.~~" -->
	<!-- c_info_num,p_info_num, town_code,c_title,c_info_date,c_runtime,min_person,max_person,c_detail_info,c_photo,c_video,c_addr,c_price,u_name -->

	<div class="container">
		<div class="row">
			<!-- Blog entries-->
			<div class="col-lg-8">
				<!-- Featured blog post-->
				<div class="card mb-4">
					<a href="#"><img src="img/${classinfo.c_photo}"
						style="width: 855px; height: 365px;"></a>
					<div class="card-body">
						<div class="small text-muted mt-2 mb-2" style="font-weight: bold;">${classinfo.u_name}&nbsp강사님</div>
						<h2 class="card-title">${classinfo.c_title}
							<a class="ms-2 btn btn-outline-light btn-sm1">${catIntro.music_cat_small}</a>
						</h2>
						<a class="btn btn-primary me-4 mt-2" href="#!"
							style="color: #c79cf5;">상세정보</a> <a
							class="btn btn-primary me-4 mt-2" href="#!"
							style="color: #c79cf5;">후기</a> <a
							class="btn btn-primary me-4 mt-2" href="#!"
							style="color: #c79cf5;">QNA</a> <a
							class="btn btn-primary me-4 mt-2" href="#!"
							style="color: #c79cf5;">변경 및 취소</a> <br> <br> [변경 및 취소]<br>
						개인 사정으로 인한 결석은 환불되지 않습니다.<br> <br> [환불 규정]<br> 1.
						수업 2일 전 취소 : 100% 환불<br> 2. 수업 1일 전 취소 : 50% 환불<br> 3.
						수업 당일 취소 : 환불불가 <br> <br> <br> 클래스 등록일자
						${classinfo.c_info_date}

					</div>
				</div>

				<hr>

				<div class="row">
					<div class="col-lg-12">
						<div class="card mb-4">
							<div class="card-header">클래스 소개글</div>
							<div class="card-body">
								${classinfo.c_detail_info}<br> <a
									class="btn btn-primary me-4 mt-2 mb-2" href="#!"
									style="color: #c79cf5; border-color: #c79cf5; width: 200px;">#
									이런점이 좋아요</a><br> 1. 본인이 어떻게 노래 부르고 있는지 파악할 수 있어요<br> 2.
								남들 앞에서 자신있게 노래 할 수 있어요<br> 3. 자신만의 목소리를 찾을 수 있어요<br> <br>
								<a class="btn btn-primary me-4 mt-2 mb-2" href="#!"
									style="color: #c79cf5; border-color: #c79cf5; width: 200px;">#
									이런분들께 추천해요</a><br> 1. 단기간에 축가를 완성하고 싶으신 분<br> 2. 특별한 날
								완벽한 노래를 하고싶으신 분<br> <br> <a
									class="btn btn-primary me-4 mt-2 mb-2" href="#!"
									style="color: #c79cf5; border-color: #c79cf5; width: 200px;">커리큘럼</a><br>
								1. 노래를 통한 발성습관체크<br> 2. 학생 발성상태에 맞는 발음과 툴을 이용한 발성과 발음교정 및
								트레이닝<br> 3. 노래 적용 으로 진행됩니다.^^<br> <br> <a
									class="btn btn-primary me-4 mt-2 mb-2" href="#!"
									style="color: #c79cf5; border-color: #c79cf5; width: 200px;">준비물</a><br>
								열심히 하고자 하는 마음가짐 최고의 목상태!<br> <br> <a
									class="btn btn-primary me-4 mt-2 mb-2" href="#!"
									style="color: #c79cf5; border-color: #c79cf5; width: 200px;">유의
									사항</a><br> 공동현관에서 연락주세요<br>
							</div>
						</div>
					</div>

					<div class="col-lg-12">
						<div class="card mb-4">
							<div class="card-header">강사님 영상</div>
							<div class="card-body">
								<iframe width="560" height="315"
									src="https://www.youtube.com/embed/3WOwa0lWEz4"
									title="YouTube video player" frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen> </iframe>
							</div>
						</div>
					</div>

					<div class="col-lg-12">
						<div class="card mb-4">
							<div class="card-header">찾아 오시는 길</div>
							<div class="card-body">
								<div id="map" style="width: 100%; height: 450px;"></div>

								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2b9b2cf7a452418866a021d167da7679&libraries=services"></script>
								<script>
									var addr = '${classinfo.c_addr }'; /* 여기서 꼭 '' 따옴표를 붙여줘야 자바스크립트 영역에서 문자열로 인식한다. */
									var mapContainer = document
											.getElementById('map'), // 지도를 표시할 div 
									mapOption =
									{
										center : new kakao.maps.LatLng(
												33.450701, 126.570667), // 지도의 중심좌표
										level : 3
									// 지도의 확대 레벨
									};

									// 지도를 생성합니다    
									var map = new kakao.maps.Map(mapContainer,
											mapOption);

									// 주소-좌표 변환 객체를 생성합니다
									var geocoder = new kakao.maps.services.Geocoder();

									// 주소로 좌표를 검색합니다
									geocoder
											.addressSearch(
													addr,
													function(result, status)
													{

														// 정상적으로 검색이 완료됐으면 
														if (status === kakao.maps.services.Status.OK)
														{

															var coords = new kakao.maps.LatLng(
																	result[0].y,
																	result[0].x);

															// 결과값으로 받은 위치를 마커로 표시합니다
															var marker = new kakao.maps.Marker(
																	{
																		map : map,
																		position : coords
																	});

															// 인포윈도우로 장소에 대한 설명을 표시합니다
															var infowindow = new kakao.maps.InfoWindow(
																	{
																		content : '<div style="width:150px;text-align:center;padding:6px 0;">강의진행장소</div>'
																	});
															infowindow
																	.open(map,
																			marker);

															// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
															map
																	.setCenter(coords);
														}
													});
								</script>



								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2b9b2cf7a452418866a021d167da7679"></script>
								<script>
									var container = document
											.getElementById('map');
									var options =
									{
										center : new kakao.maps.LatLng(
												33.450701, 126.570667),
										level : 3
									};

									var map = new kakao.maps.Map(container,
											options);
								</script>


								<br>주소: ${classinfo.c_addr }
							</div>
						</div>
					</div>

					<div class="col-lg-12">
						<div class="card mb-4">
							<div class="card-header">편의 사항 제공</div>
							<div class="card-body">
								<c:forEach var="cv" items="${cvs }">
									<a class="btn btn-primary me-4 mt-2 mb-2" href="#!">
										🎵${cv.cv_name }</a>
								</c:forEach>


								<!-- <a class="btn btn-primary me-4 mt-2 mb-2" href="#!"> 🌭 간식 제공</a><br> -->
							</div>
						</div>
					</div>

					<div class="col-lg-12">
						<div class="card mb-4">
							<div class="card-header">후기 작성</div>
							<div class="card-body">


								<c:forEach var="review" items="${reviews}">

									<div class="row">
										<div class="col-lg-2">
											<div class="box"
												style="background: #BDBDBD; width: 100px; height: 100px; border-radius: 70%; overflow: hidden; float: left;">
												<img class="profile" src="img/${review.u_photo }"
													style="width: 100%; height: 100%; object-fit: cover;">
											</div>
										</div>

										<div class="col-lg-10">

											<c:choose>
												<c:when test="${review.review_star eq '5'}">
													<div
														style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
														<p
															style="WIDTH: 100%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">


														</p>
													</div>
												</c:when>
												<c:when test="${review.review_star eq '4'}">
													<div
														style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
														<p
															style="WIDTH: 80%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">


														</p>
													</div>
												</c:when>
												<c:when test="${review.review_star eq '3'}">
													<div
														style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
														<p
															style="WIDTH: 60%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">


														</p>
													</div>
												</c:when>
												<c:when test="${review.review_star eq '2'}">
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

											<br> <span>${review.u_name}</span><span>
												${review.review_wrt_date} </span> <br> <br>
											${review.review_content }
										</div>
									</div>
									<br>
									<br>

								</c:forEach>


							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-12">
					<div class="card mb-4">
						<div class="card-header">클래스 QnA</div>
						<div class="card-body">

							<c:forEach var="QnA" items="${QnAs}">
								<div class="row">
									<div class="col-lg-2">
										<div class="box"
											style="background: #BDBDBD; width: 100px; height: 100px; border-radius: 70%; overflow: hidden; float: left;">
											<img class="profile" src="img/${QnA.u_photo }"
												style="width: 100%; height: 100%; object-fit: cover;">
										</div>
									</div>

									<div class="col-lg-8">
										<br> <span>${QnA.user_nickname }${QnA.uniq_id_num }</span>
										<br> <span>${QnA.c_qa_wrt_date }</span> <br> Q.
										${QnA.c_qa_num } ${QnA.c_qa_content }<br>
										
										
										
										<c:if test="${QnA.uniq_id_num eq uniqueId}"> <%--작성자만 질문글을 삭제할 수 있도록 처리 --%>
										<%-- <span><a href="classquestiondelete.action?c_qa_num=${QnA.c_qa_num}" onclick="confirm('해당 질문을 정말로 삭제하시겠습니까?')">삭제</a></span> --%>
										<span><a href="javascript:void(0);" onclick="questionDelete(${QnA.c_qa_num})">삭제</a></span>
										

										
										
										<span><a href="javascript:void(0);" value="${QnA.c_qa_num}" onclick="questionUpdatePopup(${QnA.c_qa_num})">수정</a></span>	
										<!-- yurim/javascript:void(0)을 하면 onclick의 function만 수행하고 href속성에 의해 페이지 이동하지 않는다. /20210720 -->									
										</c:if>
										<script type="text/javascript">
											function questionUpdatePopup(c_qa_num)
											{
												window.open("classquestionupdatepopup.action?c_qa_num="
														+ c_qa_num, "질문수정",
														"width=400, height=300, left=100, top=50");
											}

												
												
												function questionDelete(c_qa_num)
												{
													
													if(confirm('해당 질문을 정말로 삭제하시겠습니까?'))
													{
														
														var sendData = {
																c_qa_num : c_qa_num
														}
														$.ajax({
													 		method: "POST",
													 		url:"<c:url value='classquestiondelete.action'/>",
													 		data:sendData,
													 		success:function(data){
													 			
													 			location.reload();
													 		},
													 		complete:function(data){
													 			
													 		}
													 	});
														
													}
													
												}

											


										

										
										</script>
									</div>
									<br> <br>


									<c:if test="${catIntro.uniq_id_num eq uniqueId}">  <%-- 해당 클래스를 개설한 강사의 경우에만 버튼 활성화 --%>

										<div class="col-lg-2">

<%-- 											<c:if test="${empty QnA.p_answ_content }">
												답변글이 없는 경우만 답변하기 버튼 활성화
												<button type="button" class="btn btn-primary"
													value="<c:out value='${QnA.c_qa_num}'/>"
													onclick="answerInsertPopup(this.value)">답변하기</button>
											</c:if>
											<c:if test="${not empty QnA.p_answ_content }">
												<button type="button" class="btn btn-primary"
													value="${QnA.p_answ_num}"
													onclick="answerUpdatePopup(this.value)">답변수정</button>
												<button type="button" class="btn btn-primary"
													value="${QnA.p_answ_num}"
													onclick="answerDeletePopup(this.value)">답변삭제</button>
											</c:if> --%>
											
											<%-- 답변글이 없는 경우만 답변하기 버튼 활성화 --%>
											<c:choose>
												<c:when test="${empty QnA.p_answ_content }">
													<button type="button" class="btn btn-primary"
														value="<c:out value='${QnA.c_qa_num}'/>"
														onclick="answerInsertPopup(this.value)">답변하기</button>												
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-primary"
														value="${QnA.p_answ_num}"
														onclick="answerUpdatePopup(this.value)">답변수정</button>
													<button type="button" class="btn btn-primary"
														value="${QnA.p_answ_num}"
														onclick="answerDeletePopup(this.value)">답변삭제</button>												
												</c:otherwise>
											</c:choose>
										</div>
									</c:if>
									<br>
								</div>
								<c:if test="${not empty QnA.p_answ_content}">
									<!-- 답변이 있는 경우에만 보이도록 처리 -->
									<div class="row">
										<div class="col-lg-1"
											style="padding-left: 150px; padding-top: 30px;">
											<div class="box"
												style="background: #BDBDBD; width: 50px; height: 50px; border-radius: 70%; overflow: hidden; float: left;">
												<img class="profile" src="img/${profPhoto.u_photo }"
													style="width: 100%; height: 100%; object-fit: cover;">
											</div>
										</div>
										<div class="col-lg-5" style="padding-left: 70px;">
											<br> <span>${classinfo.u_name} 강사님</span> <br> <span>${QnA.p_answ_wrt_date }</span>
											<br> A. ${QnA.p_answ_content }
										</div>
									</div>
									<br>
								</c:if>
								
								<hr>
							</c:forEach>
							<div class="row">
								<!-- <form action="classquestioninsert.action" method="post"> -->
								
									<input type="hidden" name="uniq_id_num" id="uniq_id_num" value="<%=uniqueId%>">
									<input type="hidden" name="c_info_num" id="c_info_num" value="${classinfo.c_info_num}">
									<div class="col-lg-10">
										<textarea rows="5" cols="75" name="c_qa_content"
											 id="questionContent"></textarea>
									</div>

									<!-- 로그인이 되어있지 않다면 -->
									<c:choose>
										<c:when test="${mynickName eq null}">
											로그인 후 질문 등록이 가능합니다.
										</c:when>
										<c:otherwise>
											<div class="col-lg-2" style="padding-top: 40px;">
												<button type="submit" class="btn btn-primary" id="submitQuestion">질문등록</button>
											</div>
										</c:otherwise>
									</c:choose>
								<!-- </form> -->
							</div>
							<script type="text/javascript">
								$(function()
								{

									
									$("#submitQuestion").click(function()
									{
										
										if ($("#questionContent").val() == "")
										{
											alert("질문을 입력하세요.");
											return;
										}
										
									 	var content = $("#questionContent").val();
									 	
									 	var sendData = {
									 			uniq_id_num : $("#uniq_id_num").val()  // 고유식별번호
									 			,c_info_num  : $("#c_info_num").val() // 해당 클래스 정보 번호
									 			,c_qa_content : $("#questionContent").val() // 질문글 내용
									 			
									 	};
									 	
									 	$.ajax({
									 		method: "POST",
									 		url:"<c:url value='classquestioninsert.action'/>",
									 		data:sendData,
									 		success:function(data){
									 			
									 			location.reload();
									 		},
									 		complete:function(data){
									 			
									 		}
									 	});

									});
									
				

								});
							
							</script>



						</div>
					</div>
				</div>

				<script type="text/javascript">
					function answerInsertPopup(c_qa_num)
					{

						window.open("answerInsertPopup.action?c_qa_num="
								+ c_qa_num, "답변등록",
								"width=400, height=300, left=100, top=50");
					}

					function answerUpdatePopup(p_answ_num)
					{
						window.open("answerUpdatePopup.action?p_answ_num="
								+ p_answ_num, "답변수정",
								"width=400, height=300, left=100, top=50");
					}

					function answerDeletePopup(p_answ_num)
					{

						if (confirm("답변을 삭제하겠습니까?"))
						{
							document.location.href = "answerdelete.action?p_answ_num="
									+ p_answ_num;

						}

					}
				</script>


			</div>
			<!-- end of col-lg-8 -->

			<!--                <div class="col-lg-12">
	                    	<div class="card mb-4">
	                        	<div class="card-header">원데이클래스 QnA</div>
	                        	<div class="card-body">
									질문과 답변들
	                        	</div>
	                    	</div>
	                    </div> -->
			<div class="col-lg-4">

				<!-- 강사님 소개 -->
				<div class="card">
					<div class="card-header">강사님 소개</div>
					<div class="card-body">
						<div class="d-flex align-items-end justify-content-between">
							<div class="d-flex align-items-center">
								<div>
									<div class="row mt-2">
										<div class="col-lg-4 text-center">
											<div class="ms-3"
												style="background: #BDBDBD; width: 100px; height: 100px; border-radius: 70%; overflow: hidden; float: left;">
												<img class="profile" src="img/${profPhoto.u_photo }"
													style="width: 100%; height: 100%; object-fit: cover;">
											</div>

										</div>
										<div class="col-lg-8 mt-3">
											<div class="ms-3" style="font-size: large;">${classinfo.u_name}
												강사님</div>
											<div class="ms-3">🏛 총 진행 회차 : ${totalClasses } 회</div>
											<div class="ms-3">📝 총 후기 개수 : ${totalReviews } 개</div>
											<div class="ms-3">⭐ 총 별점 평균 : ${starAvg } 점</div>
										</div>
									</div>
									<br> <br> ${catIntro.u_info} <br> <br> ⏰
									진행시간 : ${classinfo.c_runtime}시간 <br> 🚩 장소 :
									${classinfo.c_addr} <br> 🎤 모집인원 :
									최대${classinfo.max_person}명 최소${classinfo.min_person}명 <br>
									💰 수강료 : ${classinfo.c_price}원 <br> <br>
								</div>
							</div>
						</div>
					</div>
				</div>

				<br>

				<!-- 클래스 회차 일정-->
				<div class="card mb-4">
					<div class="card-header">클래스 회차 일정</div>
					<div class="card-body">
						<div class="row">

							<div class="btn-group-vertical" role="group" aria-label="..."
								style="width: 100%;">



								<c:forEach var="time" items="${classTimes}">
									<!-- JSTL fmt 사용해서 날짜 형식 맞춤 -->
									
									
									<c:choose> <%--만약 결제인원이 최대인원과 같다면 , 즉 신청인원이 다 찼으면 버튼비활성화 --%>
										<c:when test="${time.payments+0 >= classinfo.max_person+0}">
											<button type="button" class="btn btn-primary datebutton"
												value="${time.c_open_num}" disabled="disabled">
												<%-- ${time.c_open_num} --%>
												<fmt:parseDate value="${time.c_open_date}" var="dateValue"
													pattern="yyyy-MM-dd HH:mm" />
												<fmt:formatDate value="${dateValue}"
													pattern="yyyy년 MM월 dd일 HH시 mm분" />
												(${time.payments }명 / ${classinfo.max_person}명) --마감--
											</button>										
										</c:when>
										<c:otherwise>
										
											<button type="button" class="btn btn-primary datebutton"
												value="${time.c_open_num}">
												<%-- ${time.c_open_num} --%>
												<fmt:parseDate value="${time.c_open_date}" var="dateValue"
													pattern="yyyy-MM-dd HH:mm" />
												<fmt:formatDate value="${dateValue}"
													pattern="yyyy년 MM월 dd일 HH시 mm분" />
												(${time.payments }명 / ${classinfo.max_person}명)
											</button>	
										
										</c:otherwise>
									</c:choose>

									
									
									
									
									
								</c:forEach>

								<script type="text/javascript">
									$(
											function()
											{
												// .attr()은 속성값(property)을 설정할 수 있다.
												$('.datebutton').click(
												
														function()
														{	
																	
															
															//여기서 'href='신청페이지주소?c_open_num='22   이런식으로 넘겨줘서 계속 에러가남. 따옴표 한쪽을 바깥쪽으로 빼줌
															/* get방식으로 넘겨주는 uniq_id_num 이 null 일 경우 에러가 발생하기 때문에 임의*/
 														
 																str = "location.href='payment.action?c_open_num="
 																	+ $(this).val().toString()+ "&uniq_id_num="  + ${uniqueId} + "'";
														
															$('.enrollbutton').attr("onclick",str);
														});

													
											});
								</script>

								<br> <br>
								
								<c:choose>
									<c:when test="${not empty uniqueId}">
									 	<button type="button" class="btn btn-primary enrollbutton" onclick="alert('시간을 먼저 선택해 주세요!')">신청하기</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-primary" onclick="isNotMember()">신청하기</button>
									</c:otherwise>									
								</c:choose>
								
								<script type="text/javascript">
									function isNotMember()
									{
										if(confirm("로그인 후 이용가능한 서비스입니다. 로그인페이지로 이동하시겠습니까?")) { window.location.href = "loginform.action" }
									}
								
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>


</body>
</html>
