<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = (String)session.getAttribute("id");

	String name = null;
	String nick = null;
	String email = null;
	if(request.getAttribute("name") != null) {
		name = (String)request.getAttribute("name");
	}
	if(request.getAttribute("nick") != null) {
		nick = (String)request.getAttribute("nick");
	}
	if(request.getAttribute("email") != null) {
		email = (String)request.getAttribute("email");
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕포레스트 회원정보 수정</title>
<link href="css/Daeng.css" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	function checkAll () {
		var nick = $("#nick").val();
		var email = $("#email").val();
		var pw = $("#pw").val();
		var pw1 = $("#pw1").val();
		var pw2 = $("#pw2").val();
		var regExp1 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		var pwReg2 = /^[A-za-z0-9]{8,12}$/g;
		
		if(nick == "") {
			alert('닉네임을 입력해주세요.');
			return false;
		}
		if(!regExp1.test(email)) {
			alert('이메일을 정확하게 입력해주세요');
			return false;
		}

		if(!pwReg2.test(pw1)) {
			alert('비밀번호는 영문, 숫자 8~12자 이내로 입력해주세요.');
			return false;
		}
		if(pw1 != pw2) {
			alert('비밀번호를 동일하게 입력해주세요.');
			return false;
		}
		alert('변경되었습니다.');
		return true;
	}
</script>
</head>
<body id="body">
		<h1 id="logoall">
			<button type="submit" class="btn btn-defalut btn-sm"><img src="Images/강아지로고2.gif" width="600" height="160" onclick="location.href='Home.jsp'" />
			</button>
		</h1><br/><br/>
	<form action="MyUpdateServletTest" method="post">
	<h1 id="lojotitle">회원정보 수정</h1>
	<br/><br/>
	<div class="form-group">
			<input type="text" class="form-control" id="text" name="id" placeholder="아이디" value="<%=id%>" readonly>
		</div>
	<br />
	<div class="form-group">
			<input type="text" class="form-control" id="text" name="name" placeholder="이름" value="<%=name%>" disabled>
		</div>
	<br />
	<div class="form-group">
			<input type="text" class="form-control" id="nick" name="nickname" value="<%=nick%>" placeholder="닉네임">
		</div>
	<br />
	<div class="form-group"> 
			<input type="text" class="form-control" id="email" name="email" value="<%=email%>" placeholder="이메일">
		</div>
	<br />
	<div class="form-group">
		<input type="password" class="form-control" id="pw" name="pw" placeholder="현재 비밀번호"><button id="pwbtn" class="btn btn-default" >비밀번호 확인</button>
		</div>
	<br />
	<div class="form-group">
		<input type="password" class="form-control" id="pw1" name="pw1" placeholder="새 비밀번호" disabled>
		</div>
	<br />
	<div class="form-group">
		<input type="password" class="form-control" id="pw2" name="pw2" placeholder="새 비밀번호 확인" disabled>
			<button type="submit" class="btn btn-default" id="changeBtn" onclick="return checkAll();">변경</button>
		</div>
	<br />
	</form>
	<script>
		$(function() {
			$("#pwbtn").click(function() {
			var pw = $("#pw").val();
			var pwReg = /^[A-za-z0-9]{8,12}$/g;
			if(!pwReg.test(pw)) {
				alert('비밀번호는 영문, 숫자 8~12자 이내로 입력해주세요.');
			}
 				$.ajax({
					type: "post",
					url: "PwCheckServlet",
					data: {"pw":pw},
					datatype: "json",
					success: function(data) {
						if(data.pw_check == 1) {
							$("#pw1").removeAttr('disabled');
							$("#pw2").removeAttr('disabled');
						} else {
							alert("잘못 입력하셨습니다.");
						}
					},
					error: function(request, status, error) { alert("ERR."); }
				});
			});
		});
	</script>		
</body>
</html>