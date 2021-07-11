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
	}

	String uniqueId = null;
	
	if(session.getAttribute("uniqueId")!=null)
	{
		uniqueId = (String)session.getAttribute("uniqueId");
	}

	String mynickName = null;

	if(session.getAttribute("mynickName")!=null)
	{
		mynickName = (String)session.getAttribute("mynickName");
	}
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>뮤하비 - 타성에 젖은 당신의  변화</title>

        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="css/myPage1.css" rel="stylesheet" />
    </head>
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
		                                	
		                                	<!-- 관리자가 아니라면 -->
											<c:if test="${adminStr eq null}">
		                                    	<li><a class="dropdown-item " href="mypageform.action">마이페이지</a></li>
		                                    </c:if>
		                                    
		                                    <!-- 관리자라면 -->
		                                    <c:if test="${adminStr ne null}">
		                                    	<li><a class="dropdown-item " href="adminpage.action">관리자 페이지</a></li>
		                                    </c:if>	
		                                    
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
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading fs-5">활동<hr></div>                            
                            <a class="nav-link collapsed" href="#">
                                <div class="sb-nav-link-icon"><i class="fas fa-user-edit"></i></div>
                                <div class="">게시물 목록</div>
                            </a>
                            
                            <a class="nav-link collapsed" href="#">
                                <div class="sb-nav-link-icon"><i class="fas fa-comments"></i></div>
                                <div class="mss-1">댓글 목록</div>
                            </a>
                            <br><br>
                            <div class="sb-sidenav-menu-heading fs-5">개인 관리<hr></div>

                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts1" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="bi bi-book"></i></div>
                                	<div class="ms-2">북마크</div>
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">북마크한 클래스</a>
                                </nav>
                            </div>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts3" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-guitar"></i></div>
                                	<div class="ms-2">클래스 관리</div>
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts3" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="mypagemyclass.action">내가 신청한 클래스</a>
                                    <a class="nav-link" href="mypageyourclass.action">내가 개설한 클래스</a>
                                </nav>
                            </div>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts4" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-user-cog"></i></div>
                                	<div class="mss-1">회원 정보 관리</div>
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts4" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">회원 정보 수정</a>
                                </nav>
                            </div>                                                        
                        </div>
                    </div> 
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <div class="row">
                            <div class="col-xl-10 col-md-8">
                                <div class="shadow card bg-light text-gray mb-5 ms-4">
                                    <div class="parent">
								        <div class="first">
								        	<img class="rounded-circle mt-4" src="images/default.png" width="200px" height="200px">
								        </div>
								        <div class="second sb-sidenav-menu-heading fs-5 h4 ms-12 mt-3 bold" style="width:60%; height: 100%">
								        	우주악당쭌이 ( jeongjun96 ) <br><br>
								        	<div class="h6 bold" style="width:100%" >나의 관심사</div>
								        	<div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
									        	<a class="btn btn-outline-light btn-sm1">피아노/건반</a>
									        	<a class="btn btn-outline-light btn-sm1">보컬</a>
									        	<a class="btn btn-outline-light btn-sm1">드럼</a>
									        	<a class="btn btn-outline-light btn-sm1" style="display:none;">작곡/미디</a>
									        	<a class="btn btn-outline-light btn-sm1" style="display:none;">기타</a>
									        	<a class="btn btn-outline-light btn-sm1" style="display:none;">베이스</a>
									        	<a class="btn btn-outline-light btn-sm1" style="display:none;">현악기</a>
 											</div>
 											<br><br>
 											<div class="h6 bold" style="width:100%" >자기 소개</div>
 											<div class="h6" style="width:100%" >코로나 너무 지치는데 어떡하죠코로나너무 너무코로나 너무 지치는데 어떡하죠</div>
								        </div>
								        <div class="first bold"> 나의 등급 🥇</div>
								    </div>
                                </div>
                                
                                <div style="width:100%">
									<div class="first ms-4 text-start">
	                               		<h4 style="width:100%">내가 개설한 클래스</h4>
	                                </div>
	                                
	                                <div class="text-end third">
	                                	<a class="btn btn-outline-light btn-sm1">클래스 개설/수정</a>
	                                </div>
	                            </div>    
                                
                                <br>               
                                <hr class="ms-4">
                                
                               <div class="shadow col-md-11 card bg-light text-gray mt-4 ms-7">
                                    <div class="parent">
								        <div class="first sb-sidenav-menu-heading h4 mt-3" style="width:30%">
								        	<img class="img-fluid rounded mb-5 mb-lg-0" src="images/guitar2.png" style="width: 320px; height: 200px;"/>
								        	<h5 class="mt-3"> 🎸 일렉 기타 배우기 🎸 </h5>								        
								        </div>
								        <div class="second sb-sidenav-menu-heading fs-5 mt-3 bold" style="width:60%; height: 100%">
								        
								        	우주악당쭌이 님의 클래스 🥇 <br><br>
								        	
 											<div class="h6 bold" style="width:100%" >클래스 소개</div>
 											<div class="h6" style="width:100%" >코로나 너무 지치는데 어떡하죠코로나너무 너무코로나 너무 지치는데 어떡하죠</div>
 											<br><br>
 											<div class="third d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start text-end" style="width:50%">
									        	<a class="btn btn-outline-light btn-sm1">상세정보</a>
									        	<a class="btn btn-outline-light btn-sm1">수강생 정보 확인</a>
									        	<a class="btn btn-outline-light btn-sm1">변경 및 취소</a>
 											</div>
 											<div class="h6 bold" style="width:100%" >개설일자 : 2021.06.15(화)</div>
								        </div>
								    </div>
                                </div>
                                
                                <br><br><br><br>
                            </div>
                        </div>
                    </div>
                </main>
            </div> 
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>  <!-- 폰트 -->
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
        <script src="js/simple-datatables.js"></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script src="js/scripts.js"></script>
          
    </body>
</html>