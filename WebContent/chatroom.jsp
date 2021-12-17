<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" user-scalable="no"/>
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	function getQueryStringObject() {
	    var a = window.location.search.substr(1).split('&');
	    if (a == "") return {};
	    var b = {};
	    for (var i = 0; i < a.length; ++i) {
	        var p = a[i].split('=', 2);
	        if (p.length == 1)
	            b[p[0]] = "";
	        else
	            b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
	    }
	    return b;
	}
</script>
<SCRIPT>
	$(function() {
	    $('textarea').on('keydown', function(event) {
	        if (event.keyCode == 13)
	            if (!event.shiftKey){
	                event.preventDefault();
	                $('#send').submit();
	            }
	    });
	    
	    $('#send').on('submit', function() {
	        button_click();
	    });
	    
	    function button_click() {
	    	var qs = getQueryStringObject();
	    	var room = qs.room;
	    	var content = $("#input").val();
	    	$("#input").val("");
	    	$.ajax({
	    		type: "get",
	    		url: "ChatCreate",
	    		data: {"content":content, "room":room},
	    		datatype: "json",
	    		success: function(data) {
	    			alert(data.room);
	    		},
	    		error: function(request, status, error) {alert("ERR.");}
	    	});
	    	
	    }
	});
</SCRIPT>
<style>
	body {
		margin:0px;
		background-color:#b2c7d9;
	}
	#chat {
		position:fixed;
		right:0px; 
		bottom:0px;
		left:0px;
		height:20%;
		background-color:white; 
		width:100%;
	}
	#input {
		width:80%;
		height:68%;
		border:0;
		resize: none;
		outline:none;
		font-size:18px;
		font-family: inherit;
		margin-left:3px;
	}
	#send {
		position:fixed; 
		right:4px; 
		background-color:#ffec42; 
		border:1px solid #e8d848;
		width:70px;
		height:10%;
		margin-right:15px;
		margin-top:15px;
		outline:0;
		font-size:17px;
	}
	.chatbox {
		width:100%;
		height:80%;
		position:fixed;
		right:0px; 
		top:0px;
		left:0px;
		overflow-y:auto;
		
	}
	#me>div {
		background-color:white;
	    text-align:left;
	    padding:0.8rem;
	    border-radius:1rem;
	    clear:both;
	    font-weight:bold;
	    font-size:1.46rem;
	    box-shadow: 1px 1px 0 rgba(0,0,0,0.3);
	    word-break:break-all;
	    word-wrap:break-word;
	    max-width:400px;
	    width:max-content;
	}
	#you>div {
		margin-top:30px;
		background-color:#FDF01B;
	    text-align:right;
	    box-shadow: -1px 1px 0 rgba(0,0,0,0.3);
	    padding:0.8rem;
	    border-radius:1rem;
	    clear:both;
	    font-weight:bold;
	    font-size:1.46rem;
	    word-break:break-all;
	    word-wrap:break-word;
	    max-width:400px;
	    width:max-content;

	}
	#me>span {
		display:block;
	}
	#you>span {
		display:none;;
	}
	#chat_content {
		position:absolute; 
		bottom:0;
		margin-bottom:30px;
		width:100%;
		height:max-content;
	}
	
</style>

</head>
<body>
	<div class="chatbox">
		<div id="chat_content">
			<div id="me" style="margin-top:20px;">
				<span>biigjo</span>
				<div>안녕하세요~ㄹㅇㄴㅁㄻㄴㄹ</div>
			</div>
			<div id="you">
				<span>sugarblue</span>
				<div>누fdsafdfsfdsafdfdsfdfsfdsafdsfdsafsdff구</div>
			</div>
			<div id="me">
				<span>biigjo</span>
				<div>안녕하세요~ㄹㅇㄴㅁㄻㄴㄹ</div>
			</div>
			<div id="you">
				<span>sugarblue</span>
				<div>누fdsafdfsfdsafdfdsfdfsfdsafdsfdsafsdff구</div>
			</div>
		</div>
	</div>
	<div id="chat">
			<div style="padding:5px; height:100%;">
				<textarea autofocus id="input" onkeyup="enterkey();"></textarea>
				<button type="submit" id="send" onclick="button_click();">전송</button>
			</div>
			<div><img src="Images/img1.PNG" style="position:fixed; bottom:0px; margin-bottom:5px; margin-left:5px;"></div>
	</div>
</body>
</html>