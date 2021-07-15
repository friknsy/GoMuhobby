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
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>뮤하비 - 타성에 젖은 당신의  변화</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="css/mainpage.css" rel="stylesheet" />
        <link href="css/myPage1.css" rel="stylesheet" />
    </head>
    <body>
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
            
            <!-- DTO 로 넘어오는 값 "classinfo.~~" -->
            <!-- c_info_num,p_info_num, town_code,c_title,c_info_date,c_runtime,min_person,max_person,c_detail_info,c_photo,c_video,c_addr,c_price,u_name -->
            ${classinfo.c_photo} 등록일자${classinfo.c_info_date}
	        <div class="container">
            <div class="row">
                <!-- Blog entries-->
                <div class="col-lg-8">
                    <!-- Featured blog post-->
                    <div class="card mb-4">
                        <a href="#"><img src="images/mic.jpg" style="width: 855px; height: 365px;"></a>
                        <div class="card-body">
                            <div class="small text-muted mt-2 mb-2" style="font-weight: bold;">${classinfo.u_name}&nbsp강사님</div>
                            <h2 class="card-title">${classinfo.c_title} <a class="ms-2 btn btn-outline-light btn-sm1">보컬</a> </h2>
                            <a class="btn btn-primary me-4 mt-2" href="#!" style="color: #c79cf5;">상세정보</a>
                            <a class="btn btn-primary me-4 mt-2" href="#!" style="color: #c79cf5;">후기</a>
                            <a class="btn btn-primary me-4 mt-2" href="#!" style="color: #c79cf5;">QNA</a>
                            <a class="btn btn-primary me-4 mt-2" href="#!" style="color: #c79cf5;">변경 및 취소</a>
                        <br>
                        <br>
                        [변경 및 취소]<br>
						개인 사정으로 인한 결석은 환불되지 않습니다.<br><br>
						[환불 규정]<br>
						1. 수업 2일 전 취소 : 100% 환불<br>
						2. 수업 1일 전 취소 : 50% 환불<br>
						3. 수업 당일 취소 : 환불불가
                        
                        </div>
                    </div>
                    
                    <hr>
                    
                    <div class="row">
                    	<div class="col-lg-12">
	                    	<div class="card mb-4">
	                        	<div class="card-header">클래스 소개글</div>
	                        	<div class="card-body">
	                        		${classinfo.c_detail_info}<br>
									<a class="btn btn-primary me-4 mt-2 mb-2" href="#!" style="color: #c79cf5; border-color: #c79cf5; width: 200px;"># 이런점이 좋아요</a><br>                        	
									1. 본인이 어떻게 노래 부르고 있는지 파악할 수 있어요<br>
									2. 남들 앞에서 자신있게 노래 할 수 있어요<br>
									3. 자신만의 목소리를 찾을 수 있어요<br><br>
									
									<a class="btn btn-primary me-4 mt-2 mb-2" href="#!" style="color: #c79cf5; border-color: #c79cf5; width: 200px;"># 이런분들께 추천해요</a><br>
									1. 단기간에 축가를 완성하고 싶으신 분<br>
									2. 특별한 날 완벽한 노래를 하고싶으신 분<br><br>
									
									<a class="btn btn-primary me-4 mt-2 mb-2" href="#!" style="color: #c79cf5; border-color: #c79cf5; width: 200px;">커리큘럼</a><br>
									1. 노래를 통한 발성습관체크<br>
									2. 학생 발성상태에 맞는 발음과 툴을 이용한 발성과 발음교정 및 트레이닝<br>
									3. 노래 적용 으로 진행됩니다.^^<br><br>
									
									<a class="btn btn-primary me-4 mt-2 mb-2" href="#!" style="color: #c79cf5; border-color: #c79cf5; width: 200px;">준비물</a><br>
									열심히 하고자 하는 마음가짐 최고의 목상태!<br><br>
									
									<a class="btn btn-primary me-4 mt-2 mb-2" href="#!" style="color: #c79cf5; border-color: #c79cf5; width: 200px;">유의 사항</a><br>
									공동현관에서 연락주세요<br>
	                        	</div>
	                    	</div>
	                    </div>
	                    
                    	<div class="col-lg-12">
	                    	<div class="card mb-4">
	                        	<div class="card-header">강사님 영상</div>
	                        	<div class="card-body">
	                        		<iframe width="560" height="315" src="https://www.youtube.com/embed/3WOwa0lWEz4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
	                        		</iframe>
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
									
										var addr = '${classinfo.c_addr }';  /* 여기서 꼭 '' 따옴표를 붙여줘야 자바스크립트 영역에서 문자열로 인식한다. */
										var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
										mapOption =
										{
											center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
											level : 3
										// 지도의 확대 레벨
										};
					
										// 지도를 생성합니다    
										var map = new kakao.maps.Map(mapContainer, mapOption);
					
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
																		result[0].y, result[0].x);
					
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
																infowindow.open(map, marker);
					
																// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
																map.setCenter(coords);
															}
														});
									</script>
					
					
					
									<script type="text/javascript"
										src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e943a4b910a88bd68a627159bd5111b"></script>
									<script>
										var container = document.getElementById('map');
										var options =
										{
											center : new kakao.maps.LatLng(33.450701, 126.570667),
											level : 3
										};
					
										var map = new kakao.maps.Map(container, options);
									</script>
									
									
									<br>주소: ${classinfo.c_addr }
	                        	</div>
	                    	</div>
	                    </div>
	                    
                        <div class="col-lg-12">
	                    	<div class="card mb-4">
	                        	<div class="card-header">편의 사항 제공</div>
	                        	<div class="card-body">
	                        		<a class="btn btn-primary me-4 mt-2 mb-2" href="#!"> 📳 와이파이 제공</a>
	                        		<a class="btn btn-primary me-4 mt-2 mb-2" href="#!"> 🌭 간식 제공</a><br>
	                        	</div>
	                    	</div>
	                    </div>
	                    
	                    <div class="col-lg-12">
	                    	<div class="card mb-4">
	                        	<div class="card-header"> 후기 작성 </div>
	                        		<div class="card-body">
	                        			<div class="row">
											<div class="col-lg-2">
												<div class="box"
													style="background: #BDBDBD; width: 100px; height: 100px; border-radius: 70%; overflow: hidden; float: left;">
													<img class="profile" src="images/1.jpg" style="width: 100%; height: 100%; object-fit: cover;">
												</div>
											</div>
					
											<div class="col-lg-10">
												<div
													style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
													<p
														style="WIDTH: 60%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
													</p>
												</div>
												<br> <span>이유림</span><span> 2021.02.02</span> <br> <br>
												너무쉽게 설명해주셔서 따라가기 좋았어요 한번수업받아보고 바로 배우기로했습니다!
											</div>
										</div>
										<br><br>
										<div class="row">
											<div class="col-lg-2">
												<div class="box"
													style="background: #BDBDBD; width: 100px; height: 100px; border-radius: 70%; overflow: hidden; float: left;">
													<img class="profile" src="images/1.jpg" style="width: 100%; height: 100%; object-fit: cover;">
												</div>
											</div>
					
											<div class="col-lg-10">
												<div
													style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
													<p
														style="WIDTH: 60%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
													</p>
												</div>
												<br> <span>이유림</span><span> 2021.02.02</span> <br> <br>
												거리가 좀 있어서 고민을 하였었는데
												정말정말 만족합니다
												첫수업이라 상담이랑 그냥 조금 배우고 오는줄 알았는데 제가 부족한부분, 배우고 싶었던 부분을 잘 알려주셔서
												비포 에프터가 바로 나왔답니다 ㅎㅎ
												추천추천드립니다
												다들 수업 받아보셔요~
												선생님 짱!
											</div>
										</div>
		                        	</div>
		                    	</div>
		                    </div>
	                    </div>


                </div>
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
														<img class="profile" src="images/1.jpg" style="width: 100%; height: 100%; object-fit: cover;">
													</div>
													<!-- 별점 -->
													<div class="mt-2 ms-3"
														   style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
														<p style="WIDTH: 80%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;"></p>
													</div>
												</div>
												<div class="col-lg-8 mt-3">
													<div class="ms-3">${classinfo.u_name} 강사님</div>
													<div class="ms-3">총 진행 회차 : 30회</div>
													<div class="ms-3">총 후기 개수 : 30개</div>
												</div>
											</div>
											<br><br>
												노래는 목으로만 부르지 않습니다. 두성, 흉성 등 다양한 스킬들의 차이를 알고 여러분께 가장 적합한
												발성법을 가르쳐드리도록 하겠습니다. 노래는 재능의 영역이 아닙니다. 이제 저와 시작하시죠. 
											<br><br>
												⏰ 진행시간 : ${classinfo.c_runtime}시간
											<br>	
												🚩 장소 : ${classinfo.c_addr}
											<br>
												🎤 모집인원 : 최대${classinfo.max_person}명 최소${classinfo.min_person}명
											<br>
												💰 수강료 : ${classinfo.c_price}원
											<br>
											<br>
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
									<button type="button" class="btn btn-primary">
										2021년 5월 2일 14시 30분 - 16시 (3명 / 5명)
									</button>
									<button type="button" class="btn btn-primary">
										2021년 5월 3일 14시 30분 - 16시 (3명 / 5명)
									</button>
									<button type="button" class="btn btn-primary">
										2021년 5월 4일 14시 30분 - 16시 (3명 / 5명)
									</button>
									<br><br>
									<button type="button" class="btn btn-primary">
										신청하기
									</button>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
