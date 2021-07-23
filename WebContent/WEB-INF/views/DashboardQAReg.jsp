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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>뮤하비 관리자</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <script type="text/javascript">
    
    	function goToDetail(qa_forum_code)
		{
    		window.open("qa_forumread.action?qa_forum_code="+qa_forum_code, "게시물자세히보기", "width=400, height=300, left=100, top=50"); 
    		/* 요청 url 에서 /namepopup.action 이라고 『/』를 앞에 붙여주면 경로를 찾지 못한다. 요청url 에는  /를 붙여주지 않는다!! 주의!! */
		}
    	
    	
    	// 신고처리하기 버튼을 클릭했을 시
    	function processing(qa_report_reg_code)
		{
    		window.open("reportpopupopen.action?qa_report_reg_code="+qa_report_reg_code, "신고처리", "width=400, height=300, left=100, top=50"); 
		}
    
    </script>

</head>

<body>
            <!-- Main Content -->
 


                <!-- /.container-fluid -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">QnA 포럼 신고가 접수되었어요!</h1>
                    
                    <p class="mb-4">어떤 뮤하비가 이상한 질문을 했나봐요...신고처리 해주세요 관리자님! <a target="_blank"
                            href="#">어딘가로 바로가기</a>.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">QnA 신고 접수(신고처리 후 새로고침 해주세요!)</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>게시물제목</th>
                                            <th>신고사유</th>
                                            <th>신고자</th>
                                            <th>신고일자</th>
                                            <th>처리상태</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>번호</th>
                                            <th>게시물제목</th>
                                            <th>신고사유</th>
                                            <th>신고자</th>
                                            <th>신고일자</th>
                                            <th>처리상태</th>
                                            <th></th>
                                        </tr>

                                    </tfoot>
                                    <tbody>
                                     	<c:forEach var="qaReport" items="${qaReportList }">
                                        <tr>
                                            <th>${qaReport.rnum}</th>   
                                            <th><a href="#" onclick="goToDetail(${qaReport.qa_forum_code})">${qaReport.qa_forum_title}</a></th>
                                            <th>${qaReport.report_cat_content}</th>
                                            <th>${qaReport.user_nickname}</th>
                                            <th>${qaReport.qa_report_reg_date}</th>
                                            <th>${qaReport.proc_check}</th>
                                            <th><button onclick="processing(${qaReport.qa_report_reg_code})">신고처리하기</button></th>
                                            
                                        </tr>
                                        </c:forEach> 
                                        
   
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
                
                


            <!-- End of Main Content -->
</body>

</html>