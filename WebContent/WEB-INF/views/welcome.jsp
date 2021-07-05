<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%--회원가입 이후 환영페이지 특별한 기능은 없음 --%>

<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>뮤하비 - 타성에 젖은 당신의 변화</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="css/mainpage.css" rel="stylesheet" />
    </head>
    
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            
            <!-- 메인 페이지 -->
            <header class="bg-dark py-5 mt-6" style="background-image: URL(images/violetSky2.jpg); height: 820px;">
                <div class="container px-5">
                    <div class="row gx-5 align-items-center justify-content-center">
                        <div class="col-lg-12 col-xl-12 col-xxl-12">
                            <div class="my-5 text-center text-xl-start">
                                <h1 class="display-5 fw-bolder text-white text-center">뮤하비의 회원이 되신 것을 환영합니다</h1>
                                
                                <p class="lead fw-normal text-center text-white-50 mb-4">뮤하비의 여러 서비스들을 자유롭게 이용해보세요</p>
                                <br><br><br><br>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center mt-7">
                        	<a class="btn btn-outline-light btn-lg px-4 me-sm-3" href="index.jsp">메인페이지로 가기</a>
                        </div>
                    </div>
                </div>
            </header>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
        
    </body>
</html>