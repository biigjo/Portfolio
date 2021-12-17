<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dd.vo.*"%>
<!DOCTYPE html>
<%
	ArrayList<MemberVO> list = (ArrayList<MemberVO>) (request.getAttribute("list"));
%>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕포레스트 아이디찾기</title>
<link href="css/Daeng.css" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
 	function FindId() {		// 함수 호출 (자바스크립트)
		var name1 = $("#name1").val();
		var email1 = $("#email1").val();
		if(name1 == "") {
			alert('이름을 입력해주세요.');
			return false;
		} else if (email1 == "") {
			alert('이메일을 입력해주세요.');
			return false;
		}

		$.ajax({
			type: "get",
			url: "FindServlet",
			data: {"name1":name1, "email1":email1},
			datatype: "json",
			success: function(data) {
				if(data.FindId == 1) {
					alert('찾으시는 아이디는 '+ data.id +' 입니다.');
					$("#pw_id").val(data.id);
				} else {
					alert('일치하는 정보가 없습니다.');
					return false;
				}
			},
			error: function(request, status, error) { alert("ERR."); }
		});
		return true;
	}

	function FindPw() {		// 함수 호출 (자바스크립트)
		var id1 = $("#pw_id").val();
		var name1 = $("#pw_name").val();
		var email1 = $("#pw_email").val();
		
		if(id1 == "") {
			alert('아이디를 입력해주세요.');
			return false;
		} else if (name1 == "") {
			alert('이름을 입력해주세요.');
			return false;
		} else if (email1 == "") {
			alert('이메일을 입력해주세요.');
			return false;
		}

		$.ajax({
			type: "get",
			url: "FindServlet",
			data: {"id1":id1, "name1":name1, "email1":email1},	// "파라미터이름"
			datatype: "json",
			success: function(data) {
				if(data.FindPw == 1) {
					alert('메일이 발송되었습니다.');
				} else {
					alert('일치하는 정보가 없습니다.');
					return false;
				}
			},
			error: function(request, status, error) { alert("ERR."); }
		});
		return true;
	}
	/* $(function () {		// 제이쿼리 (버튼이벤트를 하기위한)
		$("#FindId").click(function(){
			var name1 = $("#name1").val();
			var email1 = $("#email1").val();
			if(name1 == "") {
				alert('이름을 입력해주세요');
			}
			$.ajax({
				type: "get",
				url: "FindServlet",
				data: {"name1":name1, "email1":email1},
				datatype: "json",
				success: function(data) {
					if(data.FindId == 1) {
						alert('찾으시는 아이디는 '+ data.id +' 입니다.');
					} else {
						alert('일치하는 정보가 없습니다.');
					}
				},
				error: function(request, status, error) { alert("ERR."); }
			});
				
		});
	}); */
</script>
</head>
<body id="body">
	<h1 id="logoall">
		<button type="submit" class="btn btn-defalut btn-sm"><img src="Images/강아지로고2.gif" width="600" height="160" onclick="location.href='Home.jsp'" />
		</button>
	</h1>
	<br/><br/>
	<div style="margin:auto; width:600px;">
			<div class="form-group">
				<h1 style="color:gray;">아이디 찾기</h1>
				<input type="text" id="name1" name="name1" class="form-control" placeholder="이름"/><br/>
				<input type="email" id="email1" name="email1" class="form-control" placeholder="이메일"/><br/>
				<input type="submit" value="아이디 찾기" id="FindId" onclick="return FindId();"/>		<!-- onclick은 해당 url로 이동하거나 return 타입 함수 출력 -->
			</div>
		</div>
		<div style="margin-top:100px;">
			<div class="form-group">
				<h1 style="color:gray;">비밀번호 찾기</h1>
				<input type="text" id="pw_id" name="id1" class="form-control" placeholder="아이디"><br/>
				<input type="text" id="pw_name" name="name1" class="form-control" placeholder="이름"/><br/>
				<input type="email" id="pw_email" name="email1" class="form-control" placeholder="이메일"/><br/>
				<input type="submit" value="비밀번호 찾기" id="FindPw" onclick="return FindPw();"/>
			</div>
		</div>
	</div>
</body>
</html>