<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
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

<%-- 
<%
	request.setCharacterEncoding("UTF-8");
	String root = pageContext.getServletContext().getRealPath("/");
	
	// 저장되는 위치와 폴더
	String path = root + "pds" + File.separator + "saveData";
	
	// 실제 물리적 주소
		System.out.println(root);
	
	// 저장 대상(디렉터리 경로)이 존재하지 않으면 생성
	File dir = new File(path);
	if(!dir.exists())
		dir.mkdirs();
	
	String encType = "UTF-8";
	int maxFileSize = 5*1024*1024;		// 전송 최대 사이즈 5M
	
	try
	{
		MultipartRequest req = null;
		req = new MultipartRequest(request, path, maxFileSize, encType, new DefaultFileRenamePolicy());
		// request → 요청에 처리할 요청 객체
		// path → 넘긴 파일이 저장될 주소
		// maxFileSize → 최대 사이즈
		// encType → 파일을 저장하려면 패킷단위로 잘라야 함. 그 자르는 방식 -> 인코딩 방식
		// DefaultFileRenamePolicy() → 이름정책. 
		//								같은 이름의 파일이 존재하면 이 정책에 따른다
		//	 							만들어서 써도 상관없다.
		
		//out.println("이름 : " + request.getParameter("name") + "<br>"); -- 그동안 써온 방식
		// 바이너리 형식으로 꺼내게되면 null 이라 쓸 수 없음. → MultipartRequest 사용 (한번 필터를 거친다) 
		
		out.println("이름 : " + req.getParameter("name") + "<br>");
		out.println("서버에 저장된 파일명 : " + req.getFilesystemName("upload") + "<br>");
		out.println("업로드한 파일명 : " + req.getOriginalFileName("upload") + "<br>");
		out.println("파일 타입 : " +  req.getContentType("upload") + "<br>");
		
		File file = req.getFile("upload");
		if(file != null)
			out.println("파일 길이" + file.length() + "<br>");
			
			
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
%>
 --%>
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

<script type="text/javascript">

	$(function()
	{
		// 뒤로가기
		$("#back").click(function()
		{
			//alert("테스트");
			$(location).attr("href", "professor.action");
		});
		

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
		<h2>강사 정보 등록</h2>
		<hr>
	</div>
	
	<div class="container">
		<form action="professorinsert.action" method="post" > <!-- enctype="multipart/form-data" -->
		
		<!-- 일단 고정값으로 넣어놨다. -->
		<input type="hidden" id="uniq_id_num" name="uniq_id_num" value="<%=uniqueId %>">
		
		
			<table class="table">
				<tr>
					<th>강사 이름</th>
					<td>
						${name }
					</td>
				</tr>
				<tr>
					<th>대표 음악 카테고리</th>
					<td>
						<select id="music_cat_code" name="music_cat_code" required="required">
						<optgroup label="보컬">
							<option value="1">성악</option>
							<option value="2">보컬</option>
							<option value="3">랩</option>
						</optgroup>
						<optgroup label="악기">
							<option value="4">드럼</option>
							<option value="5">베이스</option>
							<option value="6">클래식기타</option>
							<option value="7">재즈기타</option>
							<option value="8">어쿠스틱기타</option>
							<option value="9">피아노/건반</option>
							<option value="10">바이올린</option>
							<option value="11">비올라</option>
							<option value="12">첼로</option>
							<option value="13">콘트라베이스</option>
							<option value="14">마림바</option>
							<option value="15">퍼커션</option>
							<option value="16">플룻</option>
							<option value="17">색소폰</option>
						</optgroup>
						<optgroup label="이론">
							<option value="18">클래식작곡</option>
							<option value="19">가요작/편곡</option>
							<option value="20">현악편곡</option>
							<option value="21">미디/컴퓨터음악</option>
							<option value="22">시창청음/화성학</option>
							<option value="23">음향/레코딩</option>
						</optgroup>
						</select>
					</td>
				</tr>
				<tr>
					<th>계좌번호</th>
					<td>
						<input type="text" id="p_account" name="p_account"
						style="width: 70%" required="required">
					</td>
				</tr>	
				<tr>
					<th>학교명</th>
					<td><input type="text" id="p_school" name="p_school"
						style="width: 70%" required="required"></td>
				</tr>	
				<tr>
					<th>전공</th>
					<td><input type="text" id="p_major" name="p_major"
					style="width: 70%" required="required"></td>
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
			<div style="float: left">
				<button type="button" id="back" class="btn btn-default">뒤로가기</button>
			</div>	
			<div style="float: right">
				<button type="submit" class="btn btn-outline-light btn-sm1">등록하기</button>
			</div>
		</form>
	</div>

</div>
<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

</body>
</html>