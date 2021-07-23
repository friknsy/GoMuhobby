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
	else
		// 로그인 정보가 없을 때 메인 페이지로 이동!
		out.println("<script>location.href=" + "'mainpage.action'" + ";</script>");
	
	String mynickName = null;
	
	if(session.getAttribute("mynickName")!=null)
	{
		mynickName = (String)session.getAttribute("mynickName");
	}
	
	String reviewStar = (String)request.getAttribute("reviewStar");
	
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>뮤하비 - 타성에 젖은 당신의 변화</title>

		<link rel="stylesheet" href="./css/bootstrap-material-datetimepicker.css" />
		<link href='http://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

		<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
		<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/ripples.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/material.min.js"></script>
		<script type="text/javascript" src="https://rawgit.com/FezVrasta/bootstrap-material-design/master/dist/js/material.min.js"></script>
		<script type="text/javascript" src="js/npm2.js"></script>
		<script type="text/javascript" src="./js/bootstrap-material-datetimepicker.js"></script>

        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/mainpage0.css" />
        <link rel="stylesheet" href="css/register0.css" />
        <link rel="stylesheet" href="css/myPage0.css" />
        
    </head>
    <body class="sb-nav-fixed">
    		 <div class="container">
	                        <div class="row justify-content-center">
	                            <div class="col-lg-12">
	                                <div class="card shadow-lg border-0 rounded-lg mt-5">
	                                    <div class="card-header">
							<h2 class="text-center font-weight-light my-4 text-muhobby fw-bold">강사 등급 기준</h2>
						</div>
						<div class="card-body">
							<h4 class="ms-2 text-start font-weight-light my-4 fw-bold" style="color: #f88b49;">🥉 브론즈 🥉</h4>
							<div>
								수강료 최대 30,000원 (1시간 기준)<br><br>
								
								[ 실버 등업 기준 ]<br>
								수업 진행 횟수 20회<br>
								클래스 전체 리뷰 별점 평균 3.5점 이상
							</div>
							<br /><br />
							<h4 class="ms-2 text-start font-weight-light my-4 text-muhobby fw-bold" style="color: #cccccc;">🥈 실버 🥈</h4>
							<div>
								수강료 최대 40,000원 (1시간 기준)<br><br>
								
								[ 골드 등업 기준 ]<br>
								수업 진행 횟수 30회<br>
								클래스 전체 리뷰 별점 평균 3.5점 이상
							</div>
							<br /><br />
							<h4 class="ms-2 text-start font-weight-light my-4 text-muhobby fw-bold" style="color: #ffb900;">🥇 골드 🥇</h4>
							<div>
								수강료 최대 50,000원 (1시간 기준)<br><br>
								
								[ 등급 유지 기준 ]<br>
								클래스 회차 한달 15회 진행<br>
								클래스 전체 리뷰 별점 평균 3.5점 유지
							</div>
							<br /><br />
						</div>
	                            </div>
	                        </div>
	                    </div>
		</div>		
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>  <!-- 폰트 -->
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
        <script src="js/simple-datatables.js"></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
