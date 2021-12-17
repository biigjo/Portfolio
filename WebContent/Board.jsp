<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.dd.vo.*" %>
<!DOCTYPE html>
<%
	ArrayList<CommunityVo> list = (ArrayList<CommunityVo>)(request.getAttribute("inList"));
	ArrayList<CommentVo> list2 = (ArrayList<CommentVo>)(request.getAttribute("rList"));
	String writer = null;
	int bno = list.get(0).getBno();
	for(CommunityVo vo : list) {
		writer = vo.getWriter();
		session.setAttribute("bno", vo.getBno());
	}
	String writer2 = "";
	if(session.getAttribute("id")!=null) {
		writer2 = (String) session.getAttribute("id");
	} else {
		writer2 = "";
	}
	int count = 0;
	if(request.getAttribute("count")!=null) {
		count = (int) request.getAttribute("count");
	}
	
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>댕댕포레스트 게시글보기</title>
<link href="css/Daeng.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<style>
	textarea {
		resize:none;
		background-color:transparent; 
		border:transparent; 
		outline: none;
		width:100%;
	}
	.textarea {
		border: 1px solid rgba(0, 0, 0, 0.5);
		margin-bottom:15px;
		border-radius:10px;
		padding:10px;
		
	}
</style>
</head>
<body id="body">
<jsp:include page="Header.jsp"></jsp:include>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<div style="clear:both;"></div>
	<div id="board_all"> 
		<div id="board_cnt"><!-- 전체테두리 틀 -->
			<div id="allcnt"> <!-- 게시판 전체내용 테두리 -->
				<div id="cnt_main"> <!-- 제목 작성자 등... -->
				 <% for(CommunityVo vo : list) { 
				 %>
					<div><h3><%=vo.getTitle() %></h3></div>
					<div><%=vo.getWriter() %></div>
						<div style="float:left;"><%=vo.getDate() %></div>
						<div style="text-align:right">
							<b>조회수:<%=vo.getHitcount() %></b>
							<b>댓글수:<%=count%></b>
						</div>
				</div>
					<div style="border-bottom: 0.5px solid; opacity: 0.2;"></div><!-- 테두리선 -->
					<br/>
				<div> <!-- 상세내용  -->
					<div>
					<%
						if(vo.getFileName() != null) {
					%>
					<div><img src="Images/<%=vo.getFileName()%>" style="width:600px; height:480px;" ></div><%} %>
					<b><%=vo.getContent()%>
					</b>
					</div>
				</div>
				<% 
				}
				%>
				<br/>
				<div>
					<div style="text-align:right;">
						<button id="list">목록</button>
						<script>
							$("#list").click(function(){
								history.back(); 
								window.location = document.referrer;
	 						});
						</script>
						<% if(writer2.equals(writer)) { %>
						<button id="modifyBtn">수정</button>
						<button type="submit" onclick="location.href='DeleteServlet'">글삭제</button>
						<%
							}
						%>
					</div>
				</div>
				<div style="margin-top:15px; margin-bottom:15px; border-bottom: 0.5px solid; opacity: 0.2;"></div><!-- 테두리선 -->
				<div>
			
					<h3 style="margin-bottom:30px;"><b>댓글</b></h3>
					<div class="allcomment">
						<div id=append>
						 <%
							for(CommentVo vo : list2) {
						%>
							<div class="comments">
								<div class = "test">
									<div class="writer"><%=vo.getWriter() %></div>
									<div class="content"><%=vo.getContent() %></div>
									<div class="date" style="float:left"><%=vo.getDate() %></div>
								<%
									if(vo.getWriter().equals(session.getAttribute("id"))) {					
								%>	
									<div style="text-align:right;">
										<input type="hidden" class=rnum value="<%=vo.getRnum()%>"/>
										<button class="modify">수정</button>
										<button class="delete">삭제</button>
									</div>
								<% 
									} else {
								%>		<div><br/></div>
								<% 	
									}
								%>
									<div style="margin-top:15px; margin-bottom:15px; border-bottom: 0.5px solid; opacity: 0.2;"></div><!-- 테두리선 -->
								</div>
							</div>
						<%
								}
						%>
						</div>
					</div>
				<script>
						$(function() {
							$("#commentset").click(function() {			
								var writer = $("#commentId").text();			
								var content = $("#content").val();
								var bno = <%=bno%>;
								$("#content").val("");
								if(content=="") {
									alert("내용을 입력해주세요.");
								} else {
									$.ajax({
										type: "get",
										url: "CommentServlet",
										data: {"writer":writer, "content":content, "bno":bno},
										datatype: "json",
										success: function(data) {
											var str = "";
											str += "<div class='comments'>";
											str += "<div class='test'>";
											str += "<div class'writer''>"+data.writer+"</div>";
											str += "<div class='content'>"+data.content+"</div>";
											str += "<div style='float:left'>"+data.date+"</div>";
											str += "<div style='text-align:right;'>";
											str += "<input type='hidden' class='rnum' value='"+data.rnum+"'/>";
											str += "<button class='modify' style='margin-right:6px;'>수정</button>";
											str += "<button class='delete'>삭제</button>";
											str += "</div>";
											str += "<div style='margin-top:15px; margin-bottom:15px; border-bottom: 0.5px solid; opacity: 0.2;''></div>"
											str += "</div>";
											str += "</div>";
											$("#append").append(str);
										},
										error: function(request, status, error) {alert("ERR");}
									});
								}
							});
						});	
					</script>
				<div>
						<div style="margin:auto; margin-bottom: 15px; width:95%; border-radius:10px; padding:10px; border: 1px solid rgba(0, 0, 0, 0.5);">
							<div id="commentId"><%=writer2%></div>
							<span id="span">내용</span>
							<div style="margin-bottom:30px;">
								<textarea class="form-control" rows="3" placeholder="댓글을 입력하세요." id="content" style="background-color:transparent; border:transparent; outline: none;"></textarea>
								<div style="float:right"><button id="commentset">등록</button></div>
							</div>
						</div>
				</div>
				</div>
			</div>
		</div>
		<br/><br/>
	</div>
	<br/><br/>
	<%
		if(writer2.equals("")) {
	%>		<script>
				$(function(){
					const bno = "<%=bno%>";
					$("#content").click(function(){
						alert("로그인해주세요.");
						location.href='Login.jsp?type=BoardView?bno='+bno;
					});
				});
			</script>
	<%
		}
	%>
	<script>
	
		$(document).on('click','.delete', function() {
			const bno = "<%=bno%>";
			var rnum = $(this).parent().children("input.rnum").val();
			if(confirm("정말 삭제하시겠습니까?")) {
				$(this).parent().parent().parent(".comments").remove();
				alert("삭제 되었습니다.");
				$.ajax({
					type: "get",
					url: "DeleteAction",
					data: {"rnum":rnum, "bno":bno},
					dataType: "json",
					success: function(data) {
						
					},
					error: function(request, status, error) {alert("ERR");}
				});
			} else {
				alert("취소되었습니다.");
			}
			
		});
		
		$("#modifyBtn").click(function(){
			const bno = "<%=bno%>";
			location.href="ModifyServlet?bno="+bno;
		});
		
	</script>
	<script>
	$(document).on('click','.modify', function() {
		const bno = "<%=bno%>";
		var rnum = $(this).parent().children("input.rnum").val();
		var writer = $(this).parent().parent().children("div.writer").text();
		var content = $(this).parent().parent().children("div.content").text();
		$(this).parent().parent("div.test").hide();
		var str = "";
		str += "<div class=textarea>";
		str += "<div>"+writer+"</div>";
		str += "<textarea class='modi' placeholder='댓글을 입력하세요'>"+content+"</textarea>";
		str += "<div style='text-align:right;'><button class='cancel' style='margin-right:6px;'>취소</button><button class='modiBTN'>등록</button></div>";
		str += "</div>";
		$(this).parent().parent().parent("div.comments").append(str);
		$(".modi").focus();
		$(".cancel").click(function() {
			$(this).parent().parent().parent().children("div.test").show();
			$(".textarea").remove();
		});
		$(".modiBTN").click(function() {
			content = $(".modi").val();
			$.ajax({
				type: "get",
				url: "CommentModiAction",
				data: {"bno":bno, "content":content,"rnum":rnum},
				success: function() {
				},
				error: function(request, status, error) {alert("ERR");}
			});
					$(this).parent().parent().parent().children("div.test").show();
					$(this).parent().parent().parent().children("div.test").children("div.content").text(content);
					$(".textarea").remove();
		});
	});
	
	</script>
</body>
</html>