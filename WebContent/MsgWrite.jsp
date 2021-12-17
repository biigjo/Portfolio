<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String from_name = (String) session.getAttribute("id");
	String nameR = null;
	if(request.getParameter("nameR") != null) {
		nameR = request.getParameter("nameR");
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지보내기</title>
<link href="css/Daeng.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</head>
<body id="msgbody">
<form action="DaengController">
	<input type="hidden" name="command" value="MsgWriteAction"/>
	<div id="msg">
		<b>쪽지보내기<img src="Images/쪽지로고.png" width="40" height="40"></b>
	</div>
		<div id="msgwbtn" style="padding:30px;">
		<b>보내는 사람</b> <input value="<%=from_name%>" type="text" class="form-control" disabled/>
		
		<b>받는 사람</b> <input name="to_name" type="text" class="form-control" <%if (request.getParameter("nameR") != null) { %> value="<%=nameR%>" <% } %> required/>
		<b>내용</b>
		<textarea name="content" class="form-control" rows="8" required></textarea>
	</div>
	<button type="submit" style="font-size:20px; color:gray;" class="btn btn-default">보내기</button>
</form>
</body>
</html>