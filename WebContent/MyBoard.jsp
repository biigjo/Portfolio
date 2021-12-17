<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.dd.vo.*"%>
<!DOCTYPE html>
<%
	ArrayList<CommunityVo>list = (ArrayList<CommunityVo>)(request.getAttribute("list"));
	String id = null;
	if(session.getAttribute("id")!= null) {
		id = (String)session.getAttribute("id");
	}
	
	int pageNo = (int)request.getAttribute("pageNo");
	int pageStart = (int)request.getAttribute("pageStart");
	int pageEnd = (int)request.getAttribute("pageEnd");
	int pageTotal = (int)request.getAttribute("pageTotal");
%>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕포레스트 마이페이지</title>
<link href="css/Daeng.css" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<style>
	a:link { color: black; text-decoration: none;} /* 기본 색 */
	a:visited { color: black; text-decoration: none;}  /* 한번 선택했던 색 */
	a:hover { color: black; text-decoration: underline;} /* 마우스 이동시 색 */
</style>
</head>
<body id="body">
<jsp:include page="MyHeader.jsp"></jsp:include>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<div style="clear:both;"></div>
	<h1 id="lojotitle">내가 쓴 글</h1>
	<div id="Myboard" style="width: 50%; text-align: center; margin:auto;">
		<table id="board" class="table table-hover">
				<tr>
					<th>글번호</th>
					<th>분류</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회</th>
				</tr>
			<%
				for(CommunityVo c : list) {
			%>
				<tr>
					<td><%=c.getBno()%></td>
					<td><%=c.getCategory()%></td>
					<td style="text-align:left;"><a href="BoardView?bno=<%=c.getBno()%>"><%=c.getTitle()%></a></td>
					<td><%=session.getAttribute("id")%></td>
					<td><%=c.getDate()%></td>
					<td><%=c.getHitcount()%></td>
				</tr>
			<%
				}
			%>
		</table>
	</div>
	<div style="text-align: center; font-size: 20px;">
		<%
			if(pageStart != 1) {
		%>
			<a href="MyBoardServlet?page=<%=pageStart-1%>">이전</a>
		<%
			}
		%>
		<%
			for(int i = pageStart; i <= pageEnd; i++) {
				if(i>pageTotal) break;
		%>
			<a href="MyBoardServlet?page=<%=i%>"><%=i%></a>
		<%
			}
		%>
		<%
			if(pageEnd < pageTotal) {
		%>
			<a href="MyBoardServlet?page=<%=pageEnd+1%>">다음</a>
		<%
			}
		%>
	</div>
</body>
</html>