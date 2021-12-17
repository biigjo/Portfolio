<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>댕댕포레스트 메인홈페이지</title>
<link href="css/Daeng.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" href="css/jquery-ui.css"/>
<script>
	$(document).ready(function(){
		$('.slider').bxSlider({
			 slideWidth: 600,
		});
		$(window).scroll(function() {
			 if($(window).scrollTop() + $(window).height() >= $(document).height()) {
			       alert("바닥을 침!");
			 }
		});
		alert("!");
	});
	
</script>
<style>
	td {
		text-align: right;
	}
	table {
		border: 1px solid black;
		border-collapse: collapse
	}
	td2 {
		width:20px; text-align:center;
	}
	.dog_land {
	background-image:url('Images/달리는강아지.gif');
	background-position:center; /* 이미지 가운데 정렬 */
	border-radius:5px; /* 모서리 둥글게 */
	border:5px solid default; /* 두께 5px 회색 테두리 */
	height:72px;
	}

	.header.hide {
	transform: translateY(-100%);
	top:-40px;
	}
</style>
</head>
<body id="body">
	<jsp:include page="HomeHeader.jsp"></jsp:include>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<div style="clear:both;"></div>
		<h1 class="f40_cy">
			댕댕 베스트 사진<img src="Images/반짝1.gif" width="100" height="60" /></h1>
	<div class="slider">
		<div><img src="Images/말티즈.PNG" /></div>
		<div><img src="Images/골든리트리버.PNG" /></div>
		<div><img src="Images/치와와.PNG" /></div>
		<div><img src="Images/시바견.PNG" /></div>
	</div>
	<div>
		<div style="margin: 0 auto; width: 485px;">
			<div id="div_bottom_1" style="float:left; overflow:hidden; height:100px; width:200px; margin-right: 80px;">	
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>
	<br/><br/><br/><br/><br/>
	<div class="dog_land" style="margin: auto; width:70%;"></div>
	<br/><br/>
<script>
	var last_top = 0;
	$(window).scroll(function() {
	  var this_top = $(this).scrollTop();
	  if( this_top > last_top ) {
	    $(".header").addClass("hide");
	  }
	  else {
	    $(".header").removeClass("hide");
	  }
		last_top = this_top;  
	});
</script>
</body>
</html>