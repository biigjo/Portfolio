<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dd.vo.*"%>
<!DOCTYPE html>
<%
	ArrayList<DictionaryVO> list = (ArrayList<DictionaryVO>)(request.getAttribute("list"));
%>
<%!
	String toStringShort(String s) {
		if(s.length() > 100) {
			s = s.substring(0, 99) + ". . . ";
		}
		return s;
	}
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>댕댕포레스트 댕댕사전</title>
<link href="css/Daeng.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body id="body">
	<jsp:include page="Header.jsp"></jsp:include>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<div style="clear:both;"></div>
		<h1 class="f40_cp1">댕댕 사전<img src="Images/사전메인.png" width="100" height="60"/></h1>
	<br/><br/><br/>
	<div class="alltable">
			<%
				for(DictionaryVO d : list) {
			%>
	<div class="table1">
		<table class="dictable">
			<tr>
				<td colspan="2" style="background: url('<%=d.getFile_name()%>') no-repeat center/cover; height: 190px;"></td>
			</tr>
			<tr>
				<td>품종</td>
				<td><%=d.getVariety()%></td>
			</tr>
			<tr>
				<td>원산지</td>
				<td><%=d.getAncestry()%></td>
			</tr>
			<tr>
				<td>내용</td>
				<td class="line2">
				<%=toStringShort(d.getContent())%>
				<button id="myBtn" type="submit" class="btn btn-defalut btn-sm"><img src="Images/더보기버튼.png" width="30" height="30"></button></td>
			</tr>
		</table>
	</div>
			<%
				}
			%>
	<div style="clear:both;"></div>
</div>

<br/>
	<main id="myContainer" class="MainContainer">
        <header class="MainHeader">
            <div class="css-script-ads" style="margin:30px auto" align="center"></div>
        </header>

        <!-- Open The Modal -->
        <!-- <button id="myWooriBtn" class="btn" onclick="loadHtml('Pet.html')">우리우리버튼</button> -->
    </main>
	<div id="myModal" class="Modal is-hidden is-visuallyHidden">
		<!-- Modal content -->
		<div class="Modal-content">
			<span id="closeModal" class="Close">&times;</span>
			<div id="divWoori"></div>
		</div>
	</div>
	
	<script src="js/app.min.js"></script>
<script>
$(function() {
	$(".plusBtn").click(function() {
		//alert("!!");
		e1 = $(this).parent().parent().parent().find('tr').eq(1).find('td').eq(1).html();  // 진돗개.
		//alert(e1);
		e2 = $(this).parent().parent().parent().find('tr').eq(2).find('td').eq(1).html();  // 한국
		//alert(e2);
		e3 = $(this).parent().find('div').html();
		alert(e3);
	});	
});
function loadHtml(url) {
	document.getElementById('divWoori').innerHTML = '<object type="text/html" data="'+url+'"></object>';
}

//Get the modal
var modal = document.getElementById('myModal');

// Get the main container and the body
var body = document.getElementsByTagName('body');
var container = document.getElementById('myContainer');

// Get the open button
var btnOpen = document.getElementById("myBtn");

// Get the close button
var btnClose = document.getElementById("closeModal");

// Open the modal
btnOpen.onclick = function() {
    modal.className = "Modal is-visuallyHidden";
    setTimeout(function() {
      container.className = "MainContainer is-blurred";
      modal.className = "Modal";
    }, 100);
    container.parentElement.className = "ModalOpen";
    
    loadHtml('Dic.jsp');
}

// Close the modal
btnClose.onclick = function() {
    modal.className = "Modal is-hidden is-visuallyHidden";
    body.className = "";
    container.className = "MainContainer";
    container.parentElement.className = "";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.className = "Modal is-hidden";
        body.className = "";
        container.className = "MainContainer";
        container.parentElement.className = "";
    }
}
</script>
</body>
</html>