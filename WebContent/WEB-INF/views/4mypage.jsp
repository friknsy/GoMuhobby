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
		mynickName = (String)session.getAttribute("mynickName");
	else
		// 로그인 정보가 없을 때 메인 페이지로 이동!
		out.println("<script>location.href=" + "'mainpage.action'" + ";</script>");
	
	String photo = null;
	
	if(session.getAttribute("photo")!=null)
		photo = (String)session.getAttribute("photo");
	else
		photo = "undraw_profile_1.svg";
	
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
            
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading fs-5">활동<hr></div>
								<c:if test="${p_info_num ne null}">
		                            <a class="nav-link collapsed" href="professorforum.action">
		                                <div class="sb-nav-link-icon"><i class="bi bi-people-fill"></i></div>
		                                <div class="">강사 커뮤니티</div>
		                            </a>
	                            </c:if>
                                                     
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
								        <div class="first col-lg-3">  <!-- "images/default.png" -->
								        	<img class="rounded-circle mt-4" src="img/<%=photo %>" width="200px" height="200px"> <!-- 오른쪽버튼만추가 -->
								        	<script type="text/javascript">
								        	
										        	function profilePop()
										    		{
										        		/* window.open("qa_forumread.action?qa_forum_code="+qa_forum_code, "게시물자세히보기", "width=400, height=300, left=100, top=50");  */
										        		window.open("profilepopup.action?uniqueId="+<%=uniqueId%>, "게시물자세히보기", "width=400, height=300, left=100, top=50"); 
										        		/* 요청 url 에서 /namepopup.action 이라고 『/』를 앞에 붙여주면 경로를 찾지 못한다. 요청url 에는  /를 붙여주지 않는다!! 주의!! */
										    		}
								        	
								        	</script>
								        </div>
								        <div class="second sb-sidenav-menu-heading fs-5 h4 ms-12 mt-3 bold" style="width:60%; height: 100%">
								        <div class="col-lg-4 d-grid third">
								        	<form action="professor.action" method="GET">
								        		<input type="hidden" id="uniq_id_num" name="uniq_id_num" value="<%=uniqueId %>">
                                        		<button type="submit" class="text-center btn1 btn-primary btn-block">강사 정보 확인</button>
                                        	</form>
                                        </div>
                                        	<br />
								        	<%out.print(mynickName); %> ( jeongjun96 ) 🥇 <br><br>
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
								        <div class="first bold col-lg-3 mb-3"> <button class="btn btn-outline-light btn-sm1" type="button" onclick="profilePop()">사진변경</button> </div>
								    </div>
                                </div>
                                
                                <div class="frist ms-4"><h4>최근 업로드한 영상</h4></div>
                                <hr class="ms-4">
                                
                                <div class="card-body ms-4">
                                	
                                	<!-- 사용자 시점에서 youtube 에서 링크 따오는 방법이 2가지 있음 -->
                                	<!-- 1. 주소창에서 URL 복사 -->
                                	<!-- https://www.youtube.com/watch?v=a_tMEXd8Zow -->
                                	
                                	<!-- 2. youtube 영상 밑에 공유 → 복사-->
                                	<!-- https://youtu.be/a_tMEXd8Zow -->
                                	
                                	<!-- 3. iframe 에서의 src URL의 주소는  -->
                                	<!-- https://www.youtube.com/embed/a_tMEXd8Zow -->
                                	
                                	<!-- 다음과 같이 각기 상이해서 사용자가 어떤 링크를 넣든 뒤에 잘라서 넣어줘야 함. -->
                                	
                                	<!-- 1번은 특정문자 ? 가 있기 때문에 if 문으로 먼저 있다면! 처리하면 되고
                                	     2,3 번은 뒤에서 첫 번째 / 후 부터 자르면 된다. -->
                                	
                                	<!-- 예제)
                                		 특정문자 이후의 문자열 제거 String str = "ABCD/DEFGH";
		                                 String result = str.substring(str.lastIndexOf("/")+1);
		                                 System.out.println(result); //결과값 DEFGH
 									-->
 									
	                                
								<div class="row gx-5 ">
			                        <div class="col-lg-4 mb-5 rounded-3">
			                            <div class="card h-100 shadow border-0">
			                                <div class="card-body p-4">
			                                <iframe width="355" height="230" src="https://www.youtube.com/embed/a_tMEXd8Zow" 
				                                title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; 
				                                clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				                                allowfullscreen>
			                                </iframe>
			                                    <div class="badge bg-primary bg-gradient rounded-pill mt-2 mb-2">New</div>
			                                    <h5 class="card-title mb-3">추억의 레코드 </h5></a>
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
			                                <div class="card-body p-4">
			                                <iframe width="355" height="230" src="https://www.youtube.com/embed/Aq_gsctWHtQ" 
				                                title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; 
				                                clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				                                allowfullscreen>
			                                </iframe>
			                                    <div class="badge bg-primary bg-gradient rounded-pill mt-2 mb-2">New</div>
			                                    <h5 class="card-title mb-3">미디/작곡 수업 받고 왔어요</h5></a>
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
			                                <div class="card-body p-4">
			                                <iframe width="355" height="230" src="https://www.youtube.com/embed/a_tMEXd8Zow" 
				                                title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; 
				                                clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				                                allowfullscreen>
			                                </iframe>
			                                    <div class="badge bg-primary bg-gradient rounded-pill mt-2 mb-2">New</div>
			                                    <h5 class="card-title mb-3">요즘 요가 하면서 틀어놔요</h5></a>
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
                                <div class="frist ms-4 mt-4"><h4>최근 업로드한 게시글</h4></div>
                                <hr class="ms-4">
                                
                                <div class="card-body ms-4">
                                
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th class="text-center" style="width:15%;">번호</th>
                                            <th class="text-center" style="width:40%;">제목</th>
                                            <th class="text-center" style="width:15%;">조회수</th>
                                            <th class="text-center" style="width:30%;">게시글 작성일</th>
                                        </tr>
                                    </thead>
                                    
                                    <!-- dataTable-pagination -->
                                    
                                    <tbody class="text-center">
                                    
                                        <tr>
                                            <td>1</td>
                                            <td><a href="https://www.naver.com">불구덩이에서 성대 단련중</a></td>
                                            <td>5210</td>
                                            <td>2021-06-24</td>
                                        </tr>
                                        
                                        <tr>
                                            <td>2</td>
                                            <td>낙수 맞으면서 성대 단련중</td>
                                            <td>5210</td>
                                            <td>2021-06-24</td>
                                        </tr>
                                    </tbody>
    	                            </table>
	                            </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div> 
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>  <!-- 폰트 -->
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/simple-datatables.js""></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script src="js/scripts.js"></script>
          
    </body>
</html>
