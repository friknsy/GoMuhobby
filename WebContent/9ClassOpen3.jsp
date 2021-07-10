<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>뮤하비 - 타성에 젖은 당신의 변화</title>

		<link rel="stylesheet" href="./css/bootstrap-material-datetimepicker.css" />
		<link href='http://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

		<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
		<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/ripples.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/material.min.js"></script>
		<script type="text/javascript" src="https://rawgit.com/FezVrasta/bootstrap-material-design/master/dist/js/material.min.js"></script>
		<script type="text/javascript" src="js/npm2.js"></script>
		<script type="text/javascript" src="./js/bootstrap-material-datetimepicker.js"></script>

        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/mainpage0.css" />
        <link rel="stylesheet" href="css/register0.css" />
        <link rel="stylesheet" href="css/myPage0.css" />
        
        <script>
			(function(i, s, o, g, r, a, m) {
				i['GoogleAnalyticsObject'] = r;
				i[r] = i[r] || function() {
					(i[r].q = i[r].q || []).push(arguments)
				}, i[r].l = 1 * new Date();
				a = s.createElement(o),
					m = s.getElementsByTagName(o)[0];
				a.async = 1;
				a.src = g;
				m.parentNode.insertBefore(a, m)
			})(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

			ga('create', 'UA-60343429-1', 'auto');
			ga('send', 'pageview');
		</script>
        
    </head>
    <body class="sb-nav-fixed">
        <nav class="navbar navbar-expand-lg navbar-dark">
                <div class="container px-5 mt-2">
                    <div>
						<a href="SampleTest.jsp"><img src="images/muhobbytext3.png" width="200px" height="40px"></a>
					</div>
					<!-- <a class="navbar-brand" href="SampleTest.jsp">M U H O B B Y</a> -->
					<div class="input-group ms-4">
                    	<input class="form-control" type="text" placeholder="통합 검색"  aria-describedby="btnNavbarSearch" />
                    	<button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="bi bi-search"></i></button>
                	</div>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        	<li class="nav-item"><a class="nav-link" href="SampleTest.jsp" >ONEDAY클래스&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                        	<li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                	<li><a class="dropdown-item" href="#">Q&A 게시판 </a></li>
                                    <li><a class="dropdown-item" href="#">자유게시판</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">&nbsp;&nbsp;&nbsp;&nbsp;우주악당쭌이 님</a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <li><a class="dropdown-item" href="#">마이페이지</a></li>
                                    <li><a class="dropdown-item" href="#">정보 수정</a></li>
                                    <li><hr></li>
                                    <li><a class="dropdown-item" href="#">로그아웃</a></li>
                                </ul>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="SampleTest.jsp" >&nbsp;&nbsp;&nbsp;&nbsp;알림&nbsp;<i class="bi bi-bell-fill"></i>&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                            <!-- <li class="nav-item"><a class="nav-link" href="SampleTest.jsp" >&nbsp;&nbsp;&nbsp;&nbsp;로그인&nbsp;&nbsp;&nbsp;&nbsp;</a></li> -->	
                        </ul>
                    </div>
                </div>
            </nav>
            <br>
            <!--
            .form-floating > .form-control:focus, .form-floating > .form-control:not(:placeholder-shown) {
			  padding-top: 1.625rem;
			  padding-bottom: 0.625rem;
			}
             -->
        	<div id="layoutSidenav" style="position:relative;">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        	<br><br><br>
                        	<div class="sb-sidenav-menu-heading fs-5 text-center bold"><h2><span class="text-muhobby">
            			    클래스 개설</span></h2><hr></div>
                            <div class="sb-sidenav-menu-heading fs-5 text-center bold"><h4><a class="nav-link" href="#"><i class="bi bi-book"></i>&nbsp;강사 소개</h4></a></div>                            
							<div class="sb-sidenav-menu-heading fs-5 text-center bold"><h4><a class="nav-link" href="#"><i class="bi bi-book"></i>&nbsp;클래스 소개</h4></a></div>                            
							<div class="sb-sidenav-menu-heading fs-5 text-center bold"><h4><a class="nav-link" href="#"><i class="bi bi-book"></i>&nbsp;클래스 관리</h4></a></div>                            
                        </div>
                    </div> 
                </nav>
            </div>
            <div class="container">
	                        <div class="row justify-content-center">
	                            <div class="col-lg-8">
	                                <div class="card shadow-lg border-0 rounded-lg mt-5">
	                                    <div class="card-header">
	                                    	<h2 class="text-center font-weight-light my-4 text-muhobby fw-bold">클래스 개설 정보</h2>
	                                    </div>
	                                    <div class="card-body">
	                                        <form action="sign.do" method="post">
	                                        	<br>
	                                            
	                                            <div class="row mb-3">
													<span class="mb-2 fw-bold normal">9) 클래스 일정 추가 (필수) </span>
														<span class="mb-2 fw-bold">수업 진행 날짜</span>
														<div class="col-md-5">
															<div class="form-floating mb-3 mb-md-0">
																<input type="text" id="min-date" class="form-control floating-label">
															</div>
														</div>
														<div class="col-md-3 d-grid">
	                                                		<input class="form-control text-center" id="userId" name="userId" type="text" placeholder="수업 소요 시간"/>
	                                                	</div>
	                                                	
	                                                	<div class="col-md-2 d-grid">
	                                                		<input class="form-control text-center" id="userId" name="userId" type="text" placeholder="최소 모집 인원"/>
	                                                	</div>
	                                                	
	                                                	<div class="col-md-2 d-grid">
	                                                		<input class="form-control text-center" id="userId" name="userId" type="text" placeholder="최대 모집 인원"/>
	                                                	</div>
												</div>
													
	                                            <br>
	                                            
	                                           		<div class="row mb-3">
														<span class="mb-2 fw-bold normal">10) 클래스 수강료 </span>
															<div class="col-md-5">
																<div class="form-floating mb-3 mb-md-0">
																	<input type="text" id="min-date" class="form-control floating-label" placeholder="Start Date">
																</div>
															</div>
													</div>
												
												<br />
	                                            
	                                            <div class="row mb-3">
	                                            	<div class="col-md-2">
	                                                </div>
	                                                <div class="col-md-4 col-md-3 d-grid">
	                                                	<a class="text-center btn1 btn-primary btn-block">이전 페이지</a>
	                                                </div>
	                                                <div class="col-md-4 d-grid">
	                                                	<!-- <a class="text-center btn1 btn-primary btn-block" href="/sign.do">회원 가입</a> -->
	                                                	<input class="text-center btn1 btn-primary btn-block" type="submit" id="loadBtn" value="다음 페이지" id="signup">
	                                                </div>
                                            	</div>
	                                        </form>
				                        </div>
	                                </div>
	                                <br><br>
	                                <br><br>
	                            </div>
	                        </div>
	                    </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>  <!-- 폰트 -->
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
        <script src="js/simple-datatables.js"></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script src="js/scripts.js"></script>
        <script type="text/javascript">
			$(document).ready(function()
			{
				$('#min-date').bootstrapMaterialDatePicker({ format : 'YYYY/MM/DD HH:mm', minDate : new Date() });
			});
		</script>  
    </body>
</html>
