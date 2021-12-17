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
			 slideWidth: 500,
		});

		$("#btn_more1").mouseenter(function() {
			$(this).stop();
			$(this).animate({backgroundColor:'#e36259'},250);
		}).mouseleave(function() {
			$(this).stop();
			$(this).animate({backgroundColor:'rgb(239, 239, 239)'},250);
		});

/* 		$(window).scroll(function() {
		   if($(window).scrollTop() + $(window).height() <= $(document).height()) {
		       //alert("바닥을 침!");
		       $("#div_bottom_1").animate({height:'340px'},1000);
		       $("#div_bottom_2").animate({height:'340px'},1000);
		   }
		}); */
 		setInterval(function(){
			$('.dog_land').css({ 'background-position' : '-=2' });
		}, 20); 
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
	
	#setting {
		margin:auto;
		width:1080px;
		height:100%;
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
		<div><img src="Images/귀여운1.PNG" style="width:500px; height:500px;"/></div>
		<div><img src="Images/귀여운2.PNG" style="width:500px; height:500px;"/></div>
		<div><img src="Images/귀여운4.PNG" style="width:500px; height:500px;" /></div>
		<div><img src="Images/귀여운5.PNG" style="width:500px; height:500px;" /></div>
		<div><img src="Images/귀여운6.PNG" style="width:500px; height:500px;" /></div>
		<div><img src="Images/귀여운7.PNG" style="width:500px; height:500px;" /></div>
	</div>
	<div id="setting">
		
	</div>
		<div style="clear:both;"></div>
	<br/><br/><br/><br/><br/>
	<div class="dog_land" style="margin: auto; width:70%;"></div>
	<br/><br/>
	<script>
		$(document).ready(function() {
		       var pageNo = 1;
		   	       $.ajax({
		   	    	   type: "get",
		   	    	   url: "MuhanServlet",
		   	    	   data: {"pageNo":pageNo},
		   	    	   datatype: "JSON",
		   	    	   success: function(data) {
		   	    		  for(var i = 0; i<=data.list.length-1; i++){
		   	    			  var aa = data.list[i];
		   	    			  var str = "";
		   					  str += "<div id='all1'>";
		   					  str += "<div id='a'>";
		   	    			  str += "<h3>"+aa.writer+"</h3>";
		   	    			  str += "<div id='a1'>";
		   	    			  str += "<a href='BoardView?bno="+aa.bno+"'><img id='img' src='Images/"+aa.fileName+"'></a>";
		   	    			  str += "<div id='text'>";
		   	    			  str += "<b>제목:"+aa.title+"</b>";
		   	    			  str += "<div id='date'>"+aa.date+"</div></div></div></div></div>";
		   	    			  $("#setting").append(str);
		   	    		  }
		   	    	  },
		   	    	  error: function(request, status, error) { alert("ERR."); }
		   	   });
		   		$(window).scroll(function() {
		   		   if($(window).scrollTop() + $(window).height() >= $(document).height()) {
		   			   pageNo++;
		   		       $.ajax({
		   		    	   type: "get",
		   		    	   url: "MuhanServlet",
		   		    	   data: {"pageNo":pageNo},
		   		    	   datatype: "JSON",
		   		    	   success: function(data) {
		   		    		  for(var i = 0; i<=data.list.length-1; i++){
		   		    			  var aa = data.list[i];
		   		    			  var str = "";
		   						  str += "<div id='all1'>";
		   						  str += "<div id='a'>";
		   		    			  str += "<h3>"+aa.writer+"</h3>";
		   		    			  str += "<div id='a1'>";
		   		    			  str += "<a href='BoardView?bno="+aa.bno+"'><img id='img' src='Images/"+aa.fileName+"'></a>";
		   		    			  str += "<div id='text'>";
		   		    			  str += "<b>제목:"+aa.title+"</b>";
		   		    			  str += "<div id='date'>"+aa.date+"</div></div></div></div></div>";
		   		    			  $("#setting").append(str);
		   		    		  }
		   		    	   },
		   		    	   error: function(request, status, error) { alert("ERR."); }
		   		      });
		   		   }
		   	 });     
		});
	</script>
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