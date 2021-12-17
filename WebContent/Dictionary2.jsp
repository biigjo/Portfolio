<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dd.vo.*"%>
<!DOCTYPE html>
<%
	ArrayList<DictionaryVO> list = (ArrayList<DictionaryVO>)(request.getAttribute("list"));
%>
<%!
	String toStringShort(String s) {
		if(s.length() > 100) {
			s = s.substring(0, 99) + ". . . ";
		}
		return s;
	}
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>댕댕포레스트 댕댕사전</title>
<link href="css/Daeng.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body id="body">
	<button onclick="popUp();">클릭</button>
<script type="text/javascript">
function popUp() {
	// 파일, 이름, 옵션
	window.open("Dic.jsp", "", "width=300px, height=300px");
}
</script>
</body>
</html>