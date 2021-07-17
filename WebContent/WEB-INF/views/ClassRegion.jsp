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
<title>ClassRegion.jsp</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="<%=cp %>/assets/favicon.ico" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<%=cp %>/css/mainpage.css" rel="stylesheet" />
<link href="<%=cp %>/css/myPage1.css" rel="stylesheet" />
<!-- 추가 -->
<%-- <link href="<%=cp %>/css/bootstrap.css" rel="stylesheet"/> --%>


<!-- 부트스트랩 css -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> --> 

<!-- 제이쿼리 script -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script> -->
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>

	
<!-- 부트스트랩 script -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style type="text/css">
	
	.btn-rec
	{
		font-size: 20px;
		margin: 5px;
		height: 70px;
		width: 500px;
	}
	
	a 
	{ 
		color : black; 
		text-decoration:none; 
	}
		
</style>


<script type="text/javascript">
	
	
	$(function()
	{
		//alert($("#c_photo").val());
		if (typeof($("#c_photo").val())=="undefined")
		{
			$("#none").html("<br><br><b>아직 회원님이 지역 정보를 등록하지 않으셨거나 선택하신 해당 지역에 개설된 클래스가 아직 개설되지 않았어요😭 " + 
					        "<br>지역은 회원 정보 수정에서 등록가능합니다. 지금 등록하러 가볼까요?<b>");
		}
		
	});
	
	
	
	// 조회된 클래스가 없을경우
	/* if ( $("#c_title").val()=="" )
	{
		$("#table").empty();
		$("#none").html("<br><br><b>등록된 강사 정보가 없습니다.</b>");
		$("#button").html('등록하기');
	} */
	
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

<div class="container" style="text-align: center">
	<br><br>
	<div>
		<div style="float: left;"><h1>원데이 클래스</h1></div>
		<div style="float: right;"">
			<a type="button" class="btn btn-outline-light btn-sm1" href="classopen1.action">클래스 개설하기</a></div>
		<div style="clear: both;"></div>
		<hr>
	</div>
	<br><br>
	<div>
		<div>
			<div style="float: left;">
				<h3>지역 추천 클래스</h3>
			</div>
			<div style="float: left; margin-top: 5px;"><p>&nbsp;&nbsp;현재 회원님이 등록하신 지역에 개설되어 있는 클래스입니다!</p></div>
		</div><div style="clear:both;"></div>
	</div>
	<br>
	
	<!-- 조회된 클래스가 없을때 -->
	<div id="none" class="continer" style="text-align: center;"></div>
	
	<div class="row row-cols-1 row-cols-md-2 g-4">
	<c:forEach var="content" items="${list }">
	<!-- 대표 사진 -->
	<input type="hidden" id="c_photo"  name="c_photo" value="${content.c_photo }">
		<div class="card col-xs-3 col-sm-3 col-md-3 mt-3"> <!-- style="width: 18rem;" -->
  			<img src="images/${content.c_photo }" alt="" class="card-img-top">
  			<!-- <img alt="" src="file:///C:/Muhobby/GoMuhobby02/WebContent/images/피아노.jpg"> -->
  			<div class="card-body">
	   			<div class="card-text">
	   				<p style="text-align: right"><i class="bi bi-geo-alt-fill"></i> ${content.town_name }</p>
	   				<a href="onedayclassinfo.action"><p style="font-weight: bold; text-align: left">${content.c_title }</p></a>
	   				<div>
	   					<p style="font-weight: bold; color: red; text-align: left;">￦ ${content.c_price }
	   					<small style="color: black; font-weight: normal;">/시간</small></p>
	   					<p style="font-weight: bold; text-align: right">${content.u_name }<small> 강사</small></p>
	   				</div>
   				
    			</div>
 			</div>
		</div>
	</c:forEach>
		
	</div>
	
</div>
<br><br>
<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>
</html>