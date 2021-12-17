<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function openPop(room){
	    var popup = window.open("chatroom2.jsp?room="+room, "채팅방", 'width=450px,height=700px');
	}
</script>
<style>
	body {
		background-color:#b2c7d9;
	}
</style>
</head>
<body style="width:566px; height:max-content; margin:0px;	">
	<div id="chHeader">
		<div style="margin-top:0px; font-size:40px; padding:7px; float:left;">채팅</div>
		<div style="text-align:right;"><button id="chat_btn">방만들기</button></div>
	</div>
<script>
	$("#chat_btn").click(function() {
		var room = prompt("방 이름을 입력하세요","방 이름");
		if(room!=null) {
			openPop(room);
		}
	});
</script>
</body>
</html>