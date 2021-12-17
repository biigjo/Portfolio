<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String contentS = request.getParameter("contentS");
	String nameS = request.getParameter("nameS");
%>
<html>
<head>
<meta charset="UTF-8">
<title>보낸 메세지</title>
<link href="css/Daeng.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<style>
	#msgR {
		background: url('Images/받은쪽지.JPG') no-repeat center/cover;
		background-attachment: fixed;
		font-family: 'Gaegu', cursive;
	}
	
	b {
		color:black;
	}
</style>
</head>
<body id="msgR">
<form action="DaengController">
	<input type="hidden" name="command" value="MsgWriteAction"/>
	<div id="msg">
		<b>보낸 메세지<img src="Images/쪽지로고.png" width="40" height="40"></b>
	</div>
		<div id="msgwbtn" style="padding:30px;">
		<b>받은 사람</b> <input name="to_name" type="text" class="form-control" value="<%=nameS%>" disabled/>
		<b>내용</b>
		<textarea name="content" class="form-control" rows="8" disabled><%=contentS%></textarea>
	</div>
	<button type="submit" style="font-size:20px;" type="button" class="btn btn-default" onclick="window.close()"><b>닫기</b></button>
</form>
</body>
</html>