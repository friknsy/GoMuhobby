<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뮤하비 공지사항</title>
<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;	
	}

</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	$(function()
	{
		$("#category").on('change', function()
		{
			
			if(this.value==0) // 만약 [분류별로 모아보기] 를 선택했을 경우 전체 리스트를 보여주고
			{
				
				
				$(location).attr('href','noticeboardlist.action');  
				
			}
			else //[안내][서비스점검] 등 특정 분류를 선택했다면 그 분류의 목록들만 보여준다. 
			{
				$(location).attr('href','noticecategrizedlist.action?ntc_cat_code='+this.value);
				
			}
			
			
			
		})
	})

</script>
<body>
	<div>
		<h1>뮤하비 공지사항</h1>
		<hr />
	</div>

	<div class="container">
		<div class="row">
		<select name="category" id="category" class="form-control" style="width: 20%;">
			<option value="" selected disabled hidden>==분류로 모아보세요==</option> <!-- 맨 처음 값을 가지지 않도록 하고 0(전체),1,2,3,4,5 를 선택할 시 분류대로 리스트보여지도록-->
			<option value="0">전체</option>
			<c:forEach var="list" items="${noticeCat }">
			<option value="${list.ntc_cat_code }">${list.ntc_cat_name }</option>
			</c:forEach>
		</select>
		
		<form action="noticekeywordsearch.action" method="post">
		<div class="col-lg-6 pull-right" style="">
			<div class="input-group" style="padding-bottom: 20px;">
				<input type="text" class="form-control" placeholder="찾고싶은 제목이나 내용을 검색해보세요" name="searchKeyword">
				<span class="input-group-btn">
					<button class="btn btn-default" type="submit">Go!</button>
				</span>
			</div>	
			
			<div style="padding-bottom: 50px;">
				<a href="noticeboardinsertform.action" class="btn btn-default pull-right" >공지사항 작성하기</a>
			</div>
					
			
		</div>
		</form>

			<table class="table table-hover" style="text-align: center; border: 1px solid #f3ecfd; padding-top: 30px;">
				<thead>
					<tr>
						<th style="background-color: #f3ecfd; text-align: center;">번호</th>
						<th style="background-color: #f3ecfd; text-align: center;">분류</th>
						<th style="background-color: #f3ecfd; text-align: center;">제목</th>
						<th style="background-color: #f3ecfd; text-align: center;">조회수</th>
						<th style="background-color: #f3ecfd; text-align: center;">작성일</th>
					</tr>
				</thead>

				<tbody>
				
					<c:forEach var="notice"  items="${list }">	
					<tr>
						<td>${notice.rownum }</td>
						<td>${notice.ntc_cat_name }</td>
						<td><a href="noticeselect.action?ntc_num=${notice.ntc_num}">${notice.ntc_title }</a></td> <!-- 지금 여기서 제목을 넘기면 요청url 과 함께 btc_num 넘겨줘야 하는데 그게 안된다... -->
						<td>${notice.ntc_hit }</td>
						<td>${notice.ntc_wrt_date }</td>
					</tr>
					</c:forEach>			
				</tbody>
			</table>
			

			
<!-- 			<nav class="text-center">			
			  <ul class="pagination" style="text-align: center;">
			    <li>
			      <a href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li><a href="#">1</a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li>
			      <a href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav> -->
		</div>
	</div>
	



</body>
</html>