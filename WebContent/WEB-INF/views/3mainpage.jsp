<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" import="java.util.*, java.security.*, java.io.*, java.net.*" %>
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

<%-- 뮤하비 메인페이지.  --%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>뮤하비 - 타성에 젖은 당신의 변화</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="css/mainpage.css" rel="stylesheet" />
    </head>
    
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
        
        
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
		                            <li class="nav-item me-3"><a class="nav-link " href="SampleTest.jsp" >알림&nbsp;<i class="bi bi-bell-fill bold"></i>&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		                        </ul>
		                    </div>
		                </div>
		            </nav>
            	</c:otherwise>
            </c:choose>
            
            <!-- 메인 페이지 -->
            <header class="bg-dark py-5" style="background-image: URL(images/guitar2.png); height: 820px;">
                <div class="container px-5">
                    <div class="row gx-5 align-items-center justify-content-center">
                        <div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 text-center text-xl-start">
                                <h1 class="display-5 fw-bolder text-white mb-2">타성에 젖은 당신에게<br> 필요한 음악 취미</h1>
                                <br>
                                <p class="lead fw-normal text-white-50 mb-4">국내 최대 음악 커뮤니티 MUHOBBY</p>
                                <br><br><br><br>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                    <a class="btn btn-outline-light btn-lg px-4 me-sm-3" href="#muhobby">MUHOBBY 시작하기</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"></div>
                    </div>
                </div>
            </header>
            
            <div class="py-2">
            </div>
            
            <!-- 기능 안내-->
            <aside class="bg-gradient rounded-3 p-4 p-sm-5 mt-5" id="muhobby">
                <div class="text-center">
                    <div class="mb-4 mb-xl-0">
                		<div class="fs-3 fw-bold text-dark mb-4">" 야.. 너도 축가 부를 수 있어..  🤔 "</div>
                        <div class="d-flex align-items-center justify-content-center">
			            <img class="rounded-circle me-3" src="images/muhobbylogo.png" width="40px" height="40px">
				            <div class="fw-bold text-dark">
				                MUHOBBY
				                <span class="fw-bold mx-1 text-dark">/</span>
				                4조
				            </div>
			            </div>
                    </div>
                </div>
            </aside>
                    
            <!-- 포트폴리오-->
            <section class="py-5 bg-light rounded-3" id="scroll-target">
                <div class="container px-5 my-5">
                    <div class="row gx-5 align-items-center">
                        <div class="col-lg-6"><img class="img-fluid rounded mb-5 mb-lg-0" src="images/book2.jpg" style="width: 600px; height: 400px;"/></div>
                        <div class="col-lg-6">
                            <h2 class="fw-bolder"><i class="bi bi-journal"></i> 자동완성형 포트폴리오</h2>
                            <br><br>
                            <p class="lead fw-normal text-muted mb-0 fs-4">
                            음악관련 분야에서 활동하는 회원들이 제공된 Form에
							자신의 경력사항, 사진, 영상 등을 입력하면 면접 등
							여러방면에서 활용할 수 있는 자신의 포트폴리오 페이지를 간편하게 만들 수 있다.</p>
                        </div>
                    </div>
                </div>
            </section>
            
            <div class="py-4">
            </div>
            
            <!-- 원데이 클래스-->
            <section class="py-5 bg-white rounded-3">
                <div class="container px-5 my-5">
                    <div class="row gx-5 align-items-center">
                        <div class="col-lg-6 order-first order-lg-last"><img class="img-fluid rounded mb-5 mb-lg-0" src="images/piano.jpg" style="width: 600px; height: 400px;"/></div>
                        <div class="col-lg-6">
                            <h2 class="fw-bolder"><i class="bi bi-pencil"></i> 취미생 대상 원데이클래스</h2>
                            <br><br>
                            <p class="lead fw-normal text-muted mb-0 fs-4">페이지에서 열심히 활동을 하게 되면 일반계정에서 멘토계정으로(관리자의 승인을 받아) 전환할 수 있게 된다.
										                             그 후 멘토는 원데이클래스를 개설해서 회원들로부터 신청을 받아 클래스를 운영할 수 있다. 
																	이제 막 취미를 시작하려는 회원들이 부담없이 신청하고 수강할 수 있는 클래스이다. 
							</p>
                        </div>
                    </div>
                </div>
            </section>
            
            <div class="py-4">
            </div>
            
            <!-- 포트폴리오-->
            <section class="py-5 bg-light rounded-3" id="scroll-target">
                <div class="container px-5 my-5">
                    <div class="row gx-5 align-items-center">
                        <div class="col-lg-6"><img class="img-fluid rounded mb-5 mb-lg-0" src="images/book5.jpg" style="width: 600px; height: 400px;"/></div>
                        <div class="col-lg-6">
                            <h2 class="fw-bolder"><i class="bi bi-people"></i> 커뮤니케이션을 위한 게시판</h2>
                            <br><br>
                            <p class="lead fw-normal text-muted mb-0">
                            필요에 따라 자유게시판, 악기중고거래게시판, 영상게시판에서 활동할 수 있다.
							게시판에서 활동을 활발하게 하게 되면 <옥타브> 라는 페이지 내 계정등급 포인트가 증가하고
							그에 따라 홈페이지 이용 권한 범위가 넓어진다. (ex. 멘토계정전환)</p>
                        </div>
                    </div>
                </div>
            </section>
            
            <!-- 영상 게시판 미리보기 -->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder">인기 회원 영상</h2>
                                <p class="lead fw-normal text-muted mb-5"></p>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5 ">
                        <div class="col-lg-4 mb-5 rounded-3">
                            <div class="card h-100 shadow border-0">
                                <video src="images/record1.mp4" style="width: 600; height: 350;" controls muted autoplay loop></video>
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">New</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">추억의 레코드 </h5></a>
                                    <p class="card-text mb-0">추억의 올드 팝송 여행 ~ </p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="images/muhobbylogo.png" width="40px" height="40px"/>
                                            <div class="small">
                                                <div class="fw-bold">이유림</div>
                                                <div class="text-muted">2021.06.09 · 3시간 전</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5 rounded-3">
                            <div class="card h-100 shadow border-0">
                                <video src="images/production.mp4" style="width: 600; height: 350;" controls muted autoplay loop></video>
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">New</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">미디/작곡 수업 받고 왔어요</h5></a>
                                    <p class="card-text mb-0">한혜림 선생님 없던 재능까지 만들어 주시는 21세기 음악계의 헬렌 켈러..</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="images/muhobbylogo.png" width="40px" height="40px"/>
                                            <div class="small">
                                                <div class="fw-bold">한혜림</div>
                                                <div class="text-muted">2021.06.06 · 3일 전</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5 rounded-3">
                            <div class="card h-100 shadow border-0">
                                <video src="images/record2.mp4" style="width: 600; height: 350;" controls muted autoplay loop></video>
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">New</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">요즘 요가 하면서 틀어놔요</h5></a>
                                    <p class="card-text mb-0">요가할 때 듣는 플레이 레코드</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="images/muhobbylogo.png" width="40px" height="40px"/>
                                            <div class="small">
                                                <div class="fw-bold">이희주</div>
                                                <div class="text-muted">2021.06.03 · 6일 전</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>    
                </div>
            </section>
        </main>
        
        
        <!-- Footer-->
        <footer class="bg-primary py-4 mt-auto">
            <div class="container px-5 rounded-3">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto"><div class="m-0 text-white">사업자: 1004-S2-2021 | 대표자: 이유림 | 상호: MUHOBBY</div></div>
                    <div class="col-auto">
                        <a class="link-light text-decoration-none" href="SampleTest.jsp">사이트 소개</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light text-decoration-none" href="SampleTest.jsp">광고 문의</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light text-decoration-none" href="SampleTest.jsp">신고 문의</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        
    </body>
</html>
