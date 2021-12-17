<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dd.vo.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<%
	ArrayList<CommunityVo>Alist = (ArrayList<CommunityVo>)request.getAttribute("Alist");
%>
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
<script>
	$(function() {
		$("#btn_write").click(function(){
			$.ajax({
				type: "post",
				url: "SessionCheck",
				dataType: "text",
				success: function(data){
					if(data == 1) {
						location.href = "BoardPicWrite.jsp";
					} else {
						alert('로그인 해주세요.');
						location.href = "Login.jsp";
					}
				},
				error: function(data){}
			})
		});
	});
</script>
<body id="body">
	<jsp:include page="Header.jsp"></jsp:include>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<div style="clear:both;"></div>
		<h1 class="f40_cs">댕댕이자랑방<img src="Images/자랑메인.png" width="100" height="60"/></h1>
		<div style="margin-left:75%;">
			<button type="submit" class="btn btn-defalut btn-lg" id="btn_write" style="font-size:25px;">글쓰기</button>
		</div>
	<div id="setting">
 	<%
		for(CommunityVo c : Alist) {
	%>
	<div id="all1">
		<div id="a">
			<h3><%=c.getWriter()%></h3>
			<div id="a1">
			<a href="BoardView?bno=<%=c.getBno()%>"><img id="img" src="Images/<%=c.getFileName()%>"></a>
			<div id="text">
				<b>제목: <%=c.getTitle()%></b>
				<div id="date"><%=c.getDate()%></div>
			</div>
			</div>
		</div>
	</div>
	<%
		}
	%> 
	</div>
<script>
$(document).ready (function(){
	       var pageNo = 1;
		
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
</body>
</html>