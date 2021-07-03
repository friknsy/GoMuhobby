<%@page import="java.util.Random"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%!
	public static String getrndnum(int loopcount)
	{
		String str = "";
		int d = 0;
	
		for (int i = 1; i <= loopcount; i++)
		{
			Random r = new Random();
    		d = r.nextInt(9);
    		str = str + Integer.toString(d);
		}
		
  		return str;
	}
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
        <script type="text/javascript" src="<%=cp %>/js/ajax.js"></script>
        <script type="text/javascript">
        	
        	/* 빈칸 막기 */
	        $(document).ready(function(){
				$("#submit").on("click", function(){
					// 아이디 입력 확인
					if($("#userId").val()=="")
					{
						alert("아이디를 입력해주세요.");
						$("#userId").focus();
						return false;
					}
					
					// 비밀번호 입력 확인
					if($("#userPass").val()=="")
					{
						alert("비밀번호를 입력해주세요.");
						$("#userPass").focus();
						return false;
					}
					
					if($("#userPass").val()!=$("#userPassConfirm").val())
					{
						alert("비밀번호가 일치하지 않습니다.");
						$("#userPass").focus();
						return false;
					}
					
					// 이름 입력 확인
					if($("#userName").val()=="")
					{
						alert("성명을 입력해주세요.");
						$("#userName").focus();
						return false;
					}
				});
			});   	
			
			function idCheckFuntion()
			{	
        		var userId = $('input[name=userId]').val()
				$.post("idCheck.action", {userId : userId}, function(data)
				{
					if(data=="fail")
		            {
		            	$('#passwordCheckMessage').html(data);
		            }
		            else
		            {
		            	$('#passwordCheckMessage').html('성공!!!!');
		            }
				});
			}
			
        	function passwordCheckFunction()
        	{	
        		var userPass = $('input[name=userPass]').val();
        		var userPassConfirm = $('input[name=userPassConfirm]').val();
        		
        		if(userPass != userPassConfirm)
        		{
        			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
        		}
        		else
        		{
        			$('#passwordCheckMessage').html('');
        		}
        	};
	        
	       
        </script>        
    </head>
    <body class="bg-light">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                	<div>야 : ${message }</div>
                    <div class="container">
                    	<br><br>
                    	<div class="text-center">
							<a href="#"><img src="images/muhobby3.png" width="160px" height="180px"></a>
						</div>
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header">
                                    	<h2 class="text-center font-weight-light my-4 text-muhobby fw-bold">뮤하비 <span class="text-dark">회원가입</span></h2>
                                    </div>
                                    <div class="card-body">
                                        <form action="memberinsert.action" method="post">
                                        	<!-- 데이터임의로 넘겨주려고 넣은 인풋태그 -->
                                            
                                        	<!--
	                                        	<input type="text" id="uniq_id_num" name="uniq_id_num" placeholder="고유번호입력">
	                                            <input type="text" id="town_code" name="town_code" placeholder="지역번호입력">
                                            -->
                                        	<br>
                                            <div class="row mb-3">
                                            <span class="mb-2 text-center text-muhobby"><h4>필수 입력 정보</h4></span>
                                            <span class="mb-2 fw-bold">아이디</span>
                                                <div class="col-md-9">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userId" name="userId" type="text" onkeyup="idCheckFuntion();" placeholder="ID 입력"/>
                                                        <label for="inputFirstName">아이디 입력</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 d-grid mb-2"> 
                                                	<button type="button" id="idCheck" class="text-center btn1 btn-primary btn-block" onclick="idCheck1();" >중복 검사</button>
                                                </div>
                                                <div>
                                                	<h6 id="idCheckMessage" style="color:#198754"></h6>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="row mb-3">
                                            <span class="mb-2 fw-bold">비밀번호</span>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userPass" name="userPass" onkeyup="passwordCheckFunction();" type="password" placeholder="비밀번호" />
                                                        <label for="inputPassword">비밀번호</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-2" >
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userPassConfirm" name="userPassConfirm" onkeyup="passwordCheckFunction();" type="password" placeholder="비밀번호 재확인" />
                                                        <label for="inputPasswordConfirm">비밀번호 재확인</label>
                                                    </div>
                                                </div>
                                                <div>
                                                	<h6 class="text-danger" id="passwordCheckMessage"></h6>
                                                </div>
                                            </div>
                                            <br>
                                            
                                            <div class="row mb-3">
                                            <span class="mb-2 fw-bold">전화번호</span>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userPhone" name="userPhone" type="text" placeholder="전화번호 입력"/>
                                                        <label for="inputFirstName">전화번호 입력</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="confirmNum" name="confirmNum" type="text" placeholder="전화번호 입력" maxlength="6"/>
                                                        <label for="inputFirstName">인증번호 입력</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 d-grid">
                                                	<button type="button" class="text-center btn1 btn-primary btn-block">인증번호 발송</button>
                                                </div>
                                            </div>
                                        	<br>
                                            <div class="row mb-3">
                                            <span class="mb-2 fw-bold">닉네임</span>
                                                <div class="col-md-12">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userName" name="userName"type="text" placeholder="아이디 검수"/>
                                                        <label for="inputFirstName">닉네임 입력</label>
                                                    </div>
                                                </div>
                                            </div>

                                        	<br>
                                            <hr>
                                            <br>                                            
                                            
                                            <span class="mb-2 text-center text-muhobby"><h4>추가 입력 정보</h4></span>
                                            <div class="row mb-3">
                                            	<span class="mb-2 fw-bold">이메일</span>
                                                <div class="col-md-12">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userEmail" name="userEmail"type="text" placeholder="이메일 입력"/>
                                                        <label for="inputFirstName">E-MAIL을 입력해 주세요.</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <br>

                                            <div class="row mb-3">
                                            	<span class="mb-2 fw-bold">지역(도시)<span class="mb-2 ms-18 fw-bold">지역(구)</span></span>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <select class="form-select" aria-label="Default select example" id="userCity1" name="userCity1" onChange="cat1_change(this.value,h_area2)">
														<option>-선택-</option>
														<option value='1' selected>서울</option>
														<option value='2'>부산</option>
														<option value='3'>대구</option>
														<option value='4'>인천</option>
														<option value='5'>광주</option>
														<option value='6'>대전</option>
														<option value='7'>울산</option>
														<option value='8'>강원</option>
														<option value='9'>경기</option>
														<option value='10'>경남</option>
														<option value='11'>경북</option>
														<option value='12'>전남</option>
														<option value='13'>전북</option>
														<option value='14'>제주</option>
														<option value='15'>충남</option>
														<option value='16'>충북</option>
														</select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                    <select class="form-select" aria-label="Default select example" id="userCity2" name="userCity2">
										            	<option>-선택-</option>
														<option value='17' selected>강남구</option>
														<option value='18'>강동구</option>
														<option value='19'>강북구</option>
														<option value='20'>강서구</option>
														<option value='21'>관악구</option>
														<option value='22'>광진구</option>
														<option value='23'>구로구</option>
														<option value='24'>금천구</option>
														<option value='25'>노원구</option>
														<option value='26'>도봉구</option>
														<option value='27'>동대문구</option>
														<option value='28'>동작구</option>
														<option value='29'>마포구</option>
														<option value='30'>서대문구</option>
														<option value='31'>서초구</option>
														<option value='32'>성동구</option>
														<option value='33'>성북구</option>
														<option value='34'>송파구</option>
														<option value='35'>양천구</option>
														<option value='36'>영등포구</option>
														<option value='37'>용산구</option>
														<option value='38'>은평구</option>
														<option value='39'>종로구</option>
														<option value='40'>중구</option>
														<option value='41'>중랑구</option>
														  </select>
														<script language=javascript>
														
														 var cat1_num = new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);
														 var cat1_name = new Array('서울','부산','대구','인천','광주','대전','울산','강원','경기','경남','경북','전남','전북','제주','충남','충북');
														
														
														 var cat2_num = new Array();
														 var cat2_name = new Array();
														
														
														 cat2_num[1] = new Array(17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41);
														 cat2_name[1] = new Array('강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
														
														
														 cat2_num[2] = new Array(42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57);
														 cat2_name[2] = new Array('강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
														
														
														 cat2_num[3] = new Array(58,59,60,61,62,63,64,65);
														 cat2_name[3] = new Array('남구','달서구','동구','북구','서구','수성구','중구','달성군');
														
														
														 cat2_num[4] = new Array(66,67,68,69,70,71,72,73,74,75);
														 cat2_name[4] = new Array('계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
														
														
														 cat2_num[5] = new Array(76,77,78,79,80);
														 cat2_name[5] = new Array('광산구','남구','동구','북구','서구');
														
														
														 cat2_num[6] = new Array(81,82,83,84,85);
														 cat2_name[6] = new Array('대덕구','동구','서구','유성구','중구');
														
														
														 cat2_num[7] = new Array(86,87,88,89,90);
														 cat2_name[7] = new Array('남구','동구','북구','중구','울주군');
														
														
														 cat2_num[8] = new Array(91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108);
														 cat2_name[8] = new Array('강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','횡성군');
														
														
														 cat2_num[9] = new Array(109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148);
														 cat2_name[9] = new Array('고양시 덕양구','고양시 일산구','과천시','광명시','광주시','구리시','군포시','김포시','남양주시','동두천시','부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구','성남시 수정구','성남시 중원구','수원시 권선구','수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구','안성시','안양시 동안구','안양시 만안구','오산시','용인시','의왕시','의정부시','이천시','파주시','평택시','하남시','화성시','가평군','양주군','양평군','여주군','연천군','포천군');
														
														
														 cat2_num[10] = new Array(149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168);
														 cat2_name[10] = new Array('거제시','김해시','마산시','밀양시','사천시','양산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','의령군','창녕군','하동군','함안군','함양군','합천군');
														
														
														 cat2_num[11] = new Array(169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192);
														 cat2_name[11] = new Array('경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시','영천시','포항시 남구','포항시 북구','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
														
														
														 cat2_num[12] = new Array(193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214);
														 cat2_name[12] = new Array('광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
														
														
														 cat2_num[13] = new Array(215,216,217,218,219,220,221,222,223,224,225,226,227,228,229);
														 cat2_name[13] = new Array('군산시','김제시','남원시','익산시','전주시 덕진구','전주시 완산구','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
														
														
														 cat2_num[14] = new Array(230,231,232,233);
														 cat2_name[14] = new Array('서귀포시','제주시','남제주군','북제주군');
														
														
														 cat2_num[15] = new Array(234,235,236,237,238,239,240,241,242,243,244,245,246,247,248);
														 cat2_name[15] = new Array('공주시','논산시','보령시','서산시','아산시','천안시','금산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
														
														
														 cat2_num[16] = new Array(249,250,251,252,253,254,255,256,257,258,259,260);
														 cat2_name[16] = new Array('제천시','청주시 상당구','청주시 흥덕구','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
														
														
														 function cat1_change(key,sel){
														 if(key == '') return;
														 var name = cat2_name[key];
														 var val = cat2_num[key];
														
														 for(i=sel.length-1; i>=0; i--)
														  sel.options[i] = null;
														 sel.options[0] = new Option('-선택-','', '', 'true');
														 for(i=0; i<name.length; i++){
														  sel.options[i+1] = new Option(name[i],val[i]);
														 	}
														}
														</script>
                                                    </div>
                                                </div>
                                            </div>
                                            <br>
                                            
                                            <div class="row mb-3">
                                            	<span class="mb-2 fw-bold">관심사</span>
                                                <div class="d-grid gap-3 d-sm-flex btn-group mb-2" data-toggle="buttons">
                                                	<label class="btn btn-primary">
                                                		<input type="checkbox" name="userHobby" autocomplete="off" id="userHobby" value="피아노/건반"> 피아노/건반
                                                	</label>
                                                	<label class="btn btn-primary">
                                                		<input type="checkbox" name="hobby" autocomplete="off" value="보컬"> 보컬
                                                	</label>
                                                	<label class="btn btn-primary">
                                                		<input type="checkbox" name="hobby" autocomplete="off" value="드럼"> 드럼
                                                	</label>
                                                	<label class="btn btn-primary">
                                                		<input type="checkbox" name="hobby" autocomplete="off" value="작곡/미디"> 작곡/미디
                                                	</label>
                                                
                                                
                                                
                                                	<label class="btn btn-primary">
                                                		<input type="checkbox" name="hobby" autocomplete="off" value="기타"> 기타
                                                	</label>
                                                	<label class="btn btn-primary">
                                                		<input type="checkbox" name="hobby" autocomplete="off" value="베이스"> 베이스
                                                	</label>
                                                	<label class="btn btn-primary">
                                                		<input type="checkbox" name="hobby" autocomplete="off" value="현악기"> 현악기
                                                	</label>
                                                	<label class="btn btn-primary">
                                                		<input type="checkbox" name="hobby" autocomplete="off" value="그 외"> 그 외
                                                	</label>
                                            	</div>
											</div>
											                                        
                                            <br>
                                            <div class="row mb-3">
                                            	<div class="col-md-2">
                                                </div>
                                                <div class="col-md-4 d-grid">
                                                	<!-- <a class="text-center btn1 btn-primary btn-block" href="/sign.do">회원 가입</a> -->
                                                	<input class="text-center btn1 btn-primary btn-block" type="submit" id="submit" value="회원 가입">
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
