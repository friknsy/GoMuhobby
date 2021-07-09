<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); 	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Professor_Read.jsp</title>

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
		//alert($("#music_cat_small").val());
		
		
		// 음악 카테고리 소분류가 null 이라면 표시Ⅹ
		if ( $("#music_cat_small").val()=="")
		{
			$("#small").css("display","none");
			
		}
		
		// 등록된 강사 정보가 없을 때
		if ( $("#u_name").val()=="" )
		{
			$("#table").empty();
			$("#none").html("<br><br><b>등록된 강사 정보가 없습니다.</b>");
			$("#button").html('등록하기');
		}
		
		// 등록/수정 버튼을 클릭했을 때
		$("#button").click(function()
		{
			//alert("테스트");
			//alert($("#u_name").val())
			
			// 등록된 강사 정보가 없을 때
			if ( $("#u_name").val()=="" )
			{
				// 등록
				$(location).attr("href", "professorinsertform.action");
			}
			else 
			{	
				// 수정
				$(location).attr("href", "professorupdateform.action");	
			}
			
		});
		
		
	});

</script>

</head>
<body>

<!-- 맨 위 상단 바 -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container px-5 mt-2 mb-2">
        <div style="text-align: left;">
			<a href="SampleTest.jsp"><img src="images/muhobbytext3.png" width="200px" height="40px"></a>
		</div>
		<!-- <a class="navbar-brand" href="SampleTest.jsp">M U H O B B Y</a> -->
		<div class="input-group ms-4">
        	<input class="form-control" type="text" placeholder="통합 검색"  aria-describedby="btnNavbarSearch" />
        	<button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="bi bi-search"></i></button>
    	</div>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">	
            	<li class="nav-item"><a class="nav-link" href="SampleTest.jsp" >ONEDAY클래스&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            	<li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
                    <ul class="dropdown-menu dropdown-menu-end">
                    	<li><a class="dropdown-item" href="#">Q&A 게시판</a></li>
                        <li><a class="dropdown-item" href="#">자유게시판</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">&nbsp;&nbsp;&nbsp;&nbsp;박정준 님</a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#">마이페이지</a></li>
                        <li><a class="dropdown-item" href="#">정보 수정</a></li>
                        <li><hr></li>
                        <li><a class="dropdown-item" href="#">로그아웃</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link" href="SampleTest.jsp" >&nbsp;&nbsp;&nbsp;&nbsp;알림&nbsp;<i class="bi bi-bell-fill"></i>&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                <!-- <li class="nav-item"><a class="nav-link" href="SampleTest.jsp" >&nbsp;&nbsp;&nbsp;&nbsp;로그인&nbsp;&nbsp;&nbsp;&nbsp;</a></li> -->
                <!-- <li class="nav-item"><a class="nav-link" href="SampleTest.jsp" >로그아웃</a></li> -->
                <!-- <li class="nav-item"><a class="nav-link" href="SampleTest.jsp" >마이페이지&nbsp;&nbsp;&nbsp;&nbsp;</a></li> -->
            </ul>
        </div>
    </div>
</nav>


<div class="container">
	<br><br>
	<div>
		<h2>강사 정보</h2>
		<hr>
	</div>
	<div id="none" class="continer" style="text-align: center;"></div>
	<div class="container">
		<!-- 음악 카테고리 소분류 값을 제이쿼리에서 받을 수 있게 hidden 으로 숨김 -->
		<input type="hidden" id="music_cat_small" value="${read.music_cat_small}">
		<!-- 강사 이름값을 제이쿼리에서 받을 수 있게 hidden 으로 숨김 -->
		<input type="hidden" id="u_name" value="${read.u_name }">
		<table class="table" id="table">
			<tr>
				<th>강사 이름</th>
				<td>
					${read.u_name }
				</td>
			</tr>
			<tr>
				<th>음악 카테고리</th>
				<td>${read.music_cat_large } > ${read.music_cat_medium } <span id="small"> > ${read.music_cat_small }</span> </td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td>${read.p_account }</td>
			</tr>	
			<tr>
				<th>학교명</th>
				<td>${read.p_school }</td>
			</tr>	
			<tr>
				<th>전공</th>
				<td>${read.p_major }</td>
			</tr>	
			<tr>
				<th>경력</th>
				<td><pre>${read.p_career }</pre>
				</td>
			</tr>	
			<tr>
				<th>자격증빙서류 첨부파일</th>
				<td>${read.p_doc }</td>
			</tr>	
			<tr>
				<th>등록일자</th>
				<td>${read.p_date }</td>
			</tr>	
		
		</table>	
		
	</div>
	<div style="float: right">
		<button type="button" id="button" class="btn btn-outline-light btn-sm1">수정하기</button>
	</div>

</div>
<br><br>


</body>
</html>