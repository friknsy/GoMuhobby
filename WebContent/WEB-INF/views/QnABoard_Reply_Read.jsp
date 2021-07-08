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
	else
	{	
		// 로그인 정보가 없을 때 메인 페이지로 이동!
		out.println("<script>location.href=" + "'main.action'" + ";</script>");
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
<title>QnABoard_Reply_Read.jsp</title>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Blog Post - Start Bootstrap Template</title>
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


<script type="text/javascript">
	
	$(function()
	{
		// 문의 게시물 번호 받아오기
		var qna_num = $("#qna_num").val();
		
		// 테스트
		//alert(answ_num);
		
		// 수정
		$(".updateBtn").click(function()
		{
			//alert("테스트");
			// 문의 게시물 번호와 답변 게시물 번호를 같이 넘긴다.
			/* $(location).attr("href", "qnaboardreplyupdateform.action?qna_answ_num=" + $(this).val()
									+ "&qna_num=" + qna_num); */
			$(location).attr("href", "qnaboardreplyupdateform.action?qna_answ_num=" + $(this).val() + "&qna_num=" + $("#answ_num").val());
									
		});
		
		
		$(".deleteBtn").click(function()
		{
			//alert("테스트");
			
			if(confirm("게시물을 삭제하시겠습니까?"))
			{	
				$(location).attr("href", "qnaboardreplydelete.action?qna_answ_num=" + $(this).val());
				
			}
			
		});
		
		// 답변글이 존재하지 않을 때
		if ($("#qna_answ_title").val()=="")
		{
			$("#table").empty();	
			$("#none").html("<br><br><b>작성된 답변글이 없습니다.</b>");
			$(".updateBtn").hide();
			$(".deleteBtn").hide();
			
		}
		else
		{
			$("#reply").hide();
			
		}
		
		
		
	});

</script>

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
		                        	<li class="nav-item "><a class="nav-link me-3" href="SampleTest.jsp" >ONEDAY클래스</a></li>		                        	
		                        	<li class="nav-item dropdown me-3">
		                                <a class="nav-link dropdown-toggle " id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">서비스</a>
		                                <ul class="dropdown-menu dropdown-menu-end">
		                                	<li><a class="dropdown-item" href="noticeboardlist.action">공지사항</a></li>
		                                    <li><a class="dropdown-item" href="qnaboard.action">1:1 문의내역</a></li>
		                                </ul>
		                            </li>
		                        	
		                        	<li class="nav-item dropdown me-3">
		                                <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
		                                <ul class="dropdown-menu dropdown-menu-end">
		                                	<li><a class="dropdown-item " href="#">Q&A 게시판 </a></li>
		                                    <li><a class="dropdown-item " href="#">자유게시판</a></li>
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
		                        	<li class="nav-item me-3"><a class="nav-link" href="SampleTest.jsp" >ONEDAY클래스</a></li>
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
		                                	<li><a class="dropdown-item " href="#">Q&A 게시판 </a></li>
		                                    <li><a class="dropdown-item " href="#">자유게시판</a></li>
		                                </ul>
		                            </li>
		                            <li class="nav-item dropdown me-3">
		                                <a class="nav-link dropdown-toggle " id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><%out.print(mynickName); %> 님</a>
		                                <ul class="dropdown-menu dropdown-menu-end">
		                                    <li><a class="dropdown-item " href="mypage.action">마이페이지</a></li>
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
            

<div class="container">
	<br><br>
	<h2>1:1 문의내역</h1>
	<hr>
</div>

<div class="container">
	<table class="table table-bordered" style="text-align: center;">
			<tr>
				<th>분류</th>
				<td>${read.qna_cat_name }</td>
				<th>글번호</th>
				<td>${read.qna_num }</td>
				
			</tr>
			<tr>
				<th>제목</th>
				<td>${read.qna_title }</td>
				<th>작성일자</th>
				<td>${read.qna_wrt_date }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${read.user_nickname }</td>
	
				<th>처리상태</th>
				<td>${read.qna_proc }</td>
			<tr>
				<th colspan="4" class="th-gray">내용</th>
			</tr>
			<tr>
				<td colspan="4" >${read.qna_content }</td>
			</tr>
	</table>
	<div>
		<button type="button"  id="reply" style="float: right" 
		class="btn btn-outline-light btn-sm1"
		onclick="location.href='qnaboardreplyinsertform.action?qna_num=${read.qna_num}'">답변작성</button>
	</div>	
	
	<div>
		<form action="" ><!-- style="width: 700px; margin: 20px;" -->
		
			<br><br>
			
			<input type="hidden" id="qna_answ_title" value="${reply.qna_answ_title }">
			<input type="hidden" id="qna_answ_content" value="${reply.qna_answ_content }">
			
			<table id="table" class="table table-bordered" style="text-align: center;">
				<tr>
					<h2>문의 답변</h2>
					<hr>
				</tr>
				<div id="none" class="continer" style="text-align: center;"></div>
				<tr>
					<th>작성자</th>
					<td>관리자</td>
				</tr>	
				<tr>
					<th>제목</th>
					<td>
						${reply.qna_answ_title }
					</td>
				</tr>	
				<tr>
					<th colspan="2">내용</th>
				</tr>	
				<tr>
					<td colspan="2">
						${reply.qna_answ_content }
					</td>
				</tr>	
			</table>
			
		
		</form>
	</div>
	
	<div style="text-align: center">	
		<a href="qnaboardadmin.action" class="btn btn-outline-gray btn-sm1"
		 style="float: left">목록으로</a>
		<button type="button" class="btn deleteBtn btn-outline-light btn-sm1"
		style="float: right" value="${reply.qna_answ_num }" >삭제</button>
		&nbsp;&nbsp;
		<button type="button" class="btn updateBtn btn-outline-light btn-sm1"
		style="float: right" value="${reply.qna_answ_num }">수정</button>
		<input type="hidden" id="answ_num" value="${read.qna_num }">
	</div>
</div>

<br><br>
<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>