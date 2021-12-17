<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$("#id").blur(function() {
			alert("fdfddf");
		});
	
	});
</script>
</head>
<body>
	<input type="text" id="id"/>
	<input type="text" id="pw"/>
	<button id="btn">버튼</button>
</body>
</html>