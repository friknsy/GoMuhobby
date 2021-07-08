<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" import="java.util.*, java.security.*, java.io.*, java.net.*" %>
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

<%
	String charsetType = "UTF-8"; //EUC-KR 또는 UTF-8

	request.setCharacterEncoding(charsetType);
    response.setCharacterEncoding(charsetType);
    
    String action = nullcheck((String)request.getAttribute("actionval"), "");
    
    if(action.equals("go"))
    {
        String sms_url = "";
        sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS 전송요청 URL
        String user_id = base64Encode("wjdwns567"); // SMS아이디
        String secure = base64Encode("bd7001fd15dd45aea7957cca9320e8aa");//인증키
        
        String msg = base64Encode(nullcheck((String)request.getAttribute("msg"), ""));
        String rphone = base64Encode(nullcheck((String)request.getAttribute("phonenumber"), ""));
        String sphone1 = base64Encode(nullcheck((String)request.getAttribute("sphone1"), ""));
        String sphone2 = base64Encode(nullcheck((String)request.getAttribute("sphone2"), ""));
        String sphone3 = base64Encode(nullcheck((String)request.getAttribute("sphone3"), ""));
        String mode = base64Encode("1");
        
        String subject = "";

        /* String returnurl = nullcheck(request.getParameter("returnurl"), "");
        String nointeractive = nullcheck(request.getParameter("nointeractive"), ""); */
        String smsType = base64Encode(nullcheck(request.getParameter("smsType"), ""));

        String[] host_info = sms_url.split("/");
        String host = host_info[2];
        String path = "/" + host_info[3];
        int port = 80;

        // 데이터 맵핑 변수 정의
        String arrKey[]
            = new String[] {"user_id","secure","msg", "rphone","sphone1","sphone2","sphone3", "mode", "smsType", "subject"};
        
        String valKey[]= new String[arrKey.length] ;
        valKey[0] = user_id;
        valKey[1] = secure;
        valKey[2] = msg;
        valKey[3] = rphone;
        valKey[4] = sphone1;
        valKey[5] = sphone2;
        valKey[6] = sphone3;
        valKey[7] = mode;
        valKey[8] = smsType;
        valKey[9] = subject;

        String boundary = "";
        Random rnd = new Random();
        
        String rndKey = Integer.toString(rnd.nextInt(32000));
        MessageDigest md = MessageDigest.getInstance("MD5");
        
        byte[] bytData = rndKey.getBytes();
        md.update(bytData);
        byte[] digest = md.digest();
        
        for(int i =0;i<digest.length;i++)
        {
            boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
        }
        boundary = "---------------------"+boundary.substring(0,11);

        // 본문 생성
        String data = "";
        String index = "";
        String value = "";
        
        for (int i=0;i<arrKey.length; i++)
        {
            index =  arrKey[i];
            value = valKey[i];
            data +="--"+boundary+"\r\n";
            data += "Content-Disposition: form-data; name=\""+index+"\"\r\n";
            data += "\r\n"+value+"\r\n";
            data +="--"+boundary+"\r\n";
        }
		

        //out.println(data);
        InetAddress addr = InetAddress.getByName(host);
        Socket socket = new Socket(host, port);
        
        // 헤더 전송
        BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), charsetType));
        wr.write("POST "+path+" HTTP/1.0\r\n");
        wr.write("Content-Length: "+data.length()+"\r\n");
        wr.write("Content-type: multipart/form-data, boundary="+boundary+"\r\n");
        wr.write("\r\n");

        // 데이터 전송
        wr.write(data);
        wr.flush();

        // 결과값 얻기
        BufferedReader rd = new BufferedReader(new InputStreamReader(socket.getInputStream(),charsetType));
        String line;
        
        String alert = "";
        ArrayList tmpArr = new ArrayList();
        
        while ((line = rd.readLine()) != null)
        {
            tmpArr.add(line);
        }
        
        wr.close();
        rd.close();

        String tmpMsg = (String)tmpArr.get(tmpArr.size()-1);
        String[] rMsg = tmpMsg.split(",");
        
        String Result= rMsg[0]; //발송결과

        //발송결과 알림
        if(Result.equals("success")) 
        {
            alert = "[알림] 성공적으로 발송하였습니다.";
        }
        else
        {
            alert = "[Error]"+Result;
        }

        /* out.println("<script>location.href='"+ returnurl +"';</script>"); */
    }
%>

<%!
	public static String nullcheck(String str,  String Defaultvalue ) throws Exception
	{
		String ReturnDefault = "" ;
		if (str == null)
		{
			ReturnDefault =  Defaultvalue ;
		}
		else if (str == "" )
		{
			ReturnDefault =  Defaultvalue ;
		}
		else
		{
			ReturnDefault = str ;
		}
      
		return ReturnDefault ;
 	}

	public static String base64Encode(String str)  throws java.io.IOException
	{
    	sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
		byte[] strByte = str.getBytes();
    	
    	String result = encoder.encode(strByte);
    	
    	return result ;
	}

	public static String base64Decode(String str)  throws java.io.IOException
	{
    	sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
    	byte[] strByte = decoder.decodeBuffer(str);
    	String result = new String(strByte);
    	return result ;
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
        	
	        $(document).ready(function()
	        {
				$("#submit").on("click", function()
				{
					// 이메일 입력 확인
					if($("#userEmail").val()=="")
					{
						$('#EmailCheckMessage').html("이메일을 입력 해 주세요.").css("color", "#dc3545");
						$("#submit").attr("disabled", true);
					}
					
					// 이름 입력 확인
					if($("#userNickName").val()=="")
					{
						$('#NickNameCheckMessage1').html("이름을 입력 해 주세요.");
		            	$('#NickNameCheckMessage1').css("color", "#dc3545");
		            	$('#submit').attr('disabled', true);
		            	$("#userNickName").focus();
					}
					
					// 닉네임 입력 확인
					if($("#userName").val()=="")
					{
						$('#NickNameCheckMessage').html("닉네임을 입력 해 주세요.");
		            	$('#NickNameCheckMessage').css("color", "#dc3545");
		            	$('#submit').attr('disabled', true);
		            	$("#userName").focus();
					}
					
					// 인증번호 입력 확인
					if($("#confirmNum").val()=="")
					{
						$('#numCheckMessage').html("인증번호를 입력 해 주세요.").css("color", "#dc3545");
						$('#submit').attr('disabled', true);
						$("#confirmNum").focus();
					}
					
					// 전화번호 입력 확인
					if($("#userPhone").val()=="")
					{
						$('#phoneCheckMessage').html("전화번호를 입력 해 주세요.").css("color", "#dc3545");
						$('#submit').attr('disabled', true);
						$("#userPhone").focus();
					}
					
					// 비밀번호 재검사 입력 확인
					if($("#userPassConfirm").val()=="")
					{
						$('#passwordCheckMessage').html("비밀번호를 입력 해 주세요.").css("color", "#dc3545");
						$('#submit').attr('disabled', true);
						$("#userPassConfirm").focus();
					}
					
					// 비밀번호 입력 확인
					if($("#userPass").val()=="")
					{
						$('#passwordCheckMessage').html("비밀번호를 입력 해 주세요.").css("color", "#dc3545");
						$('#submit').attr('disabled', true);
						$("#userPass").focus();
					}
					
					// 아이디 입력 확인
					if($("#userId").val()=="")
					{	
						$('#idCheckMessage').html("아이디를 입력 해 주세요.");
		            	$('#idCheckMessage').css("color", "#dc3545");
		            	$('#submit').attr('disabled', true);
						$("#userId").focus();
					}
				});
			});
        
        	// 아이디 유효성 검사
			function idCheckFuntion()
			{	
        		var userId = $('input[id=userId]').val();
        		
        		var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);
        		
        		$.post("uniqId.action", {userId : userId}, function(data)
           		{	
           			$('#uniq_id_num').val(Number(data)+1);
           		});
        		
				if(!userIdCheck.test(userId))
				{
					$('#idCheckMessage').html("5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.").css("color", "#dc3545");
					$("#submit").attr("disabled", true);
				}
				
				else
				{
					$.post("idCheck.action", {userId : userId}, function(data)
					{	
						if(data=="fail")
			            {
			            	$('#idCheckMessage').html("멋진 아이디네요!");
			            	$('#idCheckMessage').css("color", "#c79cf5");
			            	$("#submit").attr("disabled", false);
			            	// 회원가입 버튼 활성화
			            }
						
			            else
			            {
			            	$('#idCheckMessage').html("이미 사용중인 아이디입니다.");
			            	$('#idCheckMessage').css("color", "#dc3545");
			            	$("#submit").attr("disabled", true);
			            }
					});
				}
			}
        	
			// 비밀번호 유효성 검사
        	function passwordCheckFunction()
        	{	
        		var userPass = $('input[id=userPass]').val();
        		
        		var userPassConfirm = $('input[id=userPassConfirm]').val();
        		
        		if(userPass != userPassConfirm)
        		{
        			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
        			$("#submit").attr("disabled", true);
        		}
        		else
        		{
        			$('#passwordCheckMessage').html('');
        			$("#submit").attr("disabled", false);
        		}
        	};
	        
        	// 전화번호 유효성 검사
        	function phoneConfirm()
			{
				var phonenum = $('input[id=userPhone]').val();
				
				/* var userPhoneCheck = /^\d{3}\d{3,4}\d{4}$/; */
				var userPhoneCheck = /^01(0|1|[6-9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
				
				if(!userPhoneCheck.test(phonenum))
				{
					$('#phoneCheckMessage').html("형식에 맞지 않는 전화번호입니다.").css("color", "#dc3545");
					$("#submit").attr("disabled", true);
				}
				else
				{
					$('#phoneCheckMessage').html("");
					$("#submit").attr("disabled", false);
				}
			}
        	
        	// 인증 번호 발송
        	$(document).ready(function()
        	{
				$("#numbersend").on("click", function()
				{	
					var actionval = $('input[id=action]').val();
					var phonenumber = $('input[id=userPhone]').val();
					var sphone1 = $('input[id=sphone1]').val();
	        		var sphone2 = $('input[id=sphone2]').val();
	        		var sphone3 = $('input[id=sphone3]').val();
	        		var msg = $("#msg").val();
	        		
	        		$.post("numbercheck.action", {actionval: actionval, phonenumber : phonenumber, sphone1 : sphone1, sphone2 : sphone2, sphone3 : sphone3, msg : msg}, function(data)
	        		{
	        			
	        		});
				});
			});
        	
        	// 인증번호 유효성 검사
        	function authnumberCheck()
			{	
        		var confirmNum1 = $('input[id=confirmNum]').val();
        		var msg = $("#msg").val();
        		
        		var confirmNum2 = msg.replace(/[^0-9]/g,'');
				
        		if(confirmNum1!=confirmNum2)
				{
					$('#numCheckMessage').html("인증번호를 확인 해 주세요.").css("color", "#dc3545");
					$("#submit").attr("disabled", true);
				}
				else
				{
					$('#numCheckMessage').html("");
					$("#submit").attr("disabled", false);
					$("#confirmNum").attr("disabled", true);
					$("#numbersend").attr("disabled", true);
				}
			}
        	
        	// 닉네임 유효성 검사
        	function NickNameCheckFuntion()
			{	
        		var nickName = $('input[id=userName]').val();
        		
				$.post("nickNameCheck.action", {nickName1 : nickName}, function(data)
				{
					if(data=="fail")
		            {
		            	$('#NickNameCheckMessage').html("맛깔나는 닉네임이네요!");
		            	$('#NickNameCheckMessage').css("color", "#c79cf5");
		            	$("#submit").attr("disabled", false);
		            	// 회원가입 버튼 활성화
		            }
					
		            else
		            {
		            	$('#NickNameCheckMessage').html("이미 사용중인 닉네임입니다.");
		            	$('#NickNameCheckMessage').css("color", "#dc3545");
		            	$("#submit").attr("disabled", true);
		            }
				});
			}
        	
        	// 이름 유효성 검사
        	function NameCheckFuntion()
			{
        		var userNickName = $('input[id=userNickName]').val();
        		var nameCheck = /^[가-힣]+$/;
        		
        		if(!nameCheck.test(userNickName))
				{
        			$('#NickNameCheckMessage1').html("올바른 이름 형식이 아닙니다.");
	            	$('#NickNameCheckMessage1').css("color", "#dc3545");
	            	$('#submit').attr('disabled', true);
				}
				else
				{
					$('#NickNameCheckMessage1').html("");
					$("#submit").attr("disabled", false);
				}
			}
        	
        	// 이메일 유효성 검사
        	function EmailCheckFuntion()
			{	
        		var userEmail = $('input[id=userEmail]').val();
        		var emailCHeck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				
        		if(!emailCHeck.test(userEmail))
				{
					$('#EmailCheckMessage').html("올바른 이메일 형식이 아닙니다.").css("color", "#dc3545");
					$("#submit").attr("disabled", true);
				}
        		
        		else
        		{
					$.post("emailCheck.action", {userEmail : userEmail}, function(data)
					{
						if(data=="fail")
			            {
			            	$('#EmailCheckMessage').html("사용 가능한 이메일이네요!");
			            	$('#EmailCheckMessage').css("color", "#c79cf5");
			            	$("#submit").attr("disabled", false);
			            	// 회원가입 버튼 활성화
			            }
						
			            else
			            {
			            	$('#EmailCheckMessage').html("이미 사용중인 이메일입니다.");
			            	$('#EmailCheckMessage').css("color", "#dc3545");
			            	$("#submit").attr("disabled", true);
			            }
					});
        		}
			}
        	
        	// 지역 선택
        	function cityselect()
        	{
        		var userCity = $("#userCity2 option").index($("#userCity2 option:selected"));

        		$('#town_code').val(Number(userCity)+1);
        	}
        	
        </script>        
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
                                    	<h2 class="text-center font-weight-light my-4 text-muhobby fw-bold">뮤하비 <span class="text-dark">회원가입</span></h2>
                                    </div>
                                    <div class="card-body">
                                        <form action="register.action" method="post">
                                        	<!-- 데이터임의로 넘겨주려고 넣은 인풋태그 -->
                                        	
	                                        <input type="hidden" id="uniq_id_num" name="uniq_id_num" placeholder="고유번호입력">
												                                        
	                                        <input type="hidden" id="town_code" name="town_code" placeholder="지역번호입력" value="1">
                                            
                                        	<br>
                                            <div class="row mb-3">
                                            <span class="mb-2 text-center text-muhobby"><h4>필수 입력 정보</h4></span>
                                            <span class="mb-2 fw-bold">아이디</span>
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userId" name="u_id" type="text" onkeyup="idCheckFuntion();" placeholder="ID 입력" maxlength="20"/>
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
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userPass" name="u_pwd" onkeyup="passwordCheckFunction();" type="password" placeholder="비밀번호" maxlength="32"/>
                                                        <label for="inputPassword">비밀번호</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-2" >
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userPassConfirm" onkeyup="passwordCheckFunction();" type="password" placeholder="비밀번호 재확인" maxlength="32"/>
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
                                                        <input class="form-control" id="userPhone" name="u_tel" type="text" placeholder="전화번호 입력" maxlength="11" onkeyup="phoneConfirm();"/>
                                                        <label for="inputFirstName">전화번호 입력</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="confirmNum" type="text" onkeyup="authnumberCheck();" placeholder="인증번호 입력" maxlength="6"/>
                                                        <label for="inputFirstName">인증번호 입력</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 d-grid mb-2">
                                                	<button type="button" class="text-center btn1 btn-primary btn-block" id="numbersend" name="numbersend">인증번호 발송</button>
                                                </div>
                                                <div>
                                                	<h6 class="text-danger" id="phoneCheckMessage"></h6>
                                                </div>
                                                <div>
                                                	<h6 class="text-danger" id="numCheckMessage"></h6>
                                                </div>
                                            </div>
                                        	<br>
                                            <div class="row mb-3">
                                            <span class="mb-2 fw-bold">닉네임</span>
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userName" name="user_nickname" onkeyup="NickNameCheckFuntion();" type="text" placeholder="닉네임" maxlength="15"/>
                                                        <label for="inputFirstName">닉네임 입력</label>
                                                    </div>
                                                </div>
                                                <div>
                                                	<h6 id="NickNameCheckMessage"></h6>
                                                </div>
                                            </div>
								
                                        	<br>
                                        	
                                        	<!-- 오라클 데이터 타입이 충분하지가 않아서 4글자만 입력해도 
                                        	     value too large for column 오류가 발생했음.
                                        	     일단은 maxlength 를 3으로 줘서 오류 발생 방지함.
                                             -->
                                        	
                                        	<div class="row mb-3">
                                            	<span class="mb-2 fw-bold">이름</span>
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userNickName" name="u_name" type="text" onkeyup="NameCheckFuntion();" placeholder="실명 입력" maxlength="8"/>
                                                        <label for="inputFirstName">실명 입력</label>
                                                    </div>
                                                </div>
                                                <div>
                                                	<h6 id="NickNameCheckMessage1"></h6>
                                                </div>
                                            </div>
                                        	<br>
                                            <hr>
                                            <br>                                            
                                            <span class="mb-2 text-center text-muhobby"><h4>추가 입력 정보</h4></span>
                                            <div class="row mb-3">
                                            	<span class="mb-2 fw-bold">이메일</span>
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userEmail" name="u_email" onkeyup="EmailCheckFuntion();" type="text" placeholder="이메일 입력" maxlength="50"/>
                                                        <label for="inputFirstName">E-MAIL 입력</label>
                                                    </div>
                                                </div>
                                                <div>
                                                	<h6 id="EmailCheckMessage"></h6>
                                                </div>
                                            </div>
                                            
                                            <br>
                                            
                                            <div class="row mb-3">
                                            	<span class="mb-2 fw-bold">지역(도시)<span class="mb-2 ms-18 fw-bold">지역(구)</span></span>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <select class="form-select" aria-label="Default select example" id="userCity1">
														<option value='1' selected>서울</option>
														</select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                    <select class="form-select" aria-label="Default select example" id="userCity2" onchange="cityselect()">
																<option value='1' selected>강남구</option>
																<option value='2'>강동구</option>
																<option value='3'>강북구</option>
																<option value='4'>강서구</option>
																<option value='5'>관악구</option>
																<option value='6'>광진구</option>
																<option value='7'>구로구</option>
																<option value='8'>금천구</option>
																<option value='9'>노원구</option>
																<option value='10'>도봉구</option>
																<option value='11'>동대문구</option>
																<option value='12'>동작구</option>
																<option value='13'>마포구</option>
																<option value='14'>서대문구</option>
																<option value='15'>서초구</option>
																<option value='16'>성동구</option>
																<option value='17'>성북구</option>
																<option value='18'>송파구</option>
																<option value='19'>양천구</option>
																<option value='20'>영등포구</option>
																<option value='21'>용산구</option>
																<option value='22'>은평구</option>
																<option value='23'>종로구</option>
																<option value='24'>중구</option>
																<option value='25'>중랑구</option>
														  </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <br>
                                            
                                            <div class="row mb-3">
                                            	<span class="mb-2 fw-bold">관심사</span>
                                                
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
                                                	<a class="text-center btn1 btn-primary btn-block" href="mainpage.action">취소</a>
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
            
            <form method="post" name="smsForm" action="numbercheck.action">
				<input type="hidden" id="action" name="action" value="go"> 
				<textarea id="msg" name="msg" cols="30" rows="10" style="display:none;">[뮤하비] 본인 확인 인증번호 [<%String imsinum = getrndnum(6); out.print(imsinum);%>]\n를 입력해 주세요.</textarea>
				<br>
				<input type="hidden" name="rphone" value="" placeholder="전화번호 입력" >
				<input type="hidden" id="sphone1" name="sphone1" value="010"> 
				<input type="hidden" id="sphone2" name="sphone2" value="4020">
				<input type="hidden" id="sphone3" name="sphone3" value="7429">
				<input type="submit" value="전송" style="display:none;"> 
			</form>
            <br><br>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
