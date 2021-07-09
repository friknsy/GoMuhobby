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
<title>QA_answerInsertForm.jsp</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/mainpage.css" rel="stylesheet" />
<link href="css/myPage1.css" rel="stylesheet" />


<!-- 부트스트랩 css -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> --> 

<!-- 제이쿼리 script -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
	
<!-- 부트스트랩 script -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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
          
</head>
<body>

<div class="container">
	<br><br>
	<h2>문의글 작성하기</h2>
	<hr>
</div>

<div class="container">
	<form action="qa_answerinsert.action?qa_forum_code=${qa_forum_code }" method="post">
		<table class="table table-bordered">
			<tr>
				<th colspan="2">내용</th>
			</tr>	
			<tr>
				<td colspan="2">
					<textarea rows="10" cols="" style="width: 100%; text-align: center;"
					id="qa_answ_content" name="qa_answ_content"></textarea>
				</td>
			</tr>	
		</table>
		
		<div style="text-align: center">
			<button type="submit" class="btn btn-outline-light btn-sm1">작성하기</button>
			&nbsp;&nbsp;
			<button type="reset" class="btn btn-outline-gray btn-sm1" onclick="location.href='qa_forum.action'">취소</button>
		</div>	
	</form>
</div>

</body>
</html>