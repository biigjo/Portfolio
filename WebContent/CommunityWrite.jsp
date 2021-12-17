<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String writer = (String)session.getAttribute("id");
%>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕포레스트 게시글작성</title>
<link href="css/Daeng.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</head>
<body id="body">
<jsp:include page="Header.jsp"></jsp:include>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<div style="clear:both;"></div>
	<h1 style="font-size:40px; text-align:center; color:gray">게시글 작성하기</h1>
	<form action="CommunityWrite">
	<div class="write">
	<table id="boardwrite">
		<tr>
			<td>
				<span></span><input class="form-control" id="disabledInput" value="<%=writer %>" disabled style="width: 100%; float:none; margin:0 auto;">
			</td>
			<td style=text-align:center;>
				<label for="category" style=font-size:20px;>카테고리</label>
				<select name="category" id="category" style=font-size:20px;>
				<option value="0">선택</option>	
				<option value="1">댕댕산책모임</option>	
				<option value="2">댕댕이야기방</option>	
				<option value="3">댕댕노하우방</option>	
				<option value="4">댕댕공동구매</option>	
				<option value="5">댕댕짝꿍구함</option>	
				</select><br/>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<span id="span">제목</span>
				<input type="text" name="title" class="form-control">
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<span id="span">내용</span>
				<textarea class="form-control" name="content" rows="10"></textarea>
			</td>
		</tr>
		<tr>
			<td id="file" colspan="3">
				<span>파일 업로드</span>
				<label for="exampleInputFile"></label>
    			<input type="file" name="fileName" id="exampleInputFile"><br/>
    		</td>
    	</tr>
    </table>
    </div>
    <div class="update">
	<button type="submit" class="btn btn-defalut btn-lg" style=font-size:30px;>작성하기</button>
	<button type="submit" class="btn btn-defalut btn-lg" style=font-size:30px; id="cancelBtn">취소하기</button>
	</div>
	</form>
	<%
		if(writer == null) {
	%>		<script>
				$(document).ready(function() {
					location.href='DaengController?command=CommunityAction';
				});
			</script>
	<%	}
	%>
<script>
	$("#cancelBtn").click(function(){
		location.href="CommunityAction";
	});
</script>	
</body>
</html>