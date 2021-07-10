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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Professor_UpdateForm.jsp</title>

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
		
		
		// 선택된 value 값 얻어오기 
		//alert($("#music_cat_code_value").val());
		
		// 선택된 value 값으로 selected 속성 지정하기
		$("#music_cat_code").val($("#music_cat_code_value").val());
		
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
		<h2>강사 정보 수정</h2>
		<hr>
	</div>
	
	<div class="container">
		<form action="professorupdate.action" method="post">
		<!-- 일단 고정값으로 넣어놨다. -->
		<input type="hidden" id="uniq_id_num" name="uniq_id_num" value="<%=uniqueId %>">
		<!-- 선택된 음악 카테고리 music_cat_code 의 value 값 -->
		<input type="hidden" id="music_cat_code_value" value="${read.music_cat_code }">
		
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
						style="width: 70%" value="${read.p_account }" required="required">
					</td>
				</tr>	
				<tr>
					<th>학교명</th>
					<td><input type="text" id="p_school" name="p_school"
						style="width: 70%" value="${read.p_school }" required="required"></td>
				</tr>	
				<tr>
					<th>전공</th>
					<td><input type="text" id="p_major" name="p_major"
					style="width: 70%" value="${read.p_major }" required="required"></td>
				</tr>	
				<tr>
					<th>경력</th>
					<td>
						<textarea rows="5" cols="" id="p_career" name="p_career"
						style="width: 70%; text-align: left;">${read.p_career }
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
				<button type="submit" class="btn btn-outline-light btn-sm1">수정하기</button>
			</div>
		</form>
	</div>

</div>


</body>
</html>