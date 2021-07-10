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
<title>ClassMain.jsp</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="<%=cp %>/assets/favicon.ico" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<%=cp %>/css/mainpage.css" rel="stylesheet" />
<link href="<%=cp %>/css/myPage1.css" rel="stylesheet" />
<!-- 추가 -->
<link href="<%=cp %>/css/bootstrap.css" rel="stylesheet"/>
<link href="<%=cp %>/css/bootstrap-theme.min.css" rel="stylesheet"/>

<!-- 부트스트랩 css -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> --> 

<!-- 제이쿼리 script -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script> -->
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>

	
<!-- 부트스트랩 script -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style type="text/css">
	.carousel 
	{
		margin-bottom: 0;
		padding: 0 100px 30px 100px;
		height: 300px;
	}
	
	.carousel-control 
	{
		left: -12px;
	}
	.carousel-control.right 
	{
		right: -12px;
	}
	
	.carousel-indicators 
	{
		right: 50%;
		top: auto;
		bottom: 0px;
		margin-right: -19px;
	}
	
	.carousel-indicators li 
	{
		background: #c0c0c0;
	}
	
	.carousel-indicators .active 
	{
		background: #333333;
	}
	
	.btn-rec
	{
		font-size: 20px;
		margin: 5px;
		height: 70px;
		width: 500px;
	}
		
</style>


<script type="text/javascript">
	$(document).ready(function() {
		$('#myCarousel').carousel({
			interval: 10000
		});
		
		//테스트
		//alert($("#c_photo").val());
		
	});
	
	
	
</script>


</head>
<body>

<div class="container" style="text-align: center">
	<br><br>
	<div>
		<div style="float: left;"><h1>원데이 클래스</h1></div>
		<div style="float: right;"">
			<button type="button" class="btn btn-outline-light btn-sm1">클래스 개설하기</button></div>
		<div style="clear: both;"></div>
		<hr>
	</div>
	<div class="container col-sm-12 col-lg-12">
		<div id="myCarousel" class="carousel slide" data-ride="carousel" >
         <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>  <!-- 혀니가 찾은 active -->
            <li data-target="#myCarousel" data-slide-to="1" ></li>
            <li data-target="#myCarousel" data-slide-to="2" ></li>
            <li data-target="#myCarousel" data-slide-to="3" ></li>         
         </ol>
         <div class="carousel-inner">
            <div class="item active mt-3" style="height: 280px; ">
               <img src="https://unsplash.it/1600/900/?random">   
            </div>
            <div class="item mt-3" style="height: 280px; ">
               <img src="https://unsplash.it/1600/900/?random">   
            </div>
            <div class="item mt-3" style="height: 280px; ">
               <img src="https://unsplash.it/1600/900/?random">   
            </div>
            <div class="item mt-3" style="height: 280px; ">
               <img src="https://unsplash.it/1600/900/?random">   
            </div>
         </div>
         <a class="left carousel-control" href="#myCarousel" data-slide="prev">
         </a>
         <a class="right carousel-control" href="#myCarousel" data-slide="next">
         </a>
      </div>
	</div>
	
	<div style="float: left;">
	<br><br>
		<div style="float: left;">
			<a href="#"><h3>전체 클래스<i class="bi bi-chevron-right"></i></h3></a>
		</div>
		<div style="float: left; margin-top: 20px;">
			<p>뮤하비에 개설되어 있는 전체 클래스 보기</p>
		</div>
	</div><div style="clear:both;"></div>
	<br><br>
	<div>
		<div style="float: left;">
			<h3>추천 클래스</h3>
		</div><div style="clear:both;"></div>
		<div style="text-align: center;">
			<div class="btn-rec" style="float: left;">
					<button type="button" class="btn btn-outline-light btn-lg1">지역 추천 클래스</button>
					<button type="button" class="btn btn-outline-light btn-lg1">관심 음악 추천 클래스</button>
			</div><div style="clear:both;"></div>
		</div>
		<div>
			<div style="float: left;">
				<h3>신규 클래스</h3>
			</div>
			<div style="float: left; margin-top: 20px;"><p>&nbsp;&nbsp;새로 만들어진 클래스</p></div>
		</div><div style="clear:both;"></div>
	</div>
	<br>
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
	   				<a href="#"><p style="font-weight: bold; text-align: left">${content.c_title }</p></a>
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
</body>
</html>