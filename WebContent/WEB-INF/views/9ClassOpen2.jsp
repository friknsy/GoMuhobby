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
%>

<%
	String c_title = (String)session.getAttribute("c_title");
	
	if(c_title == null)
	{
		c_title = "";
	}
	
	String music_cat_code = (String)session.getAttribute("music_cat_code");
	
	if(music_cat_code == null)
	{
		music_cat_code = "";
	}
	
	String c_photo = (String)session.getAttribute("c_photo");
	
	if(c_photo == null)
	{
		c_photo = "";
	}
	
	String c_detail_info = (String)session.getAttribute("c_detail_info");
	
	if(c_detail_info == null)
	{
		c_detail_info = "";
	}
	
	String c_video = (String)session.getAttribute("c_video");
	
	if(c_video == null)
	{
		c_video = "";
	}
	
	String c_addr = (String)session.getAttribute("c_addr");
	
	if(c_addr == null)
	{
		c_addr = "";
	}
	
	String c_detail_info2 = (String)session.getAttribute("c_detail_info2");
	
	if(c_detail_info2 == null)
	{
		c_detail_info2 = "🔥 유의사항 입력 🔥&#13;&#13;1. 수업에 늦을 시 미리 연락 주세요.&#13;2. 대중교통 이용이 오시기에 편합니다.&#13;3. 하루 전 취소/당일 취소는 환불규정에 의해 취소 및 환불이 불가합니다.";
	}
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
    <style>
	    .map_wrap {position:relative;width:100%;height:350px;}
	    .title {font-weight:bold;display:block;}
	    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
	    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
	    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	</style>
	<script type="text/javascript">
		function musicCat()
		{
			var catcode = $("#catCode option").index($("#catCode option:selected"));
			
			$('#music_cat_code').val(Number(catcode)+1);
		}
	</script>
    </head>
    <body class="sb-nav-fixed">
    	
        <!-- 맨 위 상단 바 -->
            <c:choose>
            	<c:when test="${mynickName eq null}">
		            <nav class="navbar navbar-expand-lg navbar-dark">
		                <div class="container px-5 mt-2">
		                    <div>
								<a href="mainpage.action"><img src="images/muhobbytext3.png" width="200px" height="40px"></a>
							</div>
							<!-- <a class="navbar-brand" href="SampleTest.jsp">M U H O B B Y</a> -->
							<div class="input-group ms-4">
		                    	<input class="form-control" type="text" placeholder="통합 검색"  aria-describedby="btnNavbarSearch" />
		                    	<button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="bi bi-search"></i></button>
		                	</div>
		                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
		                        	<li class="nav-item "><a class="nav-link me-3" href="classmain.action" >ONEDAY클래스</a></li>		                        	
		                        	<li class="nav-item dropdown me-3">
		                                <a class="nav-link dropdown-toggle " id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">서비스</a>
		                                <ul class="dropdown-menu dropdown-menu-end">
		                                	<li><a class="dropdown-item" href="noticeboardlist.action">공지사항</a></li>
		                                	<c:if test="${uniqueId ne null}">
												<li><a class="dropdown-item" href="qnaboard.action">1:1 문의내역</a></li>	
											</c:if>
		                                </ul>
		                            </li>
		                        	
		                        	<li class="nav-item dropdown me-3">
		                                <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
		                                <ul class="dropdown-menu dropdown-menu-end">
		                                	<li><a class="dropdown-item" href="qa_forum.action">Q&A 게시판 </a></li>
		                                    <li><a class="dropdown-item" href="fflist.action">자유게시판</a></li>
		                                </ul>
		                            </li>
		                            <li class="nav-item"><a class="nav-link me-3" href="loginform.action" >로그인</a></li>	
		                            <li class="nav-item"><a class="nav-link me-3" href="registerform.action" >회원가입</a></li>
		                        </ul>
		                    </div>
		                </div>
		            </nav>
	            </c:when>
	            
	            <c:otherwise>
		            <nav class="navbar navbar-expand-lg navbar-dark">
		                <div class="container px-5 mt-2">
		                    <div>
								<a href="mainpage.action"><img src="images/muhobbytext3.png" width="200px" height="40px"></a>
							</div>
							<!-- <a class="navbar-brand" href="SampleTest.jsp">M U H O B B Y</a> -->
							<div class="input-group ms-4">
		                    	<input class="form-control" type="text" placeholder="통합 검색"  aria-describedby="btnNavbarSearch" />
		                    	<button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="bi bi-search"></i></button>
		                	</div>
		                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
		                        	<li class="nav-item me-3"><a class="nav-link" href="classmain.action" >ONEDAY클래스</a></li>
		                        	<!-- <li class="nav-item "><a class="nav-link" href="noticeboardlist.action">공지사항&nbsp;&nbsp;&nbsp;&nbsp;</a></li> -->
		                        	
		                        	<li class="nav-item dropdown me-3">
		                                <a class="nav-link dropdown-toggle " id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">서비스</a>
		                                <ul class="dropdown-menu dropdown-menu-end">
		                                	<li><a class="dropdown-item " href="noticeboardlist.action">공지사항</a></li>
											
												<!-- 관리자가 아니라면 -->
												<c:if test="${adminStr eq null}">
													<li><a class="dropdown-item " href="qnaboard.action">1대1 문의</a></li>	
												</c:if>
												
												<!-- 관리자라면 -->
												<c:if test="${adminStr ne null}">
													<li><a class="dropdown-item " href="qnaboardadmin.action">관리자 1:1 문의</a></li>
												</c:if>
		                                </ul>
		                            </li>
		                        	
		                        	<li class="nav-item dropdown me-3">
		                                <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
		                                <ul class="dropdown-menu dropdown-menu-end">
		                                	<li><a class="dropdown-item " href="qa_forum.action">Q&A 게시판 </a></li>
		                                    <li><a class="dropdown-item " href="fflist.action">자유게시판</a></li>
		                                </ul>
		                            </li>
		                            <li class="nav-item dropdown me-3">
		                                <a class="nav-link dropdown-toggle " id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><%out.print(mynickName); %> 님</a>
		                                <ul class="dropdown-menu dropdown-menu-end">
		                                    <li><a class="dropdown-item " href="mypageform.action">마이페이지</a></li>
		                                    <li><a class="dropdown-item " href="#">정보 수정</a></li>
		                                    <li><hr></li>
		                                    <li><a class="dropdown-item " href="logoutAction.action">로그아웃</a></li>
		                                </ul>
		                            </li>
		                            <li class="nav-item me-3"><a class="nav-link " href="#" >알림&nbsp;<i class="bi bi-bell-fill bold"></i>&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		                        </ul>
		                    </div>
		                </div>
		            </nav>
            	</c:otherwise>
            </c:choose>
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
	                                        <form action="classopen3.action" method="get">
	                                        	<br>
	                                            <div class="row mb-3">
	                                            <span class="mb-2 fw-bold normal">1) 클래스명 (필수)</span>
	                                                <div class="col-md-12">
	                                                    <div class="form-floating mb-3 mb-md-0">
	                                                        <input class="form-control" id="c_title" name="c_title" type="text" value="<%out.print(c_title); %>"/>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <br>
	                                            <div class="row mb-3">
	                                            <span class="mb-2 fw-bold normal">2) 카테고리 선택 (필수)</span>
	                                                <div class="col-md-12">
	                                                    <div class="form-floating mb-3 mb-md-0">
	                                                    	<input type="hidden" id="music_cat_code" name="music_cat_code" value="1">
		                                                    <select class="form-select" aria-label="Default select example" id="catCode" onchange="musicCat()">
																<c:forEach var="group" items="${musiccat }">
																	<option value="${group.music_cat_code}">${group.music_cat_small }</option>
																</c:forEach>
															</select>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <br>
	                                            <div class="row mb-3">
	                                            <span class="mb-2 fw-bold normal">3) 클래스 대표 이미지 등록</span>
	                                                <div class="col-md-12">
	                                                    <div class="form-floating mb-3 mb-md-0">
	                                                    	<!-- 보안상의 문제로 value 값은 넣어줄 수 없어서 페이지 새로고침이 되면 다시 파일 선택을 해줘야 함. -->
	                                                        <input class="form-control" style="padding-left: 40%;" id="c_photo" name="c_photo" type="file"/>
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
	                                                       	   <textarea class="form-control" id="c_detail_info" name="c_detail_info" style= "height:300px" rows="3" placeholder="수업 목표(Key lessons  결과물 중심 1~3가지 ~ 최대 3줄)
* 무엇을 배울 수 있나요, 무엇을 얻을 수 있나요

해당 클래스 차별점(1 ~ 3가지) ~ 최대 3줄
 : 해당 카테고리의 다른 클래스들과 어떻게 다른가요"><%out.print(c_detail_info); %></textarea>
	                                                       </section>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <br>
	                                            <div class="row mb-3">
	                                            <span class="mb-2 fw-bold normal">5) 동영상 첨부 (선택)</span>
	                                                <div class="col-md-12">
	                                                    <div class="form-floating mb-3 mb-md-0">
	                                                        <input class="form-control" id="c_video" name="c_video"type="text" value="<%out.print(c_video); %>"/>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            
	                                            <br>
	                                            
	                                            <div class="row mb-3 ">
	                                            <span class="mb-2 fw-bold normal">6) 수업 진행 장소 (필수)</span>
	                                                <div class="col-md-12">
	                                                    <div class="form-floating mb-3 mb-md-0">
	                                                        
	                                                        <!-- 지도 출력 -->
	                                                        <div class="map_wrap">
															    <div id="map" style="width:100%; height:400px; zposition:relative;overflow:hidden;"></div>
															    <div class="hAddr">
															        <span class="title">지도중심기준 행정동 주소정보</span>
															        <span id="centerAddr"></span>
															    </div>
															</div>
															<!-- 지도 출력 -->
															
	                                                        <br><br><br>
	                                                        <span class="mb-4 fw-bold">상세 주소 입력</span>
	                                                        
	                                                        <!-- 클릭한 주소가 입력되는 부분. -->
	                                                        <input class="form-control" id="c_addr" name="c_addr" type="text" value="<%out.print(c_addr); %>"/>
	                                                        
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <br>
	                                            
	                                            <div class="row mb-3">
	                                            <span class="mb-2 fw-bold normal">7) 유의 사항 공지</span>
	                                                <div class="col-md-12">
	                                                    <div class="form-floating mb-3 mb-md-0">
	                                                       <section>
	                                                       	   <textarea class="form-control" id="c_detail_info2" name="c_detail_info2" style= "height:300px" rows="3" placeholder="수업 진행간의 유의 사항을 적어주세요."><%out.print(c_detail_info2); %></textarea>
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
			                                                		<input type="checkbox" name="cv_name" autocomplete="off" value="와이파이"> 와이파이
			                                                	</label>
			                                                	<label class="btn btn-primary">
			                                                		<input type="checkbox" name="cv_name" autocomplete="off" value="주차 가능"> 주차 가능
			                                                	</label>
			                                                	<label class="btn btn-primary">
			                                                		<input type="checkbox" name="cv_name" autocomplete="off" value="대중교통 용이"> 대중교통 용이
			                                                	</label>
			                                                	<label class="btn btn-primary">
			                                                		<input type="checkbox" name="cv_name" autocomplete="off" value="음료/간식 제공"> 음료/간식 제공
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
	                                                	<a class="text-center btn1 btn-primary btn-block" href="classopen1.action">이전 페이지</a>
	                                                </div>
	                                                <div class="col-md-4 d-grid">
	                                                	<!-- <a class="text-center btn1 btn-primary btn-block" href="/sign.do">회원 가입</a> -->
	                                                	<input type="submit" class="text-center btn1 btn-primary btn-block" value="다음 페이지">
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
        
        <!-- ■■■ 지도 API script ■■■ -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2b9b2cf7a452418866a021d167da7679&libraries=services"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 1 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
		
		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		
		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            var detailAddr = '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
		            
		            var content = '<div class="bAddr">' +
		                            '<span class="title">법정동 주소정보</span>' + 
		                            detailAddr + 
		                        '</div>';
		                        
		            /* ■■■ ID 값이 address이면 다음과 같이 value 입력 ■■■ 296줄 */            
					$('#c_addr').val(result[0].address.address_name);
					
		            // 마커를 클릭한 위치에 표시합니다 
		            marker.setPosition(mouseEvent.latLng);
		            marker.setMap(map);
		
		            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
		            infowindow.setContent(content);
		            infowindow.open(map, marker);
		        }   
		    });
		});
		
		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
		    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});
		
		function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}
		
		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
		
		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        var infoDiv = document.getElementById('centerAddr');
		
		        for(var i = 0; i < result.length; i++) {
		            // 행정동의 region_type 값은 'H' 이므로
		            if (result[i].region_type === 'H') {
		                infoDiv.innerHTML = result[i].address_name;
		                break;
		            }
		        }
		    }    
		}
		</script>
        <!-- ■■■ 지도 API script ■■■ -->  
    </body>
</html>
