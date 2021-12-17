<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕포레스트 마이페이지</title>
<link href="css/Daeng.css" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body id="body">
<jsp:include page="MyHeader.jsp"></jsp:include>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<div style="clear:both;"></div>
	<h1 id="lojotitle">내가 쓴 댓글</h1>
	<div id="Myboard" style="width: 50%; text-align: center; margin:auto;">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>작성자</th>
					<th>작성일</th>
					<th>댓글내용</th>
					<th>원문 제목</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>댓글쓴이</td>
					<td>2021.06.14</td>
					<td>저요~~</td>
					<td><button type="submit" class="btn btn-defalut btn-lg">댕댕이 산책 같이가실분 있나요~~?</button></td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td>댓글쓴이</td>
					<td>2021.06.14</td>
					<td>네</td>
					<td>댕댕모임~~</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td>댓글쓴이</td>
					<td>2021.06.14</td>
					<td>안녕YG</td>
					<td>댕댕이야기</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>