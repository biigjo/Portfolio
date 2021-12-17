<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>댕댕포레스트 회원가입</title>
<link href="css/Daeng.css" type="text/css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	function checkAll() {
		var id = $("#id").val();
		var pw = $("#pw").val();
		var pw1 = $("#pw1").val();
		var name = $("#name").val();
		var nick = $("#nick").val();
		var email = $("#email").val();
		
		var idReg = /^[A-za-z0-9]{6,20}$/g;
		var pwReg = /^[A-za-z0-9]{8,12}$/g;
		var regExp1 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		if(!idReg.test(id)) {
			$("#warringId").text("아이디를 6~20자 영문, 숫자로 입력해주세요.");
			$("#warringId").css("color", "red");
			return false;
		} else {
			$("#warringId").text(" ");

		} 
		if(!pwReg.test(pw)) {
			$("#warringPw").text("비밀번호를 8~12자 영문, 숫자로 입력해주세요.");
			$("#warringPw").css("color", "red");
			return false;
		} else {
			$("#warringPw").text(" ");
		}
		
		if(pw != pw1) {
			$("#warringPw1").text("비밀번호를 동일하게 입력해주세요.");
			$("#warringPw1").css("color", "red");
			return false;
		} else {
			$("#warringPw1").text(" ");
		}
		if(frm1.name.value == "") {
			$("#warringName").text("이름을 입력해주세요.");
			$("#warringName").css("color", "red");
			return false;
		} else {
			$("#warringName").text(" ");
		}
		
		if(frm1.nick.value == "") {
			$("#warringNick").text("닉네임을 입력해주세요.");
			$("#warringNick").css("color", "red");
			return false;
		} else {
			$("#warringNick").text(" ");
		}
		if(!regExp1.test(email)) {
			$("#warringEmail").text("이메일을 정확하게 입력하세요.");
			$("#warringEmail").css("color", "red");
			return false;
		} else {
			$("#warringEmail").text(" ");
		}
		alert('가입되었습니다.');
		return true;
		
	}
</script>
<script>
	 $(function() {
		 var idReg = /^[A-za-z0-9]{6,20}$/g;
		$("#id").blur(function() {
			var id = $("#id").val();
			$.ajax({
				type: "get",
				url: "Idcheck",
				data: {"id":id},
				datatype: "json",
				success: function(data) {
					if(data.login_check == 1) {
						$("#warringId").text("이미 사용중인 아이디입니다.");
						$("#warringId").css("color", "red");
						return false;
					} else if (data.login_check == 0 && idReg.test(id)) {
						$("#warringId").text("사용가능한 아이디입니다.");
						$("#warringId").css("color", "black");
					
					} else if (!(idReg.test(id))) {
						$("#warringId").text("아이디를 6~20자 영문, 숫자로 입력해주세요.");
						$("#warringId").css("color", "red");
					} 
				},
				error: function(request, status, error) { alert("ERR."); }
			});
		});
	}); 
/* 	$("#pw").blur(function() {
		alert('1');
		var id = $("#id").val();
		
		$.ajax({
			type: "get",
			url: "Idcheck",
			data: {"id":id},
			datatype: "json",
			success: function(data) {
				if(data.login_check == 1) {
					$("#warringId").text("이미 사용중인 아이디입니다.");
					$("#warringId").css("color", "red");
					return false;
				} else {
					$("#warringId").text("사용가능한 아이디입니다.");
				}
			},
			error: function(request, status, error) { alert("ERR."); }
		});	
	}); */
</script>
</head>
<body id="body">
		<h1 id="logoall">
			<button type="submit" class="btn btn-defalut btn-sm"><img src="Images/강아지로고2.gif" width="600" height="160" onclick="location.href='Home.jsp'" />
			</button>
		</h1><br/>
	<h1 id="lojotitle">회원가입</h1>
	<br/><br/>
	<form name="frm1" onsubmit="return checkAll();" action="DaengController" method="post">
	<input type="hidden" name="command" value="Join"/>
	<div class="form-group">
		<div class="col-sm-15">
			<div>
				<input type="text" class="form-control" id="id" name="id" placeholder="아이디" style="width:252.48px;"/>
			</div>
		</div>
	</div>
			<div id="warringId" style="height:38px; width:251px; font-size:13px; margin:auto;"></div>
	<div class="form-group">
  		<div class="col-sm-15">
			<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호"/>
		</div>
	</div>
			<div id="warringPw" style="height:38px; width:262px; font-size:13px; margin:auto;"></div>
		<div class="form-group">
			<div class="col-sm-15">
				<input type="password" class="form-control" id="pw1" name="pw1" placeholder="비밀번호 확인"/>
			</div>
		</div>
		<div id="warringPw1" style="height:38px; width:251px; font-size:13px; margin:auto;"></div>
	<div class="form-group">
		<div class="col-sm-15">
			<input type="text" class="form-control" id="name" name="name" placeholder="이름"/>
		</div>
	</div>
		<div id="warringName" style="height:38px; width:251px; font-size:13px; margin:auto;"></div>
	<div class="form-group">
		<div class="col-sm-15">
			<input type="text" class="form-control" id="nick" name="nickname" placeholder="닉네임"/>
		</div>
	</div>
		<div id="warringNick" style="height:38px; width:251px; font-size:13px; margin:auto;"></div>
	<div class="form-group">
		<div class="col-sm-15">
			<input type="email" class="form-control" id="email" name="email" placeholder="이메일"/>
		</div>
	</div>
		<div id="warringEmail" style="height:38px; width:251px; font-size:13px; margin:auto;"></div>
	<div class="form-group">
		<div class="col-sm-15">
		<div id="lojobtn">
			<input type="submit" value="가입하기"/>
			</div>
		</div>
	</div>
</form>
</body>
</html>