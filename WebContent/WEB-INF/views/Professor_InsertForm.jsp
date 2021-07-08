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
<title>Professor_InsertForm.jsp</title>

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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
	
<!-- 부트스트랩 script -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style type="text/css">

	th
	{
		text-align: center;
	}
	
</style>


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
	<div>
		<h2>강사 정보 등록</h2>
		<hr>
	</div>
	
	<div class="container">
		<form action="">
			<table class="table">
				<tr>
					<th>강사 이름</th>
					<td>
						한혜림
					</td>
				</tr>
				<tr>
					<th>대표 음악 카테고리</th>
					<td>
						<select id="music_cat_large">
							<option>대분류</option>
							<option>보컬</option>
							<option>악기</option>
							<option>이론</option>
						</select>
						<select id="music_cat_medium">
							<option>중분류</option>
							<option>성악</option>
							<option>랩</option>
							<option>피아노/건반</option>
							<option>드럼</option>
							<option>베이스</option>
							<option>현악기</option>
							<option>타악기</option>
							<option>그 외</option>
							<option>작/편곡</option>
						</select>
						<select id="music_cat_small">
							<option>소분류</option>
							<option>바이올린</option>
							<option>비올라</option>
							<option>첼로</option>
							<option>가요</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>계좌번호</th>
					<td>
						<input type="text" id="p_account" name="p_account"
						style="width: 70%">
					</td>
				</tr>	
				<tr>
					<th>학교명</th>
					<td><input type="text" id="p_school" name="p_school"
						style="width: 70%"></td>
				</tr>	
				<tr>
					<th>전공</th>
					<td><input type="text" id="p_major" name="p_major"
					style="width: 70%"></td>
				</tr>	
				<tr>
					<th>경력</th>
					<td>
						<textarea rows="5" cols="" id="p_career" name="p_career"
						style="width: 70%; text-align: left;">
						</textarea>
					</td>
				</tr>	
				<tr>
					<th>자격증빙서류 첨부파일</th>
					<td><input type="file" name="p_doc"></td>
				</tr>	
			
			</table>	
		</form>
	</div>
	<div style="float: right">
		<button type="submit" class="btn btn-outline-light btn-sm1">등록하기</button>
	</div>

</div>


</body>
</html>