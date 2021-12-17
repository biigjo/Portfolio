<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		
	function checkId(id) {
		 var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
		if(id=="") {
			$("#id_check").text("아이디를 입력해주세요.");
			$("#id_check").css("color", "red");
			return false;
		} else if(!idRegExp.test(id)) {
			$("#id_check").text("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
			$("#id_check").css("color", "red");
			return false;
		}
		 return true;
	}
</script>
<!-- <script>
    
    	function check() {
d    		if(id.equals){
    			alert("아이디 입력해주세요.");
    			return false;
    		}
    		document.write(id);
    	}
    	function checkAll() {
            if (!checkUserId(frm1.id.value)) {
                return false;
            } else if (!checkPassword(frm1.userId.value, form.password1.value,
                    form.password2.value)) {
                return false;
            } else if (!checkMail(form.mail.value)) {
                return false;
            } else if (!checkName(form.name.value)) {
                return false;
            } else if (!checkBirth(form.identi1.value, form.identi2.value)) {
                return false;
            } else if (!checkFavorite()) {
                return false;
            } else if (!checkIntro()) {
                return false;
            }
            return true;
        }
    }
</script> -->
    <!-- 	<script>
		var g_data;
	$(function() {
		$("#btn_login").click(function() {
			var id = $("#id").val();
			var pw = $("#pw").val();
			$.ajax({
				type: "post",
				url: "LoginServlet",
				data:{"id":id, "pw":pw},
				datatype: "json",
				success: function(data) {
					if(data.login_check==1){
						alert("로그인되었습니다.");
						
					}else {
						alert("로그인 실패");
					}
					
				},
				error: function(request, status, error) {alert("ERR.");}
			});
		});
	});
</script> -->
<script>
	$(function() {
		$("#id").blur(function() {
			var id = $("#id").val();
			$.ajax({
				type: "get",
				url: "LoginServlet",
				data:{"id":id},
				datatype: "json",
				success: function(data) {
					if(data.login_check == 1) {
						$("#id_check").text("중복입니다.");
						$("#id_check").css("color", "red");
					}else {
						if(checkId(id)) {
							$("#id_check").text("");
						}
						
					}
				},
				error: function(request, status, error) {alert("ERR.");}
			});
		});
	});
	
</script>
</head>
<body id="body">
		<h1 id="logoall">
			<button type="submit" class="btn btn-defalut btn-sm"><img src="Images/강아지로고2.gif" width="600" height="160" onclick="location.href='Home.html'" />
			</button>
		</h1><br/>
	<h1 id="lojotitle">회원가입</h1>
	<br/><br/>
	<form action="JoinServlet" method="post">
		<div class="form-group">
			<div class="col-sm-15">
				<div>
					<input type="text" class="form-control" id="id" name="id" placeholder="아이디" style="width:252.48px;">
				</div>
				<div class="check_font" id="id_check"></div>
			</div>
		</div>
		<br />
		<div class="form-group">
	  		<div class="col-sm-15">
				<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호">
			</div>
		</div>
		<br />
		<div class="form-group">
			<div class="col-sm-15">
				<input type="password" class="form-control" id="pw1" name="pw1" placeholder="비밀번호 확인">
			</div>
		</div>
		<br />
		<div class="form-group">
			<div class="col-sm-15">
				<input type="text" class="form-control" id="name" name="name"
					placeholder="이름">
			</div>
		</div>
		<br/>
		<div class="form-group">
			<div class="col-sm-15">
				<input type="text" class="form-control" id="nic" name="nick
				name"
					placeholder="닉네임">
			</div>
		</div>
		<br />
		<div class="form-group">
			<div class="col-sm-15">
				<input type="email" class="form-control" id="Email" placeholder="이메일">
				<button type="submit" class="btn btn-default">인증번호 전송</button>
			</div>
		</div>
		<br />
		<div class="form-group">
			<div class="col-sm-15">
				<input type="email" class="form-control" id="num" placeholder="인증번호 입력">
				<button type="submit" class="btn btn-default">인증번호 확인</button>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-15">
				<div id="lojobtn">
					<input type="submit" id="btn" value="가입하기"/>
				</div>
			</div>
		</div>
	</form>
<script>
	
</script>
</body>
</html>