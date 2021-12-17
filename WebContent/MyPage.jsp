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
	<div style="margin:auto; width:80%; height:400px;">   <!-- width:80%;  -->
			<h1 style="font-size:50px; text-align:center; color:gray" id="btn_Mypage">마이페이지</h1>
			<div id="idmenu" style="width:200px; margin-top:30px; float:left;">
				<div style="margin-top:15px; margin-left:15px;"><br/>
				<div><button onclick="location.href='MyBoardServlet'" style="font-size:20px; background-color:#fefefe;">내가 쓴 글</button></div><br/>
				<div><button onclick="location.href='MemberInfo'" style="font-size:20px; background-color:#fefefe;">회원 정보 수정</button></div>
				</div>
			</div>
			<div style="float:left; border:1px solid rgba(0, 0, 0, 0.5); width:63%; height:110%; margin-left:60px;">
				<img src="Images/택배견경태.png" style="width:859px; height:438px;"/>
			</div>
		</div>
</body>
</html>