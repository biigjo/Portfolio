<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dd.vo.*"%>
<!DOCTYPE html>
<%
	String contentR = request.getParameter("contentR");
	String nameR = null;
	if(request.getParameter("nameR") != null) {
		nameR = request.getParameter("nameR");
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>받은 메세지</title>
<link href="css/Daeng.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<style>
	#msgR {
		background: url('Images/받은쪽지.JPG') no-repeat center/cover;
		background-attachment: fixed;
		font-family: 'Gaegu', cursive;
	}
	
	b {
		color:black;
	}
	a:link { color: black; text-decoration: none;} /* 기본 색 */
	a:visited { color: black; text-decoration: none;}  /* 한번 선택했던 색 */
	a:hover { color: black; text-decoration: underline;} /* 마우스 이동시 색 */
</style>
<script language="javascript">
	function showMessage(){
		var nameR = $("#nameR").val();
		window.open("MsgWrite.jsp?nameR="+nameR,"","width=500, height=530, left=700, top=50");
		}
</script>
</head>
<body id="msgR">
	<input type="hidden" name="command" value="MsgWriteAction"/>
	<div id="msg">
		<b>받은 메세지<img src="Images/쪽지로고.png" width="40" height="40"></b>	<!-- to_name -->
	</div>
		<div id="msgwbtn" style="padding:30px;">
		<b>보낸 사람</b> <input id="nameR" name="from_name" type="text" class="form-control" value="<%=nameR%>" disabled/>
		<b>내용</b>
		<textarea name="content" class="form-control" rows="8" disabled><%=contentR%></textarea>
	</div>
	<button type="submit" style="font-size:20px;" class="btn btn-default" onclick="showMessage()"><b>답장하기</b></button>
</body>
</html>