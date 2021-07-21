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

<div class="container">
	<br><br>
	<div>
		<div style="float: left;"><h2>강사 커뮤니티</h2></div>
		<div id="count"><span>186개의 글<span></div>
		<div class="col-lg-3" style="float: right;"><button type="button" class="btn btn-outline-light btn-sm1">글 작성하기</button></div>
		<div style="clear:both;"></div>
		<div class="col-lg-10"><hr></div>
	</div>
	<!-- 게시글 -->
	<div>
		<div> <!-- card-footer -->
			<div class="bg-transparent mt-5 col-lg-3">
			    <div class="d-flex align-items-end justify-content-between">
			        <div class="d-flex align-items-center">
			            <img class="rounded-circle me-3" src="images/default.png" width="40px" height="40px"/>
			            <div class="small">
			                <div class="fw-bold">다람이</div>
			                <div class="text-muted">2021-07-01</div>
			            </div>
			        </div>
			    </div>
			</div>
			<div class="card-footer bg-transparent mt-4 col-lg-10">
				<div class="d-flex align-items-end justify-content-between">
					<div class="d-flex align-items-center">
						<p> 안녕하세요! 전 피아노를 처음 배워보거든요! 계이름도 모르는데 괜찮을까요?<br>
						혹시 이루마 곡도 칠 수 있을까요?</p>
					</div>
					<div style="float: right">
						<button type="button" class="btn btn-default btn-custom">수정</button>
						<button type="button" class="btn btn-default">삭제</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 댓글 -->
		<div style="margin-left: 40px;"> <!-- card-footer -->
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
		
		<!-- 댓글 작성 -->
		<div class="card-footer mt-3 col-lg-10 comment-area justify-content" style="height: 120px;">
			<form action="">
				<textarea class="form-control" id="comment" rows="content" 
				placeholder="댓글을 입력해주세요." maxlength="200" required="required"></textarea>
				<div style="float: right" class="mt-2">
					<button type="submit" class="btn btn-outline-light btn-sm1">등록</button>
				</div>			
			</form>
		</div>
		
	</div>
	
	<!-- 게시글 -->
	<div>
		<div> <!-- card-footer -->
			<div class="bg-transparent mt-5 col-lg-3">
			    <div class="d-flex align-items-end justify-content-between">
			        <div class="d-flex align-items-center">
			            <img class="rounded-circle me-3" src="images/default.png" width="40px" height="40px"/>
			            <div class="small">
			                <div class="fw-bold">다람이</div>
			                <div class="text-muted">2021-07-01</div>
			            </div>
			        </div>
			    </div>
			</div>
			<div class="card-footer bg-transparent mt-4 col-lg-10">
				<div class="d-flex align-items-end justify-content-between">
					<div class="d-flex align-items-center">
						<p> 안녕하세요! 전 피아노를 처음 배워보거든요! 계이름도 모르는데 괜찮을까요?<br>
						혹시 이루마 곡도 칠 수 있을까요?</p>
					</div>
					<div style="float: right">
						<button type="button" class="btn btn-default btn-custom">수정</button>
						<button type="button" class="btn btn-default">삭제</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 댓글 -->
		<div style="margin-left: 40px;"> <!-- card-footer -->
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
						<button type="button" class="btn btn-default">답글달기</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 댓글 작성 -->
		<div class="card-footer mt-3 col-lg-10 comment-area justify-content" style="height: 120px;">
			<form action="">
				<textarea class="form-control" id="comment" rows="content" 
				placeholder="댓글을 입력해주세요." maxlength="200" required="required"></textarea>
				<div style="float: right" class="mt-2">
					<button type="submit" class="btn btn-outline-light btn-sm1">등록</button>
				</div>			
			</form>
		</div>
		
	</div>
</div>
	
<br><br>

</body>
</html>