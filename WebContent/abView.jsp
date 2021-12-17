<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dd.vo.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕사전 자세히 보기</title>
<style>
	table {
		border-collapse:collapse;
	}
	
	table, th, td {
		border:1px solid gray;
	}
	
	th, td {
		padding:10px;
	}
</style>
</head>
<body>
	<table>
<!-- 		<tr>
			<td colspan="2">사진</td>
		</tr>
 -->		
 		<script>
		kind = "";   // 품종
		gender = ""; // 성별
		kind = window.kindGender.split("/")[0];
		gender = window.kindGender.split("/")[1];
		
		
		str = "";
		str += "<tr><td colspan='2'><img style='width:450px; height:350px;' src='"+window.profile+"'/></td></tr>";
		str += "<tr><td>공고번호</td><td>"+window.noticeNo+"</td></tr>";
		str += "<tr><td>품종</td><td>"+kind+"</td></tr>";
		str += "<tr><td>나이</td><td>"+window.age+"</td></tr>";
		str += "<tr><td>체중</td><td>"+window.weight+"</td></tr>";
		str += "<tr><td>성별</td><td>"+gender+"</td></tr>";
		str += "<tr><td>발견장소</td><td>"+window.happenPlace+"</td></tr>";
		str += "<tr><td>발견날짜</td><td>"+window.happenDt+"</td></tr>";
		document.write(str);	
		</script>
	</table>
</body>
</html>