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
<script>
	$(function() {
		$(".myBtn").click(function() {
			//alert($(this).parent().parent().parent().children("tr").eq(1).children("td.variety").text());		
			var variety = $(this).parent().parent().parent().children("tr").eq(1).children("td.variety").text();	// 제이쿼리는 버튼 id값 말고 class로 해야 내용 다 나옴
			window.open("DicAction?variety="+encodeURI(variety), "", "width=800px, height=750px");
		});
	});
</script>
</head>
<body id="body">
	<jsp:include page="Header.jsp"></jsp:include>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<div style="clear:both;"></div>
		<h1 class="f40_cp1">댕댕 사전<img src="Images/사전메인.png" width="100" height="60"/></h1>
	<br/><br/><br/>
	<div class="alltable">
			
			<%
				for(DictionaryVO d : list) {
				
			%>
	<div class="table1">
		<table class="dictable">
			<tr>
				<td colspan="2" style="background: url('<%=d.getFile_name()%>') no-repeat center/cover; height: 190px;"></td>
			</tr>
			<tr>
				<td>품종</td>
				<td class="variety"><%=d.getVariety()%></td>
			</tr>
			<tr>
				<td>원산지</td>
				<td><%=d.getAncestry()%></td>
			</tr>
			<tr>
				<td>내용</td>
				<td class="line2">
				<%=toStringShort(d.getContent())%>
				<button class="myBtn" type="submit" class="btn btn-defalut btn-sm">
					<img src="Images/더보기버튼.png" width="30" height="30">
				</button>
			</td>
			</tr>
		</table>
	</div>
			<%
				}
			%>
	<div style="clear:both;"></div>
</div>
</body>
</html>