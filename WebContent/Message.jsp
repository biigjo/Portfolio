<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dd.vo.*"%>
<!DOCTYPE html>
<%
	ArrayList<MessageVO>list = (ArrayList<MessageVO>)(request.getAttribute("list"));
	String mtype = (String) request.getAttribute("mtype");
	int pageNo = (int)(request.getAttribute("pageNo"));
	int pageSize = (int)(request.getAttribute("pageSize"));
	int pageTotal = (int)(request.getAttribute("pageTotal"));
	int pageStart = (pageNo%pageSize==0) ? pageNo - (pageSize-1) : pageNo - (pageNo%pageSize-1);
	int pageEnd = pageStart + (pageSize-1);
%>
<%!
	String toStringShort(String s) {
		if(s.length() > 20) {
			s = s.substring(0, 19) + ". . . ";
		}
		return s;
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕포레스트 댕댕쪽지</title>
<link href="css/Daeng.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<style>
	.table-condensed th {
		height:50px;
	}
	.table-condensed td {
		height:50px;
	}
	a:link { color: black; text-decoration: none;} /* 기본 색 */
	a:visited { color: black; text-decoration: none;}  /* 한번 선택했던 색 */
	a:hover { color: black; text-decoration: underline;} /* 마우스 이동시 색 */
</style>
<script>
	function showMessage() {window.open("MsgWrite.jsp", "" ,"width=500, height=530, left=700, top=50");}
</script>
</head>
<body id="body">
	<jsp:include page="Header.jsp"></jsp:include>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<div style="clear:both;"></div>
		<h1 class="f40_cg">댕댕 쪽지</h1>
	<div class="msg">
		<button id="receiveMsg" type="button" class="btn btn-default" style="font-size: 20px">받은쪽지함</button>
		<button id="sendMsg" type="button" class="btn btn-default" style="font-size: 20px">보낸쪽지함</button>
		<input type="button" class="btn btn-default"  style="font-size: 20px" value="쪽지보내기" onclick="showMessage()"/>
	
		<table class="table-condensed" style="width:810px;">
				<tr>
					<th>전체<input type="checkbox" id="checkall"></th>
					<%
						if(mtype.equals("Receive")) {
					%>
					<th class="sender">보낸사람</th>
					<%
						} else if (mtype.equals("Send")) {
					%>
					<th class="sender">받은사람</th>
					<%
						}
					%>
					<th>내용</th>
					<th>시간</th>
				</tr>
				<%
					for(MessageVO m : list) {
				%>
				<tr>
					<td><input type="checkbox" class="chk" name="chk"><input type="hidden" class="num" value="<%=m.getRnum()%>"/></td>
					<%
						if(mtype.equals("Receive")) {
					%>
					<td style="width:100px;" class="nameR"><%=m.getFrom_name()%></td> <!-- 보낸사람 헷갈려죽겠네 어후... -->
					<%
						} else if(mtype.equals("Send")) {
					%>
					<td style="width:100px;" class="nameS"><%=m.getTo_name()%></td> 
					<%
						}
					%>
					<%
						if(mtype.equals("Receive")) {
					%>
					<td style="width:400px;"><input type="hidden" class="testR" value="<%=m.getContent()%>"/><a href='javascript:void(0);' class="msgR"><%=toStringShort(m.getContent())%></a></td>
					<%
						} else if (mtype.equals("Send")) {
					%>
					<td style="width:400px;"><input type="hidden" class="testS" value="<%=m.getContent()%>"/><a href='javascript:void(0);' class="msgS"><%=toStringShort(m.getContent())%></a></td>
					<%
						}
					%>
					<td><%=m.getMsg_date()%></td> <!--  -->
				</tr>
				<%
					}
				%>
		</table>
<script>

	var arr = new Array;

	$(".chk").click(function() {
		var test = $("input:checkbox[name=chk]:checked").length
		//num[test-1] = $(this).parent().children("input.num").val();
		var num = $(this).parent().children("input.num").val();
		
		if(arr.indexOf(num)==-1) {
			arr.push(num);	
		} else {
			arr.splice(arr.indexOf(num), 1);
		}
		alert(arr[2]);
	});
	$(function() {
		$("#deleteM").click(function() {
			var mtype = "<%=mtype%>";
			alert(mtype);
			$.ajax({
				type: "get",
				url: "DeleteMsg",
				data: {"arr":arr, "mtype":mtype},
				async: false,
				dataType: "json",
				success: function(data) {
					alert("나왔당");
				},
				error: function(request, status, error) { alert("ERR."); }
			});
			
		});
	});
	
	// if문 걸어서 체크 되어있는거 배열에 넣고 체크 해제된거는 배열에 안넣음
</script>
		</div>
	<div style="font-size:20px; margin-left:47%;">
	<% if(mtype.equals("Receive")) { %>
	<%
			if(pageStart != 1) {
	%>
				<a href="DaengController?command=MsgReceiveAction&mtype=Receive&page=<%=pageStart-1%>">이전</a>
	<%
			}
	%>
	<%
			for(int i = pageStart; i <= pageEnd; i++) {
				if(pageTotal < i) break; 
	%>
	<%
			 if(pageNo == i) { 
	%>
				<%=i%>
	<%
			 } else {
	%>
				<a href="DaengController?command=MsgReceiveAction&mtype=Receive&page=<%=i%>"><%=i%></a>
	<%
			 }
		}
	%>
	<%
			if(pageEnd<pageTotal) {
	%>
				<a href="DaengController?command=MsgReceiveAction&mtype=Receive&page=<%=pageEnd+1%>">다음</a>
	<%
			}
	%>
	<%
		} else if (mtype.equals("Send")) {
	%>
	<%
			if(pageStart != 1) {
	%>
				<a href="DaengController?command=MsgReceiveAction&mtype=Send&page=<%=pageStart-1%>">이전</a>
	<%
			}
	%>
	<%
			for(int i = pageStart; i <= pageEnd; i++) {
				if(pageTotal < i) break;
	%>
	<%
			 if(pageNo == i) { 
	%>
				<%=i%>
	<%
			 } else {
	%>
					<a href="DaengController?command=MsgReceiveAction&mtype=Send&page=<%=i%>"><%=i%></a>
	<%
				}
			}
	%>
	<%
			if(pageEnd<pageTotal) {
	%>
				<a href="DaengController?command=MsgReceiveAction&mtype=Send&page=<%=pageEnd+1%>">다음</a>
	<%
			}
	%>
	<%
		}
	%>
	</div>
	<div class="delete">
		<button id="deleteM" type="button" class="btn btn-default" style="font-size: 25px">삭제하기</button>
	</div>
<script>
	$("#receiveMsg").click(function(){
		location.href="DaengController?command=MsgReceiveAction&mtype=Receive";
	});
	$("#sendMsg").click(function(){
		location.href="DaengController?command=MsgReceiveAction&mtype=Send";
	});
</script>
<script>
	var contentR = "";
	var nameR = "";
	$(".msgR").click(function(){
		contentR = $(this).parent().children("input.testR").val();
		nameR = $(this).parent().parent().children("td.nameR").text();
		window.open("MsgReceive.jsp?contentR="+contentR+"&nameR="+nameR,"","width=500, height=460, left=100, top=50");
	});
	var contentS = "";
	var nameS = "";
	$(".msgS").click(function(){
		contentS = $(this).parent().children("input.testS").val();
		nameS = $(this).parent().parent().children("td.nameS").text();
		window.open("MsgSend.jsp?contentS="+contentS+"&nameS="+nameS,"","width=500, height=460, left=100, top=50");
	});
</script>
<script>
	$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=chk]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=chk]").prop("checked",false);
        }
    })
})
</script>
</body>
</html>