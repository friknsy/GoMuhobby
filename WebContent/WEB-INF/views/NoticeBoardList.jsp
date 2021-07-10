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
<title>뮤하비 공지사항</title>

	<style type="text/css">
		a, a:hover {
			color: #000000;
			text-decoration: none;	
		}
	</style>
		<title>뮤하비 - 타성에 젖은 당신의 변화</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="css/mainpage.css" rel="stylesheet" />
</head>

<script type="text/javascript">
	$(function()
	{
		$("#category").on('change', function()
		{
			
			if(this.value==0) // 만약 [분류별로 모아보기] 를 선택했을 경우 전체 리스트를 보여주고
			{
				
				
				$(location).attr('href','noticeboardlist.action');  
				
			}
			else //[안내][서비스점검] 등 특정 분류를 선택했다면 그 분류의 목록들만 보여준다. 
			{
				$(location).attr('href','noticecategrizedlist.action?ntc_cat_code='+this.value);
				
			}
		})
	})

</script>

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
            
			<br>
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="text-center text-xl-start">
							<select name="category" id="category" class="form-control" style="width: 40%;">
								<option value="" selected disabled hidden class="text-center">==분류로 모아보세요==</option> <!-- 맨 처음 값을 가지지 않도록 하고 0(전체),1,2,3,4,5 를 선택할 시 분류대로 리스트보여지도록-->
								<option value="0">전체</option>
								<c:forEach var="list" items="${noticeCat }">
								<option value="${list.ntc_cat_code }">${list.ntc_cat_name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-lg-6 mb-3">	
						<div class="text-center text-xl-start ">
							<form action="noticekeywordsearch.action" method="post" >
								<div class="pull-right">
									<div class="input-group" style="float: right; width: 300px;">
										<!--
										<input class="form-control" type="text" placeholder="통합 검색"  aria-describedby="btnNavbarSearch" />
		                    			<button class="btn btn-primary" type="submit"><i class="bi bi-search"></i></button> 
										 -->
										<input type="text" class="form-control" placeholder="검색"  name="searchKeyword">
											<button class="btn btn-primary" type="submit"><i class="bi bi-search"></i></button>
											<!-- <button class="btn btn-default" type="submit">검색</button> -->
									</div>	
								</div>
							</form>
						</div>
						
						<c:choose>
							<c:when test="${adminStr eq null}">
							<div>
							</div>
							</c:when>
							<c:otherwise>						
									<div>
										<a href="noticeboardinsertform.action" class="btn btn-outline-light1 px-4 me-sm-3" >공지사항 작성하기</a>
									</div>
							</c:otherwise>
						</c:choose>
							
					</div>
					
					<table class="table table-hover" style="text-align: center; border: 1px solid #f3ecfd; padding-top: 30px;">
						<thead>
							<tr>
								<th style="background-color: #f3ecfd; text-align: center;">번호</th>
								<th style="background-color: #f3ecfd; text-align: center;">분류</th>
								<th style="background-color: #f3ecfd; text-align: center;">제목</th>
								<th style="background-color: #f3ecfd; text-align: center;">조회수</th>
								<th style="background-color: #f3ecfd; text-align: center;">작성일</th>
							</tr>
						</thead>
		
						<tbody>
						
							<c:forEach var="notice"  items="${list }">	
							<tr>
								<td>${notice.rownum }</td>
								<td>${notice.ntc_cat_name }</td>
								<td><a href="noticeselect.action?ntc_num=${notice.ntc_num}" style="text-decoration: none;">${notice.ntc_title }</a></td> <!-- 지금 여기서 제목을 넘기면 요청url 과 함께 btc_num 넘겨줘야 하는데 그게 안된다... -->
								<td>${notice.ntc_hit }</td>
								<td>${notice.ntc_wrt_date }</td>
							</tr>
							</c:forEach>			
						</tbody>
					</table>
									<!-- 
										<nav class="text-center">			
										  <ul class="pagination" style="text-align: center;">
										    <li>
										      <a href="#" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										      </a>
										    </li>
										    <li><a href="#">1</a></li>
										    <li><a href="#">2</a></li>
										    <li><a href="#">3</a></li>
										    <li><a href="#">4</a></li>
										    <li><a href="#">5</a></li>
										    <li>
										      <a href="#" aria-label="Next">
										        <span aria-hidden="true">&raquo;</span>
										      </a>
										    </li>
										  </ul>
										</nav>
									-->
				</div>
			</div>
		</main>
		<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
	</body>
</html>