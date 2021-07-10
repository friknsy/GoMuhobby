<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 상세페이지</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
.effect {
	position: relative;
	display: inline;
	overflow: hidden; /* 불필요한 부분 가리기 */
	padding: 0px;
}

.effect:after {
	position: absolute;
	z-index: 8;
	width: 60px;
	height: auto;
	background: red;
	content: "14회차"; /* 보여주는 텍스트 */
	text-align: center;
	color: #fff;
	font-family: 'Arial';
	font-weight: bold;
	padding: 5px 5px;
	right: 10px;
	top: -30px;
	transform: rotate(0deg);
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
}

.speech-bubble {
	width: 30%;
	margin-left: 50px;
	margin-bottom: 10px;
	position: relative;
	background: #f3ecfd;
	border-radius: .4em;
	padding: 10px;
}

.speech-bubble:after {
	content: '';
	position: absolute;
	left: 0;
	top: 50%;
	width: 0;
	height: 0;
	border: 13px solid transparent;
	border-right-color: #f3ecfd;
	border-left: 0;
	margin-top: -13px;
	margin-left: -13px;
}

.speech-bubble2 {
	width: 30%;
	margin-right: 50px;
	margin-left: 50px;
	margin-bottom: 10px;
	position: relative;
	background: #ddc4f9;
	border-radius: .4em;
	padding: 10px;
}

.speech-bubble2:after {
	content: '';
	position: absolute;
	right: 0;
	top: 50%;
	width: 0;
	height: 0;
	border: 13px solid transparent;
	border-left-color: #ddc4f9;
	border-right: 0;
	margin-top: -13px;
	margin-right: -13px;
}
</style>

<script type="text/javascript">
	// 클래스 공유하기 버튼(id="sh-link")을 클릭했을 시 현재 url 을 복사하여 공유할 수 있도록 처리하였다. 
	$(document)
			.on(
					"click",
					"#sh-link",
					function(e)
					{
						// 링크복사 시 화면 크기 고정 
						$('html')
								.find('meta[name=viewport]')
								.attr(
										'content',
										'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no');
						var html = "<input id='clip_target' type='text' value='' style='position:absolute;top:-9999em;'/>";
						$(this).append(html);
						var input_clip = document.getElementById("clip_target");
						//현재 url 가져오기 
						var _url = $(location).attr('href');
						$("#clip_target").val(_url);
						if (navigator.userAgent.match(/(iPod|iPhone|iPad)/))
						{
							var editable = input_clip.contentEditable;
							var readOnly = input_clip.readOnly;
							input_clip.contentEditable = true;
							input_clip.readOnly = false;
							var range = document.createRange();
							range.selectNodeContents(input_clip);
							var selection = window.getSelection();
							selection.removeAllRanges();
							selection.addRange(range);
							input_clip.setSelectionRange(0, 999999);
							input_clip.contentEditable = editable;
							input_clip.readOnly = readOnly;
						} else
						{
							input_clip.select();
						}
						try
						{
							var successful = document.execCommand('copy');
							input_clip.blur();
							if (successful)
							{
								alert("URL이 복사 되었습니다. 원하시는 곳에 붙여넣기 해 주세요.");
								// 링크복사 시 화면 크기 고정
								$('html')
										.find('meta[name=viewport]')
										.attr(
												'content',
												'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=yes');
							} else
							{
								alert('이 브라우저는 지원하지 않습니다.');
							}
						} catch (err)
						{
							alert('이 브라우저는 지원하지 않습니다.');
						}
					});
	//클립보드 복사
</script>
</head>
<body>

	네비바 넣는 위치


	<!-- 클릭시 -->




	<h1>원데이클래스</h1>

	<div class="col-lg-2 pull-right">
		<div class="input-group">
			<input type="text" class="form-control" placeholder="Search for...">
			<span class="input-group-btn">
				<button class="btn btn-default" type="button">Go!</button>
			</span>
		</div>
		<!-- /input-group -->

	</div>
	<!-- /.col-lg-6 -->




	<hr />

	<h3>
		하루만에 완성하는 폴킴쌤의 보컬연습<span class="label label-default">보컬</span>
	</h3>

	<div>
		<div
			style="width: 50%; background-color:; float: left; padding: 30px;">
			<img src="images/1.jpeg" alt="불러올 수 없는 이미지입니다. "
				style="width: 700px;"><br>


			<button type="button" id="sh-link" class="btn btn-default btn-sm"
				style="background-color: #f3ecfd;">
				<span class="glyphicon glyphicon-send" aria-hidden="true"></span>
				클래스 공유하기
			</button>
			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>


			<h3>강사님이 개설했던 클래스</h3>
			<br>
			<div class="effect">
				<img src="https://unsplash.it/400/300/?random" style="width: 150px;">
			</div>
			<div class="effect">
				<img src="https://unsplash.it/400/300/?random" style="width: 150px;">
			</div>
			<div class="effect">
				<img src="https://unsplash.it/600/400/?random" style="width: 150px">
			</div>
			<div class="effect">
				<img
					src="https://www.ui4u.go.kr/depart/img/content/sub03/img_con03030100_01.jpg"
					style="width: 150px;">
			</div>
			<hr />

			<div class="btn-group" role="group" aria-label="">
				<a href="#classInformation"><button type="button"
						class="btn btn-default" style="width: 150px;">상세정보</button></a> <a
					href="#classReview"><button type="button"
						class="btn btn-default" style="width: 150px;">후기</button></a> <a
					href="#classQna"><button type="button" class="btn btn-default"
						style="width: 150px;">QNA</button></a> <a href="#classCancel"><button
						type="button" class="btn btn-default" style="width: 150px;">변경및취소</button></a>
			</div>

		</div>

		<div
			style="width: 50%; background-color:; float: right; padding: 50px; height: 800px;">
			<div class="well" style="padding: 30px;">
				<h3>멘토소개</h3>

				<div class="box"
					style="background: #BDBDBD; width: 140px; height: 140px; border-radius: 70%; overflow: hidden; float: left; margin: 20px;">
					<img class="profile" src="images/1.jpg" style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<br>


				<!-- 별점 -->
				<div
					style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
					<p
						style="WIDTH: 80%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
					</p>
				</div>
				
				
				<div style=" font-size: 30pt;">박정아 강사님</div>
				<div style="">총 진행 회차 : 30회</div>
				<div style="">총 후기 개수 : 30개</div>
				<div style=" padding-top: 50px;">&nbsp</div>
				<div style="">&nbsp </div>


				
				노래는 목으로만 부르지 않습니다. 두성, 흉성 등 다양한 스킬들의 차이를 알고 여러분께 가장 적합한
				발성법을 가르쳐드리도록 하겠습니다. 노래는 재능의 영역이 아닙니다. 이제 저와 시작하시죠 <br> <span
					class="glyphicon glyphicon-dashboard" aria-hidden="true">
					진행시간 : 1시간 30분</span><br> <span class="glyphicon glyphicon-map-marker"
					aria-hidden="true"> 장소 : 마포구 뮤뮤빌딩 4층</span><br> <span
					class="glyphicon glyphicon-user" aria-hidden="true"> 모집인원 :
					최대3명 최소1명</span><br> <span class="glyphicon glyphicon-user"
					aria-hidden="true"> 수강료 : 40000원</span><br>
			</div>
			<!-- .well -->




			<h3>클래스 회차 일정</h3>

			<form action="">

				<div class="btn-group-vertical" role="group" aria-label="..."
					style="width: 100%;">
					<button type="button" class="btn btn-default">
						2021년 5월 2일 14시 30분 - 16시 (3명/5명)<span class="badge">3</span>
					</button>
					<button type="button" class="btn btn-default">
						2021년 5월 3일 14시 30분 - 16시(3명/5명)<span class="badge">3</span>
					</button>
					<button type="button" class="btn btn-default">
						2021년 5월 4일 14시 30분 - 16시(3명/5명)<span class="badge">3</span>
					</button>
				</div>
				<br> <br> <br>

				<button type="submit" class="btn btn-default" style="width: 100%;">신청하기</button>



			</form>


		</div>


		<div style="height: 900px; width: 100%;"></div>

	</div>


	<div style="padding: 30px;">

		<a name="classInformation"></a> <br>
		<h3>클래스소개</h3>

		<iframe width="800" height="460"
			src="https://www.youtube.com/embed/Aq_gsctWHtQ"
			title="YouTube video player" frameborder="0"
			allow="accelerometer; autoplay; 
		                 clipboard-write; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen> </iframe>


		<br> 클래스에 대한 소개글 <br> Lorem ipsum dolor sit amet,
		consectetur adipisicing elit. Sit possimus rerum repellat accusantium
		recusandae ex enim sequi atque dolores eum ut molestiae inventore quas
		esse accusamus odio rem consequatur est. 소개글, <br>이런점이 좋아요<br>
		이런분들에게 추천해요<br> 커리큘럼은 <br> 1. 노래를 통한 발성습관체크
2. 학생 발성상태에 맞는 발음과 툴을 이용한 발성과 발음교정 및 트레이닝
3. 노래 적용
으로 진행됩니다.^^ <br>그리고
		클래스 등록일자<br> 준비물 : 열심히 하고자 하는 마음가짐 최고의 목상태!<br>유의사항 <br>공동현관에서 연락주세요 <br> <br>
		<h3>
			찾아오시는 길
			</h3>

				<div id="map" style="width: 50%; height: 700px;"></div>

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e943a4b910a88bd68a627159bd5111b&libraries=services"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption =
					{
						center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};

					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption);

					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();

					// 주소로 좌표를 검색합니다
					geocoder
							.addressSearch(
									'서울특별시 종로구 세종로 세종대로 172',
									function(result, status)
									{

										// 정상적으로 검색이 완료됐으면 
										if (status === kakao.maps.services.Status.OK)
										{

											var coords = new kakao.maps.LatLng(
													result[0].y, result[0].x);

											// 결과값으로 받은 위치를 마커로 표시합니다
											var marker = new kakao.maps.Marker(
											{
												map : map,
												position : coords
											});

											// 인포윈도우로 장소에 대한 설명을 표시합니다
											var infowindow = new kakao.maps.InfoWindow(
													{
														content : '<div style="width:150px;text-align:center;padding:6px 0;">강의진행장소</div>'
													});
											infowindow.open(map, marker);

											// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
											map.setCenter(coords);
										}
									});
				</script>



				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e943a4b910a88bd68a627159bd5111b"></script>
				<script>
					var container = document.getElementById('map');
					var options =
					{
						center : new kakao.maps.LatLng(33.450701, 126.570667),
						level : 3
					};

					var map = new kakao.maps.Map(container, options);
				</script>
				
				
				<br>주소: 서울특별시 종로구 세종로 세종대로 172
				<button type="button" class="btn btn-default btn-sm"
					style="background-color: #f3ecfd;">
					<span class="glyphicon glyphicon-music" aria-hidden="true"></span>
					와이파이 제공
				</button>
				<button type="button" class="btn btn-default btn-sm"
					style="background-color: #ddc4f9;">
					<span class="glyphicon glyphicon-ice-lolly-tasted"
						aria-hidden="true"></span> 간식 제공
				</button>
				<button type="button" class="btn btn-default btn-sm"
					style="background-color: #c79cf5;">
					<span class="glyphicon glyphicon-ice-lolly-tasted"
						aria-hidden="true"></span> 간식 제공
				</button>
				<button type="button" class="btn btn-default btn-sm"
					style="background-color: #ced4da; display: inline;">
					<span class="glyphicon glyphicon-ice-lolly-tasted"
						aria-hidden="true"></span> 간식 제공
				</button>

				<hr>

				<a name="classReview"></a>

				<h3>후기</h3>
				<button type="button" class="btn btn-default">>>자세히보기</button>


				<div class="well" style="width: 50%; height: 150px; margin: 10px;">
					<!-- well 안에 20% 80% 넓이의 div -->

					<div style="float: left; width: 20%">
						<div class="box"
							style="background: #BDBDBD; width: 100px; height: 100px; border-radius: 70%; overflow: hidden; float: left;">
							<img class="profile" src="images/1.jpg"
								style="width: 100%; height: 100%; object-fit: cover;"> <span>이유림</span>
						</div>

					</div>

					<div style="float: right; width: 80%">


						<div
							style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
							<p
								style="WIDTH: 60%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
							</p>
						</div>
						<br> <span>이유림</span><span> 2021.02.02</span> <br> <br>
						늦은 시간이었는데도 성심성의껏 알려주시고 잘하고 있다고 자신감 주셔서 좋았어요 감사합니다
					</div>

				</div>

				<div class="well" style="width: 50%; height: 150px; margin: 10px;">
					<!-- well 안에 20% 80% 넓이의 div -->

					<div style="float: left; width: 20%">
						<div class="box"
							style="background: #BDBDBD; width: 100px; height: 100px; border-radius: 70%; overflow: hidden; float: left;">
							<img class="profile" src="images/1.jpg"
								style="width: 100%; height: 100%; object-fit: cover;"> <span>이유림</span>
						</div>

					</div>

					<div style="float: right; width: 80%">


						<div
							style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
							<p
								style="WIDTH: 60%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
							</p>
						</div>
						<br> <span>이유림</span><span> 2021.02.02</span> <br> <br>
						너무쉽게 설명해주셔서 따라가기 좋았어요 한번수업받아보고 바로 배우기로했습니다!
					</div>

				</div>


				<div class="well" style="width: 50%; height: 150px; margin: 10px;">
					<!-- well 안에 20% 80% 넓이의 div -->

					<div style="float: left; width: 20%">
						<div class="box"
							style="background: #BDBDBD; width: 100px; height: 100px; border-radius: 70%; overflow: hidden; float: left;">
							<img class="profile" src="images/1.jpg"
								style="width: 100%; height: 100%; object-fit: cover;"> <span>이유림</span>
						</div>

					</div>

					<div style="float: right; width: 80%">


						<div
							style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
							<p
								style="WIDTH: 60%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(images/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
							</p>
						</div>
						<br> <span>이유림</span><span> 2021.02.02</span> <br> <br>
						거리가 좀 있어서 고민을 하였었는데
						정말정말 만족합니다
						첫수업이라 상담이랑 그냥 조금 배우고 오는줄 알았는데 제가 부족한부분, 배우고 싶었던 부분을 잘 알려주셔서
						비포 에프터가 바로 나왔답니다 ㅎㅎ
						추천추천드립니다
						다들 수업 받아보셔요~
						선생님 짱!
					</div>

				</div>










				<hr>



				<a name="classQna"></a>
				<h3>QnA</h3>
				<button  type="button" class="btn btn-default">>>자세히보기</button>
				


				<div class="speech-bubble">
					Q. 저 정말 음치인데 하루에 가능할까요?<br> <br> <br> <br> DATE
					: 2021.08.08 작성자 : 이유림
				</div>


				<div class="speech-bubble2">
					A.저의 오랜 노하우로꼭성공시켜드리겠습니다<br> <br> <br> <br> DATE
					: 2021.08.09 작성자 : 폴킴
				</div>


				<div class="speech-bubble">
					Q. 저 정말 음치인데 하루에 가능할까요?<br> <br> <br> <br> DATE
					: 2021.08.08 작성자 : 이유림
				</div>


				<div class="speech-bubble2">
					A.저의 오랜 노하우로꼭성공시켜드리겠습니다<br> <br> <br> <br> DATE
					: 2021.08.09 작성자 : 폴킴
				</div>





				<hr>


				<br> <br> <br>





				<div>
					<a name="classCancel"></a>
					<h3>변경 및 취소</h3>
					개인 사정으로 인한 결석은 환불되지 않습니다. 
					<br> [환불 규정] 
					<br> 1. 수업 2일 전 취소
					: 100% 환불
					<br> 2. 수업 1일 전 취소 : 50% 환불
					<br> 3. 수업 당일 취소 :
					환불불가<br>


				</div>

				<div id="disqus_thread"></div>
				<script>
					/**
					 *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
					 *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
					/*
					var disqus_config = function () {
					this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
					this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
					};
					 */
					(function()
					{ // DON'T EDIT BELOW THIS LINE
						var d = document, s = d.createElement('script');
						s.src = 'https://web1-2.disqus.com/embed.js';
						s.setAttribute('data-timestamp', +new Date());
						(d.head || d.body).appendChild(s);
					})();
				</script>
				<noscript>
					Please enable JavaScript to view the <a
						href="https://disqus.com/?ref_noscript">comments powered by
						Disqus.</a>
				</noscript>
	</div>








</body>
</html>