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
<title>QnABoard_Read.jsp</title>

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

<!-- 제이쿼리 script -->
<script type="text/javascript" src="<%=cp%>/js/jquery-3.6.0.min.js"></script>
	
<!-- 부트스트랩 script -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	$(function()
	{
		
		
		
		
		$(".updateBtn").click(function()
		{
			//alert("테스트");
			$(location).attr("href", "qa_forumupdateform.action?qa_forum_code=" + $(this).val());
		});
		
		
		$(".deleteBtn").click(function()
		{
			alert("테스트");
			
			if(confirm("게시물을 삭제하시겠습니까?"))
			{	
				$(location).attr("href", "qa_forumdelete.action?qa_forum_code=" + $(this).val());	
			}
			
			
			
		});
		
		$(".bookmarkBtn").click(function()
				{
					//alert("테스트");
					
					if(confirm("게시물을 북마크하시겠습니까?"))
					{	
						$(location).attr("href", "qa_bookmark.action?qa_forum_code=" + $(this).val());	
					}
					
					
					
				});
		
		
		$(".answerBtn").click(function()
				{
					//alert("테스트");
					
					if(confirm("답변을 작성하시겠습니까?"))
					{	
						$(location).attr("href", "qa_answerinsertform.action?qa_forum_code=" + $(this).val());	
					} 					
					
					
				});

		$(".delete2Btn").click(function()
		{
			//alert("테스트");
			
			if(confirm("게시물을 삭제하시겠습니까?"))
			{	
				$(location).attr("href", "qa_answerdelete.action?qa_answ_code=" + $(this).val());	
			}
			
			
			
		});
		

		$(".selectedBtn").click(function()
		{
			//alert("테스트");
			
			if(confirm("게시물을 채택하시겠습니까?"))
			{	
				$(location).attr("href", "qa_answerselectinsert.action?qa_answ_code=" + $(this).val());	
			}
			
			
			
		});
		
		if ($("#select").val()==1)
		{
			$(".selectedBtn").hide();
			$(".selectedBtn").css('border-color','#f8f9fa');
		}
		else
		{
			$(".selectedBtn").show();
		}
		
		if ($("#count").val()== 0)
		{
			$(".count").show();
		}
		else
		{
			$(".count").hide();
		}
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
	<h1>Q&A</h1>
	<article style="text-align: right;">
	<a style=""  href="qa_forum.action" class="btn btn-outline-gray btn-sm1 pull-right">목록으로</a>
	</article>
	<hr>
</div>

<div class="container">
		
			<!-- 채택된 게 있나 받아온다. (1 or 0)  -->
			<input type="hidden" value="${select}" id="select">
			
			<!-- 등록된 답변이 있는 지 없는지   -->
			<input type="hidden" value=${count } id="count">
			
			
	<table class="table table-bordered" style="text-align: center;">
			<tr>
				<th>제목</th>
				<td>${qread.qa_forum_title }</td>
				<th>작성일자</th>
				<td colspan="3">${qread.qa_forum_wrt_date }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${qread.user_nickname }</td>
			
				<th>조회수</th>
				<td>${qread.qa_forum_hit }</td>
				
				<th style="width: 20%">북마크</th>
				<td>${qread.bkm_count }</td>
			<tr>
				<th colspan="6" class="th-gray">내용</th>
			</tr>
			<tr>
				<td colspan="6" >${qread.qa_forum_content }</td>
			</tr>
		
	</table>
	
	<div style="text-align: center">	
		
		<!-- 게시글 작성한 사람만 삭제 -->
		
			<button type="button" class="btn deleteBtn btn-outline-light btn-sm1 pull-right"
		value="${qread.qa_forum_code }">삭제</button>
		
		<button type="button" class="btn updateBtn btn-outline-light btn-sm1 pull-right"
		value="${qread.qa_forum_code }">수정</button>
		
		
		<button type="button" class="btn bookmarkBtn btn-outline-light btn-sm1 pull-right"
		value="${qread.qa_forum_code }">북마크</button>
		<button type="button" class="btn btn-outline-light btn-sm1 pull-right"
		onclick="location.href='qa_answerinsertform.action?qa_forum_code=${qread.qa_forum_code}'">답변하기</button>
	</div>
</div>


<div class="container">
	<h2>답변</h2>
	<hr>
	<span class="count" style="text-align: center;">등록된 답변이 없습니다</span>
	<c:forEach var="answer" items="${read}" >	
		
		<table class="table table-bordered" style="text-align: center;">	
			<tr>
				<th>작성자</th>
				<td>${answer.user_nickname }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
				<th>작성일자</th>
				<td>${answer.qa_answ_wrt_date }</td>
				<!-- <td style="width: 80%; text-align: right;" > &nbsp;&nbsp;&nbsp;&nbsp;  </td>-->
			</tr>
			<tr>
				<th colspan="4">내용</td>
			</tr>
			<tr>
				<%-- <td>${answer.qa_answ_wrt_date }</td> --%>
				<%-- <td>${answer.user_nickname }</td> --%>
			</tr>
			<tr>
				<td colspan="4">${answer.qa_answ_content }</td>
			</tr>		
		</table>
		<!-- 쓴 사람만 삭제 가능하도록 -->
			<c:if test="${answer.uniq_id_num == sessionScope.sessionID }">
				<button type="button" class="btn delete2Btn btn-outline-light btn-sm1 pull-right"
				value="${answer.qa_answ_code }">삭제</button>
			</c:if>
		<button type="button"  class="btn selectedBtn btn-outline-light btn-sm1 pull-right"
		value="${answer.qa_answ_code }" >채택</button>
		<br><br>
	</c:forEach>
	
		
</div>

</body>
</html>