<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>댕댕포레스트 댕댕이자랑방</title>
<link href="css/Daeng.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	<script src="js/jquery-3.6.0.min.js"></script>
</head>
<style>
	#a {
		width:330px;
		height:470px;
		border:1px solid gray;
		float:left;
		margin-left:3%;
		margin: 0 auto;
		position: relative;
		z-index: 1;
		margin:15px;
	}
	
	#a1 {
		width:250px;
		height:380px;
	}
	
	b {
		font-size:16px;
		color:gray;
	}

	#date {
		font-size:13px;
	}
	
	#all1 {
		margin-left:21%;
		height:550px;
		margin: auto;
    	width: 1080px;
	}
	
	#all2 {
		margin-left:21%;
		margin: auto;
    	width: 1080px;
	}
	
	#img {
		width:300px; 
		height:330px;
		margin-left:16px;
	}
	
	#text {
		margin-left:16px;
	}
	
	h3 {
		margin-left:16px;
	}

	#a::after  { /*게시판 전체*/
	width: 100%;
	height: 100%;
	content: "";
	background: #ebe8e2;
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
	opacity: 0.5;
}
</style>
<body id="body">
	<jsp:include page="Header.jsp"></jsp:include>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<div style="clear:both;"></div>
		<h1 class="f40_cs">댕댕이자랑방<img src="Images/자랑메인.png" width="100" height="60"/></h1>
		<br/><br/><br/>
	<div id="all1">
		<div id="a">
			<h3>biigjo</h3>
			<div id="a1">
			<img id="img" src="Images/귀여운4.PNG">
			<div id="text">
				<b>제목: 댕댕이 인사해여</b>
				<div id="date">21.07.15</div>
			</div>
			</div>
		</div>
		<div id="a">
			<h3>abc123</h3>
			<div id="a1">
			<img id="img" src="Images/귀여운1.PNG">
			<div id="text">
				<b>제목: 귀여운 두마리 멍멍</b>
				<div id="date">21.07.15</div>
			</div>
			</div>
		</div>
		<div id="a">
			<h3>def456</h3>
			<div id="a1">
			<img id="img" src="Images/귀여운2.PNG">
			<div id="text">
				<b>제목: 헤헤</b>
				<div id="date">21.07.15</div>
			</div>
			</div>
		</div>
		</div>
	<div id="all2">
		<div id="a">
			<h3>biigjo</h3>
			<div id="a1">
			<img id="img" src="Images/귀여운4.PNG">
			<div id="text">
				<b>제목: 댕댕이 인사해여</b>
				<div id="date">21.07.15</div>
			</div>
			</div>
		</div>
		<div id="a">
			<h3>abc123</h3>
			<div id="a1">
			<img id="img" src="Images/귀여운1.PNG">
			<div id="text">
				<b>제목: 귀여운 두마리 멍멍</b>
				<div id="date">21.07.15</div>
			</div>
			</div>
		</div>
		<div id="a">
			<h3>def456</h3>
			<div id="a1">
			<img id="img" src="Images/귀여운2.PNG">
			<div id="text">
				<b>제목: 헤헤</b>
				<div id="date">21.07.15</div>
			</div>
			</div>
		</div>
	</div>
</body>
</html>