<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
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
		
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
        
        <link rel="stylesheet" href="css/mainpage0.css" />
        <link rel="stylesheet" href="css/register0.css" />
        <link rel="stylesheet" href="css/myPage0.css" />
    </head>
    <body class="sb-nav-fixed">
    	
        <nav class="navbar navbar-expand-lg navbar-dark">
                <div class="container px-5 mt-2">
                    <div>
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
                                	<li><a class="dropdown-item" href="#">Q&A 게시판 </a></li>
                                    <li><a class="dropdown-item" href="#">자유게시판</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">&nbsp;&nbsp;&nbsp;&nbsp;우주악당쭌이 님</a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <li><a class="dropdown-item" href="#">마이페이지</a></li>
                                    <li><a class="dropdown-item" href="#">정보 수정</a></li>
                                    <li><hr></li>
                                    <li><a class="dropdown-item" href="#">로그아웃</a></li>
                                </ul>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="SampleTest.jsp" >&nbsp;&nbsp;&nbsp;&nbsp;알림&nbsp;<i class="bi bi-bell-fill"></i>&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                            <!-- <li class="nav-item"><a class="nav-link" href="SampleTest.jsp" >&nbsp;&nbsp;&nbsp;&nbsp;로그인&nbsp;&nbsp;&nbsp;&nbsp;</a></li> -->	
                        </ul>
                    </div>
                </div>
            </nav>
            <br>
            <!--
            .form-floating > .form-control:focus, .form-floating > .form-control:not(:placeholder-shown) {
			  padding-top: 1.625rem;
			  padding-bottom: 0.625rem;
			}
             -->
            
        	<div id="layoutSidenav" style="position:relative;">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        	<br><br><br>
                        	<div class="sb-sidenav-menu-heading fs-5 text-center bold"><h2><span class="text-muhobby">
            			    클래스 개설</span></h2><hr></div>
                        	
                            <div class="sb-sidenav-menu-heading fs-5 text-center bold"><h4><a class="nav-link" href="#"><i class="bi bi-book"></i>&nbsp;강사 소개</h4></a></div>                            
							<div class="sb-sidenav-menu-heading fs-5 text-center bold"><h4><a class="nav-link" href="#"><i class="bi bi-book"></i>&nbsp;클래스 소개</h4></a></div>                            
							<div class="sb-sidenav-menu-heading fs-5 text-center bold"><h4><a class="nav-link" href="#"><i class="bi bi-book"></i>&nbsp;클래스 관리</h4></a></div>                            
							
                                                    
                        </div>
                    </div> 
                </nav>
            </div>
            <div class="container">
	                    
	                        <div class="row justify-content-center">
	                            <div class="col-lg-8">
	                                <div class="card shadow-lg border-0 rounded-lg mt-5">
	                                    <div class="card-header">
	                                    	<h2 class="text-center font-weight-light my-4 text-muhobby fw-bold">클래스 개설 정보</h2>
	                                    </div>
	                                    <div class="card-body">
	                                        <form action="sign.do" method="post">
	                                        	<br>
	                                            <div class="row mb-3">
	                                            <span class="mb-2 fw-bold normal">1) 클래스명 (필수)</span>
	                                                <div class="col-md-12">
	                                                    <div class="form-floating mb-3 mb-md-0">
	                                                        <input class="form-control" id="userId" name="userId"type="text"/>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <br>
	                                            <div class="row mb-3">
	                                            <span class="mb-2 fw-bold normal">2) 카테고리 선택 (필수)</span>
		                                            <div class="col-md-12">
		                                                <div class="row mb-3">
			                                                <div class="d-grid gap-3 d-sm-flex btn-group mb-2" data-toggle="buttons">
			                                                	<label class="btn btn-primary">
			                                                		<input type="radio" name="hobby" autocomplete="off" value="피아노/건반"> 피아노/건반
			                                                	</label>
			                                                	<label class="btn btn-primary">
			                                                		<input type="radio" name="hobby" autocomplete="off" value="보컬"> 보컬
			                                                	</label>
			                                                	<label class="btn btn-primary">
			                                                		<input type="radio" name="hobby" autocomplete="off" value="드럼"> 드럼
			                                                	</label>
			                                                	<label class="btn btn-primary">
			                                                		<input type="radio" name="hobby" autocomplete="off" value="작곡/미디"> 작곡/미디
			                                                	</label>
			                                                
			                                                
			                                                
			                                                	<label class="btn btn-primary">
			                                                		<input type="radio" name="hobby" autocomplete="off" value="기타"> 기타
			                                                	</label>
			                                                	<label class="btn btn-primary">
			                                                		<input type="radio" name="hobby" autocomplete="off" value="베이스"> 베이스
			                                                	</label>
			                                                	<label class="btn btn-primary">
			                                                		<input type="radio" name="hobby" autocomplete="off" value="현악기"> 현악기
			                                                	</label>
			                                                	<label class="btn btn-primary">
			                                                		<input type="radio" name="hobby" autocomplete="off" value="그 외"> 그 외
			                                                	</label>
			                                            	</div>
														</div>
													</div>
	                                            </div>
	                                            <br>
	                                            <div class="row mb-3">
	                                            <span class="mb-2 fw-bold normal">3) 클래스 대표 이미지 등록</span>
	                                                <div class="col-md-12">
	                                                    <div class="form-floating mb-3 mb-md-0">
	                                                        <input class="form-control" style="padding-left: 40%;" id="userId" name="userId" type="file"/>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <br>
	                                            
	                                            <div class="row mb-3">
	                                            <span class="mb-2 fw-bold normal">4) 클래스 상세 정보(필수)</span>
	                                                <div class="col-md-12">
	                                                    <div class="form-floating mb-3 mb-md-0">
	                                                       <section>
<!-- placeholder 때문에 TAB 으로 들여쓰기 하면 저>>>>>>쪽으로 날라감.. -->
	                                                       	   <textarea class="form-control" style= "height:300px" rows="3" placeholder="수업 목표(Key lessons  결과물 중심 1~3가지 ~ 최대 3줄)
* 무엇을 배울 수 있나요, 무엇을 얻을 수 있나요

해당 클래스 차별점(1 ~ 3가지) ~ 최대 3줄
 : 해당 카테고리의 다른 클래스들과 어떻게 다른가요"></textarea>
	                                                       </section>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <br>
	                                            <div class="row mb-3">
	                                            <span class="mb-2 fw-bold normal">5) 동영상 첨부 (선택)</span>
	                                                <div class="col-md-12">
	                                                    <div class="form-floating mb-3 mb-md-0">
	                                                        <input class="form-control" id="userId" name="userId"type="text"/>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            
	                                            <br>
	                                            
	                                            <div class="row mb-3 ">
	                                            <span class="mb-2 fw-bold normal">6) 수업 진행 장소 (필수)</span>
	                                                <div class="col-md-12">
	                                                    <div class="form-floating mb-3 mb-md-0">
	                                                        <div id="map" style="width:100%; height:400px;"></div>
	                                                        <br>
	                                                        <span class="mb-4 fw-bold">상세 주소 입력</span>
	                                                        <input class="form-control" id="userId" name="userId"type="text"/>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <br>
	                                            
	                                            <div class="row mb-3">
	                                            <span class="mb-2 fw-bold normal">7) 유의 사항 공지</span>
	                                                <div class="col-md-12">
	                                                    <div class="form-floating mb-3 mb-md-0">
	                                                       <section>
	                                                       	   <textarea class="form-control" style= "height:300px" rows="3" placeholder="수업 진행간의 유의 사항을 적어주세요.">&#13;&#10;		🔥 유의사항 입력 🔥&#13;&#10;&#13;&#10;		1. 수업에 늦을 시 미리 연락 주세요.&#13;&#10;		2. 대중교통 이용이 오시기에 편합니다.&#13;&#10;		3. 하루 전 취소/당일 취소는 환불규정에 의해 취소 및 환불이 불가합니다.</textarea>
	                                                       </section>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            
	                                            <br>
	                                            
	                                            <div class="row mb-3">
	                                            <span class="mb-2 fw-bold normal">8) 편의사항 제공</span>
		                                            <div class="col-md-12">
		                                                <div class="row mb-3">
			                                                <div class="d-grid gap-3 d-sm-flex btn-group mb-2" data-toggle="buttons">
			                                                	<label class="btn btn-primary">
			                                                		<input type="checkbox" name="hobby" autocomplete="off" value="와이파이"> 와이파이
			                                                	</label>
			                                                	<label class="btn btn-primary">
			                                                		<input type="checkbox" name="hobby" autocomplete="off" value="주차 가능"> 주차 가능
			                                                	</label>
			                                                	<label class="btn btn-primary">
			                                                		<input type="checkbox" name="hobby" autocomplete="off" value="대중교통 용이"> 대중교통 용이
			                                                	</label>
			                                                	<label class="btn btn-primary">
			                                                		<input type="checkbox" name="hobby" autocomplete="off" value="음료/간식 제공"> 음료/간식 제공
			                                                	</label>
			                                            	</div>
														</div>
													</div>
	                                            </div>
	                                            <br>
	                                            <div class="row mb-3">
	                                            	<div class="col-md-2">
	                                                </div>
	                                                <div class="col-md-4 col-md-3 d-grid">
	                                                	<a class="text-center btn1 btn-primary btn-block">이전 페이지</a>
	                                                </div>
	                                                <div class="col-md-4 d-grid">
	                                                	<!-- <a class="text-center btn1 btn-primary btn-block" href="/sign.do">회원 가입</a> -->
	                                                	<input class="text-center btn1 btn-primary btn-block" type="submit" id="loadBtn" value="다음 페이지" id="signup">
	                                                </div>
                                            	</div>
	                                            
	                                        </form>
				                        </div>
	                                </div>
	                                <br><br>
	                                <br><br>
	                            </div>
	                        </div>
	                    </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>  <!-- 폰트 -->
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
        <script src="js/simple-datatables.js""></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script src="js/scripts.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2b9b2cf7a452418866a021d167da7679"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(33.450701, 126.570667),
				level: 3
			};
	
			var map = new kakao.maps.Map(container, options);
		</script>
          
    </body>
</html>
