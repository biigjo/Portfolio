<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.dd.vo.*" %>

<!DOCTYPE html>
<%
	ArrayList<CommunityVo> list = (ArrayList<CommunityVo>)(request.getAttribute("clist"));

	String name = null;
	for(CommunityVo vo : list) {
		name = vo.getCategory();
	}
	String writer = (String)session.getAttribute("id");
	
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>댕댕포레스트 댕댕커뮤니티</title>
<link href="css/Daeng.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="css/jquery-ui.css"/>
<style>
 a:link { color: black; text-decoration: none;} /* 기본 색 */
 a:visited { color: black; text-decoration: none;}  /* 한번 선택했던 색 */
 a:hover { color: black; text-decoration: underline;} /* 마우스 이동시 색 */
	
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
						location.href = "CommunityWrite.jsp";
					} else {
						alert('로그인 해주세요.');
						location.href = "Login.jsp?type=CommunityWrite.jsp";
					}
				},
				error: function(data){}
			})
		});
	});
</script>
</head>
<body id="body">
	<jsp:include page="Header.jsp"></jsp:include>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<div style="clear:both;"></div>
		<h1 class="f40_cb">댕댕커뮤니티<img src="Images/커뮤니티메인.png" width="100" height="60"/></h1>
		<div class="menu">
     	 <button type="submit" class="btn btn-defalut btn-lg" onclick="location.href='DaengController?command=CommunityAction'">전체보기</button> &nbsp; 
		 
				<button type="submit" class="btn btn-defalut btn-lg" onclick="location.href='DaengController?command=CommunityAction&ctgr=1'">댕댕산책모임</button> &nbsp; 
			    <button type="submit" class="btn btn-defalut btn-lg" onclick="location.href='DaengController?command=CommunityAction&ctgr=2'">댕댕이야기방</button> &nbsp; 
			    <button type="submit" class="btn btn-defalut btn-lg" onclick="location.href='DaengController?command=CommunityAction&ctgr=3'">댕댕노하우방</button> &nbsp; 
			    <button type="submit" class="btn btn-defalut btn-lg" onclick="location.href='DaengController?command=CommunityAction&ctgr=4'">댕댕공동구매</button> &nbsp; 
			    <button type="submit" class="btn btn-defalut btn-lg" onclick="location.href='DaengController?command=CommunityAction&ctgr=5'">댕댕짝꿍구함</button> &nbsp; 
				
 	  </div>
		<br/>
	<div id="write1">
		<div id="write">
			<button type="submit" class="btn btn-defalut btn-lg" id="btn_write" style="font-size:25px;">글쓰기</button>
		</div>
		
		<table id="board" class="table table-hover">
			<thead>
				<tr>
					<th>글번호</th>
					<th style="width:162px;">분류</th>
					<th style="width:635px;">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회</th>
				</tr>
				</thead>
				<% 
				for(CommunityVo vo : list) {
				%>
				<tbody>
				<tr>
					<td><%=vo.getBno()%></td>
					<td><%=vo.getCategory()%></td>
					<td style="text-align:left;"><a href="BoardView?bno=<%=vo.getBno()%>"><%=vo.getTitle()%></a></td>
					<td><%=vo.getWriter()%></td>
					<td><%=vo.getDate() %></td>
					<td><%=vo.getHitcount() %></td>
				</tr>
				</tbody>
				<% 
				}
				%>
	</table>
	
	</div>
		<br/>
		<div class="list">
		<%--
		for(int i=pageNo; i<=pageTotal; i++) {
			if(i==pageNext) {
			<a href="Community.jsp?page=<%=i%>">다음페이지</a>
		<% 	}
		%>
			<a href="Community.jsp?page=<%=i%>"><%=i%></a>
		<%	
		}
		%> --%>
			<jsp:include page="Pagenagion.jsp"></jsp:include>
		
	</div>
	<form action="SearchServlet">
	<div style="text-align:center;">
		<select style="text-align-last: center;" name="selectop">
			<option value="1">제목</option>
			<option value="2">제목+내용</option>
			<option value="3">작성자</option>
		</select>
		<input type="text" id="dj" name="search"/><input type="submit" value="검색" style="margin-left:4px;"/>
	</div>
	</form>
	<br/>
</body>
</html>
