<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>���������Ʈ ȸ������</title>
<link href="css/Daeng.css" type="text/css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	<script src="js/jquery-3.6.0.min.js"></script>    
<script>
		
	function checkId(id) {
		 var idRegExp = /^[a-zA-z0-9]{4,12}$/; //���̵� ��ȿ�� �˻�
		if(id=="") {
			$("#id_check").text("���̵� �Է����ּ���.");
			$("#id_check").css("color", "red");
			return false;
		} else if(!idRegExp.test(id)) {
			$("#id_check").text("���̵�� ���� ��ҹ��ڿ� ���� 4~12�ڸ��� �Է��ؾ��մϴ�!");
			$("#id_check").css("color", "red");
			return false;
		}
		 return true;
	}
</script>
<!-- <script>
    
    	function check() {
d    		if(id.equals){
    			alert("���̵� �Է����ּ���.");
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
						alert("�α��εǾ����ϴ�.");
						
					}else {
						alert("�α��� ����");
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
						$("#id_check").text("�ߺ��Դϴ�.");
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
			<button type="submit" class="btn btn-defalut btn-sm"><img src="Images/�������ΰ�2.gif" width="600" height="160" onclick="location.href='Home.html'" />
			</button>
		</h1><br/>
	<h1 id="lojotitle">ȸ������</h1>
	<br/><br/>
	<form action="JoinServlet" method="post">
		<div class="form-group">
			<div class="col-sm-15">
				<div>
					<input type="text" class="form-control" id="id" name="id" placeholder="���̵�" style="width:252.48px;">
				</div>
				<div class="check_font" id="id_check"></div>
			</div>
		</div>
		<br />
		<div class="form-group">
	  		<div class="col-sm-15">
				<input type="password" class="form-control" id="pw" name="pw" placeholder="��й�ȣ">
			</div>
		</div>
		<br />
		<div class="form-group">
			<div class="col-sm-15">
				<input type="password" class="form-control" id="pw1" name="pw1" placeholder="��й�ȣ Ȯ��">
			</div>
		</div>
		<br />
		<div class="form-group">
			<div class="col-sm-15">
				<input type="text" class="form-control" id="name" name="name"
					placeholder="�̸�">
			</div>
		</div>
		<br/>
		<div class="form-group">
			<div class="col-sm-15">
				<input type="text" class="form-control" id="nic" name="nick
				name"
					placeholder="�г���">
			</div>
		</div>
		<br />
		<div class="form-group">
			<div class="col-sm-15">
				<input type="email" class="form-control" id="Email" placeholder="�̸���">
				<button type="submit" class="btn btn-default">������ȣ ����</button>
			</div>
		</div>
		<br />
		<div class="form-group">
			<div class="col-sm-15">
				<input type="email" class="form-control" id="num" placeholder="������ȣ �Է�">
				<button type="submit" class="btn btn-default">������ȣ Ȯ��</button>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-15">
				<div id="lojobtn">
					<input type="submit" id="btn" value="�����ϱ�"/>
				</div>
			</div>
		</div>
	</form>
<script>
	
</script>
</body>
</html>