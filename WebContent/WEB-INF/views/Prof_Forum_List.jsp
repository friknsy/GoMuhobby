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
<html>
<head>
<meta charset="UTF-8">
<title>Prof_Forum_List.jsp</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="<%=cp %>/assets/favicon.ico" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<%=cp %>/css/mainpage.css" rel="stylesheet" />
<link href="<%=cp %>/css/myPage1.css" rel="stylesheet" />


<!-- 부트스트랩 css -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> --> 

<!-- 제이쿼리 script -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script> -->
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>

	
<!-- 부트스트랩 script -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
	
	#count
	{
		float: left;
		color: gray;
		/* border: 1px solid #ccc; */
		margin-left: 10px; 
		margin-top: 9px;
	}

</style>

<script type="text/javascript">

	$(function()
	{
		// 글 작성하기가 클릭되었을 때 Prof_Forum_InsertForm.jsp 이동
		$("#write").click(function()
		{
			$(location).attr("href", "professorforuminsertform.action?p_comm_code="+$("#p_comm_code").val() );
			//$(location).attr("href", "professorforuminsertform.action");
			
		});
		
		// 수정
		$("#update").click(function()
		{
			$(location).attr("href", "professorforumupdateform.action?p_forum_num="+$("#p_forum_num").val() );
		});
		
		
		// 삭제
		$("#delete").click(function()
		{
			if (confirm("게시글을 삭제하시겠습니까?") )
			{
				$(location).attr("href", "professorforumdelete.action?p_forum_num="+$("#p_forum_num").val() );
			}
			
		});
		
	});

</script>
	
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
                            <a class="nav-link collapsed" href="professorforum.action">
                                <div class="sb-nav-link-icon"><i class="bi bi-people-fill"></i></div>
                                <div class="">강사 커뮤니티</div>
                            </a>
                                                     
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
				<div class="col-xl-12 col-md-12">
					<div style="float: left;"><h2>강사 커뮤니티</h2></div>
					<div id="count">${count }개의 글</div>
					<div class="col-lg-3" style="float: right;"><button type="button" class="btn btn-outline-light btn-sm1" id="write">글 작성하기</button></div>
					<div style="clear:both;"></div>
					<div class="col-lg-10"><hr></div>
					
					<!-- 강사 커뮤니티 코드 -->
					<input type="hidden" id="p_comm_code" name="p_comm_code" value="${p_comm_code }"> 

					
					
					<!-- 게시글 -->
					<div>
						<c:forEach var="content" items="${list }">
						
							<!-- 게시물 번호 -->						
							<input type="hidden" id="p_forum_num" name="p_forum_num" value="${content.p_forum_num }">
							
							<div> <!-- card-footer -->
								<div class="bg-transparent mt-5 col-lg-3">
								    <div class="d-flex align-items-end justify-content-between">
								        <div class="d-flex align-items-center">
								            <img class="rounded-circle me-3" src="img/${content.u_photo }" width="40px" height="40px"/>
								            <div class="small">
								                <div class="fw-bold">${content.user_nickname }</div>
								                <div class="text-muted">${content.p_forum_wrt_date }</div>
								            </div>
								        </div>
								    </div>
								</div>
								<div class="card-footer bg-transparent mt-4 col-lg-10">
									<div class="d-flex align-items-end justify-content-between">
										<div class="d-flex align-items-center">
											<p> ${content.p_forum_content }</p>
										</div>
										
										<c:set var="uniqueId" value="<%=uniqueId %>"/>
										<c:if test="${content.uniq_id_num eq uniqueId }">
										<div style="float: right">
											<button type="button" class="btn btn-default btn-custom" id="update">수정</button>
											<button type="button" class="btn btn-default" id="delete">삭제</button>
										</div>
										</c:if>
									</div>
								</div>
							</div>
							
							<!-- 댓글 리스트 -->
							<c:forEach var="comment" items="${commentList }">
								<c:if test="${comment.p_forum_num eq content.p_forum_num}">
									<div style="margin-left: 40px;">
										<div class="bg-transparent mt-3 col-lg-3">
										    <div class="d-flex align-items-end justify-content-between">
										        <div class="d-flex align-items-center">
										            <img class="rounded-circle me-3" src="img/${comment.u_photo }" width="30px" height="30px"/>
										            <div class="d-flex small">
										                <div class="fw-bold">${comment.user_nickname }</div>&nbsp;&nbsp;
										                <div class="text-muted">${comment.p_reply_wrt_date }</div>
										            </div>
										        </div>
										    </div>
										</div>
										
										<div class="card-footer bg-transparent mt-3 col-lg-10">
											<div class="d-flex align-items-end justify-content-between">
												<div class="d-flex align-items-center">
													<p>${comment.p_reply_content } </p>
												</div>
												<div style="float: right">
													<button type="button" class="btn btn-default">댓글달기</button>
												</div>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach> 
							
							<!-- 댓글 작성 -->
							<div class="card-footer mt-3 col-lg-10 comment-area justify-content" style="height: 120px;">
								<!-- <form action=""> -->
									<textarea class="form-control" id="comment" rows="content" 
									placeholder="댓글을 입력해주세요." maxlength="200" required="required"></textarea>
									<div style="float: right" class="mt-2">
										<button type="submit" class="btn btn-outline-light btn-sm1" id="addComment">등록</button>
									</div>			
								<!-- </form> -->
							</div>
							
							</c:forEach>
							
							
							
							
															
							
							
							
						<!-- 댓글 -->
						<div style="margin-left: 40px;"> <!-- card-footer -->
							<!-- <div class="bg-transparent mt-3 col-lg-3">
							    <div class="d-flex align-items-end justify-content-between">
							        <div class="d-flex align-items-center">
							            <img class="rounded-circle me-3" src="images/default.png" width="30px" height="30px"/>
							            <div class="d-flex small">
							                <div class="fw-bold">뮤푼젤</div>&nbsp;&nbsp;
							                <div class="text-muted">2021-07-02</div>
							            </div>
							        </div>
							    </div>
							</div>
							<div class="card-footer bg-transparent mt-3 col-lg-10">
								<div class="d-flex align-items-end justify-content-between">
									<div class="d-flex align-items-center">
										<p> 안녕하세요~ 처음 배우시는 분도 기초부터 꼼꼼히 알려드릴게요<br>
										커리큘럼과 상세보기를 참고해주세요</p>
									</div>
									<div style="float: right">
										<button type="button" class="btn btn-default">댓글달기</button>
									</div>
								</div>
							</div> -->
							<div class="bg-transparent mt-3 col-lg-3">
							    <div class="d-flex align-items-end justify-content-between">
							        <div class="d-flex align-items-center">
							            <img class="rounded-circle me-3" src="images/default.png" width="30px" height="30px"/>
							            <div class="d-flex small">
							                <div class="fw-bold">뮤푼젤</div>&nbsp;&nbsp;
							                <div class="text-muted">2021-07-02</div>
							            </div>
							        </div>
							    </div>
							</div>
							<div class="card-footer bg-transparent mt-3 col-lg-10">
								<div class="d-flex align-items-end justify-content-between">
									<div class="d-flex align-items-center">
										<p> 안녕하세요~ 처음 배우시는 분도 기초부터 꼼꼼히 알려드릴게요<br>
										커리큘럼과 상세보기를 참고해주세요</p>
									</div>
									<div style="float: right">
										<button type="button" class="btn btn-default">댓글달기</button>
									</div>
								</div>
							</div>
							<!-- 대댓글 -->
							<div style="margin-left: 40px;">
							<div class="bg-transparent mt-3 col-lg-3">
							    <div class="d-flex align-items-end justify-content-between">
							        <div class="d-flex align-items-center">
							            <img class="rounded-circle me-3" src="images/default.png" width="30px" height="30px"/>
							            <div class="d-flex small">
							                <div class="fw-bold">다람이</div>&nbsp;&nbsp;
							                <div class="text-muted">2021-07-02</div>
							            </div>
							        </div>
							    </div>
							</div>
							<div class="card-footer bg-transparent mt-3 col-lg-10">
								<div class="d-flex align-items-end justify-content-between">
									<div class="d-flex align-items-center">
										<p>감사합니다! 수업 너무 기대됩니다~</p>
									</div>
									<div style="float: right">
										<button type="button" class="btn btn-default">수정</button>
										<button type="button" class="btn btn-default">삭제</button>
									</div>
								</div>
							</div>
							</div>
						</div>
						
						
					</div>
				</div>
			</div>
		</div>
	</main>		
</div>
	
<br><br>

</div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>  <!-- 폰트 -->
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/simple-datatables.js""></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script src="js/scripts.js"></script>
          
    </body>
</html>
