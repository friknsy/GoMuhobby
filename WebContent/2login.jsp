<%@page import="java.util.Random"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
    <head>
    	<meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        
        <link rel="stylesheet" href="css/register.css" />
        
        <title>뮤하비 - 타성에 젖은 당신의 변화</title>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.js"></script>
    </head>
    
    <body class="bg-light">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                    	<br><br>
                    	<div class="text-center">
							<a href="#"><img src="images/muhobby3.png" width="160px" height="180px"></a>
						</div>
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header">
                                    	<h2 class="text-center font-weight-light my-4 text-muhobby fw-bold">뮤하비 <span class="text-dark">로그인</span></h2>
                                    </div>
                                    <div class="card-body">
                                        <form action="sign.do" method="post">
                                        	<br>
                                            <div class="row mb-3">
                                            <span class="mb-2 fw-bold">아이디</span>
                                                <div class="col-md-12">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userId" name="userId"type="text" placeholder="ID 입력"/>
                                                        <label for="inputFirstName">아이디 입력</label>
                                                    </div>
                                                </div>
                                                <div>
                                                	<h6 class="text-danger" id="idCheckMessage"></h6>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="row mb-3">
                                            <span class="mb-2 fw-bold">비밀번호</span>
                                                <div class="col-md-12">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userPass" name="userPass" onkeyup="passwordCheckFunction();" type="password" placeholder="비밀번호" />
                                                        <label for="inputPassword">비밀번호</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="row mb-3">
                                            	<div class="col-md-2">
                                                </div>
                                                <div class="col-md-4 d-grid">
                                                	<!-- <a class="text-center btn1 btn-primary btn-block" href="/sign.do">회원 가입</a> -->
                                                	<input class="text-center btn1 btn-primary btn-block" type="submit" id="loadBtn" value="로그인" id="signup">
                                                </div>
                                                <div class="col-md-4 col-md-3 d-grid">
                                                	<a class="text-center btn1 btn-primary btn-block">취소</a>
                                                </div>
                                            </div>
                                        </form>
			                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <br><br>
            <div class="text-muted py-4 bg-light px-4 text-center ">
            	<a href="#"><img src="images/muhobby4.png" width="140px" height="25px"></a>
               	Copyright &copy; Mr.HoJin
            </div>
            <br><br>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
