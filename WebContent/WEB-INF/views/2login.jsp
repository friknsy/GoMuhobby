<%@page import="java.util.Random"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
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
    
    <script type="text/javascript">
    
    	$(document).ready(function()
        {
			$("#loginBtn").on("click", function()
			{	
				var userId = $('input[name=u_id]').val();
				var userPw = $('input[name=u_pwd]').val();
				
				$.post("loginIdCheck.action", {userId : userId, userPw : userPw}, function(data)
				{	
					$('#idCheckMessage').html("");
					$('#pwCheckMessage').html("");
					
					if(data=="idfail")
		            {
		            	$('#idCheckMessage').html("존재하지 않는 아이디이거나 탈퇴한 아이디 입니다.");
		            	$('#idCheckMessage').css("color", "#dc3545");
		            }
					
		            else if (data=="pwfail")
		            {
		            	$('#pwCheckMessage').html("비밀번호가 일치하지 않습니다.");
		            	$('#pwCheckMessage').css("color", "#dc3545");
		            }
					
		            else
		            {	
		            	/* location.href = 'mainpage.action';  */
		            	/* history.back(); */
		            	/* 로그인 후 메인페이지가 아니라 이전페이지로 돌아가도록 처리해줌
		            	→ 로그인 후 뒤로가기를 했더니 로그인이 안되어있는 문제가 발생(세션값은 설정됐는데
		            			로그인 이전상태의 세션값을 그대로 사용하면서 네비바에 로그인버튼이 생김)*/ 
		            	location.href = document.referrer;
		            	/* rupy210722 문제해결 : 이전 세션값을 유지하는 history.back() 이 아니라 새로운 세션값으로 이전 url 로 가도록 설정해줌 */
		            }
				});
			});
		});
    
    </script>
    
    <body class="bg-light">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                    	<br><br>
                    	<div class="text-center">
							<a href="mainpage.action"><img src="images/muhobby3.png" width="160px" height="180px"></a>
						</div>
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header">
                                    	<h2 class="text-center font-weight-light my-4 text-muhobby fw-bold">뮤하비 <span class="text-dark">로그인</span></h2>
                                    </div>
                                    <div class="card-body">
                                        <!-- <form action="loginIdCheck.action" method="post"> -->
                                        	<br>
                                            <div class="row mb-3">
                                            <span class="mb-2 fw-bold">아이디</span>
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userId" name="u_id" type="text" placeholder="ID 입력"/>
                                                        <label for="inputFirstName">아이디 입력</label>
                                                    </div>
                                                </div>
                                                <div>
                                                	<h6 id="idCheckMessage"></h6>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="row mb-3">
                                            <span class="mb-2 fw-bold">비밀번호</span>
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userPass" name="u_pwd" type="password" placeholder="비밀번호" />
                                                        <label for="inputPassword">비밀번호</label>
                                                    </div>
                                                </div>
                                                <div>
                                                	<h6 id="pwCheckMessage"></h6>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="row mb-3">
                                            	<div class="col-md-2">
                                                </div>
                                                <div class="col-md-4 d-grid">
                                                	<!-- <a class="text-center btn1 btn-primary btn-block" href="/sign.do">회원 가입</a> -->
                                                	<input class="text-center btn1 btn-primary btn-block" type="submit" id="loginBtn" name="loginBtn" value="로그인">
                                                </div>
                                                <div class="col-md-4 col-md-3 d-grid">
                                                	<a class="text-center btn1 btn-primary btn-block" href="mainpage.action">취소</a>
                                                </div>
                                            </div>
                                        <!-- </form> -->
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
