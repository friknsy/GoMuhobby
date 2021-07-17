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

	
	String url = (String)request.getAttribute("url");
	String forumId = (String)request.getAttribute("uniqId");
	
	String forumcheck = null;
	
	
	/* if(uniqueId.equals(forumId))
	{
		forumcheck = "자신의게시물";
	}
	else
	{
		forumcheck = null;
	}
	
	System.out.println(forumcheck); */
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>GoMuhobby.jsp</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/mainpage.css" rel="stylesheet" />

<!-- 페이지 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/board_read.css">

<!-- Font Awesome 5 -->
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- jQuery script  -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- Ajax 처리 -->
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

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

	<div class="container">
		<!-- ★★★★★내용★★★★★ -->
		<section class="post-view container">
			<!-- 해당 INPUT 삭제 금지 -->
			<input type="hidden" id="f_forum_code" name="f_forum_code" value="${read.f_forum_code}">
			<!-- 제목/작성자/작성일시/조회수 -->
			<div class="post-head row">
				<div class="col-lg-12">
					<!-- 글 제목 -->
					<h3 class="post-title bold">${read.f_forum_title }</h3>
					<!-- 제목 밑에 줄 -->
					<hr class="post-title-hr">
				</div>
			</div>

			<div class="post-head row">
				<div class="col-lg-6">
					<!-- 작성자아이디, 작성일시, 조회수 -->
					<ul class="list-inline">
						<img class="rounded-circle me-3" src="images/default.png" width="30px" height="30px" />
						<li class="list-inline-item g-mx-4">${read.user_nickname }</li>
						<li class="list-inline-item g-mx-4">|</li>
						<li id="timestamp" data-timestamp="2021-07-01 16:26:27.0"
							class="list-inline-item">${read.f_forum_wrt_date }</li>
						<li class="list-inline-item g-mx-4">|</li>
						<li class="list-inline-item g-mx-4">${read.f_forum_hit }</li>
				
					</ul>
				</div>

				<!-- 수정/삭제 버튼 -->
				<c:choose>
					<c:when test="${forumcheck eq null }">
						<div class="col-md-2 offset-md-4">
							<button type="submit" class="btn btn-secondary btn-sm pull-right"
								id="modify-btn" value="${read.f_forum_code }">수정</button>
							<button type="submit" class="btn btn-secondary btn-sm pull-right"
								id="delete-btn" value="${read.f_forum_code }">삭제</button>
						</div>
					</c:when>
	           		<c:otherwise>
	           			<div></div>
	           		</c:otherwise>
				</c:choose>		

				<!-- ★★★★★ 글내용 ★★★★★ -->
				<div class="row post-content">
					<!-- 글 내용 -->
					<div class="content col-lg-12">
						<p class="text-justify">${read.f_forum_content }</p>
					</div>
				</div>
				
				
				<!-- 동영상을 입력하지 않은 사람이면 안 보이게! -->
				<c:choose>
					<c:when test="${url eq null }">
		            <div class="card shadow border-0 col-lg-4">
		                <div class="card-body">
		                <iframe width="355" height="230" src="https://www.youtube.com/embed/${read.f_forum_video}" 
		                 title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; 
		                 clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
		                 allowfullscreen>
		                </iframe>
		                </div>
		            </div>
	            </c:when>
	           		<c:otherwise>
	           			<div></div>
	           		</c:otherwise>
				</c:choose>
				
				<!-- ★★★★★ 신고/공유/추천 버튼 ★★★★★★ -->
				
            	<div class="post-footer justify-content-center">
               		<button class="btn_report" onclick="processing(${read.f_forum_code })">
                  		<span class="fa fa-ban"></span> 신고
               		</button>
	               <button class="btn_like" value="${read.f_forum_code }">
	                  <span class="fas fa-bookmark"></span> 북마크
	               </button>
           		</div>
           		
           		<input type="hidden" id="uniq_id_num" name="uniq_id_num" value="<%=uniqueId %>">
	           		

				<!-- ★★★★★ 댓글 ★★★★★★ -->
				<!-- 댓글 -->
				<c:forEach var="reply" items="${list_Reply}">
					<c:choose>
						<c:when test="${reply.f_reply_step == 0 }">
							<div style="margin-left: 5px;">
								<!-- card-footer -->
								<div class="bg-transparent mt-3 col-lg-12">
									<div class="d-flex align-items-end justify-content-between">
										<div class="d-flex align-items-center">
											<img class="rounded-circle me-3" src="images/default.png"
												width="30px" height="30px" />
											<div class="d-flex small">
												<div class="fw-bold">${reply.user_nickname }</div>
												&nbsp;&nbsp;
												<div class="text-muted">${reply.f_reply_wrt_date }</div>
												
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer bg-transparent mt-3 col-lg-10">
									<div class="d-flex align-items-end justify-content-between">
										<div class="d-flex align-items-center">
											<p>${reply.f_reply_content }</p>
										</div>
										<div style="float: right">
											
											<button type="button" class="btn btn-default"></button>
										</div>
									</div>
								</div>
							</div>
						</c:when>

						<c:otherwise>
							<div style="margin-left: 30px;">
								<div class="bg-transparent mt-3 col-lg-12">
									<div class="d-flex align-items-end justify-content-between">
										<div class="d-flex align-items-center">
											<img class="rounded-circle me-3" src="images/default.png"
												width="30px" height="30px" />
											<div class="d-flex small">
												<div class="fw-bold">${reply.user_nickname }</div>
												&nbsp;&nbsp;
												<div class="text-muted">${reply.f_reply_wrt_date }</div>
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer bg-transparent mt-3 col-lg-12">
									<div class="d-flex align-items-end justify-content-between">
										<div class="d-flex align-items-center">
											<p>${reply.f_reply_content }</p>
										</div>
										<div style="float: right">
											<button type="button" class="btn btn-default">수정</button>
											<button type="button" class="btn btn-default">삭제</button>
										</div>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			
				<!-- 대댓글 -->
				<%-- 
				<c:forEach var="reply" items="${list_Reply}">
					<c:if test="${reply.f_reply_step == 1 }">
						<div style="margin-left: 80px;">
							<div class="bg-transparent mt-3 col-lg-3">
								<div class="d-flex align-items-end justify-content-between">
									<div class="d-flex align-items-center">
										<img class="rounded-circle me-3" src="images/default.png"
											width="30px" height="30px" />
										<div class="d-flex small">
											<div class="fw-bold">${reply.user_nickname }</div>
											&nbsp;&nbsp;
											<div class="text-muted">${reply.f_reply_wrt_date }</div>
										</div>
									</div>
								</div>
							</div>
							<div class="card-footer bg-transparent mt-3 col-lg-10">
								<div class="d-flex align-items-end justify-content-between">
									<div class="d-flex align-items-center">
										<p>${reply.f_reply_content }</p>
									</div>
									<div style="float: right">
										<button type="button" class="btn btn-default">수정</button>
										<button type="button" class="btn btn-default">삭제</button>
									</div>
								</div>
							</div>
						</div>
					</c:if>
			 </c:forEach> 
			 --%>



			<!-- 댓글 작성 -->
			<div class="card-footer mt-3 col-lg-12 comment-area justify-content" style="height: 120px;">
				    <!-- <form action="replyupdate.action"> -->
					<textarea class="form-control" id="comment_input" rows="content"
						placeholder="댓글을 입력해주세요." maxlength="200" required="required"></textarea>
					
					<!-- 댓글입력 버튼 -->
					<div style="float: right" class="mt-2">
						<button type="button" class="btn btn-outline-light btn-sm1" id="comment_submit" style="color: black;">등록</button>
					</div>
			</div>
			
			</div>
				<hr class="comment-hr">
			</section>
	</div>



	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

	<script type="text/javascript">
	
	
	
	   // 신고처리하기 버튼을 클릭했을 시
	   function processing(f_forum_code)
	   {
	      window.open("reportPopup.action?f_forum_code="+f_forum_code, "신고처리", "width=600, height=500, left=100, top=50"); 
	      window.close();
	   }
	
	
		$(function()
		{
			// 삭제
			$("#delete-btn").click(
					function()
					{
						//alert("테스트");

						if (confirm("게시물을 삭제하시겠습니까?"))
						{
							$(location).attr("href","ffdelete.action?f_forum_code="+ $(this).val());
						}

					});

			// 수정
			$("#modify-btn").click(function()
			{
				$(location).attr("href","ffupdateform.action?f_forum_code="+ $(this).val());

			});

			// 북마크 버튼
			$(".btn_like").click(function()
			{
				if (confirm("게시물을 북마크하시겠습니까?"))
				{
					$(location).attr("href","ffbookmark.action?f_forum_code="+$(this).val()+"&uniq_id_num="+$("#uniq_id_num").val());
				}
				
			});
			
			
			// 댓글 입력
			$("#comment_submit").click(function()
			{
				if ($("#comment_input").val() == "")
				{
					alert("등록할 내용을 입력하세요.");
					return;
				}
				
				var content = $('#comment_input').val();
				
				var sendData={
					f_forum_code : $('#f_forum_code').val(), 
					uniq_id_num : $("#uniq_id_num").val(),
					f_reply_content : $("#comment_input").val()
				};

				 $.ajax({
					method: "POST",
					url:"<c:url value='/replyupdate.action'/>",
					data:sendData,
					success:function(data){
						if(data=="SUCCESS"){
							
						}else{
							
						}
						location.reload();
					},
					complete:function(data){
						
					}
				}); 
		
			}); 
		});			
	
	</script>
	</body>
</html>