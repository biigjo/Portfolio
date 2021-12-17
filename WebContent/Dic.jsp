<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dd.vo.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<%
	DictionaryVO d = (DictionaryVO)(request.getAttribute("dVO"));
// out.println(d);
// System.out.println("Dic.jsp ---- d : " + d);
%>
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
		<tr>
			<td colspan="2"><img src="<%=d.getFile_name()%>" style="width:600px; height:300px;"></td>
		</tr>
		<tr>
			<td> 품종 </td><td><%=d.getVariety()%></td>
		</tr>
		<tr>
			<td>크기</td><td><%=d.getWeight()%></td>
		</tr>
		<tr>
			<td>무게</td><td><%=d.getHeight()%></td>
		</tr>
		<tr>
			<td>색상</td><td><%=d.getColor()%></td>
		</tr>
		<tr>
			<td>수명</td><td><%=d.getLifespan()%></td>
		</tr>
		<tr>
			<td>내용</td><td><%=d.getContent()%></td>
		</tr>
		<tr>
			<td>원산지</td><td><%=d.getAncestry()%></td>
		</tr>
	</table>
</body>
</html>