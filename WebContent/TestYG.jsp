<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>댕댕포레스트 유기견정보(YG가 상세보기)</title>
<link href="css/Daeng.css" rel="stylesheet">
<link href="Daeng.css" type="text/css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="js/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" href="css/jquery-ui.css"/>
<!-- <script>
var xhr = new XMLHttpRequest();
//var url = 'http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic'; /*URL*/
var url = 'http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic';   // URL이라고.
var queryParams = '?bgnde=20210713&endde=20210713&pageNo=1&numOfRows=1&' + encodeURIComponent('ServiceKey') + '='+'%2BRAEmNZhWsaIO%2F5p4L3hJ3KXrn%2B3aVb5t3Se1uV5WB0JC%2F73dqpRo89BbxrNeHNOdzZ3RHZzXvEqiPUrQPqnjg%3D%3D'; /*Service Key*/
xhr.open('GET', url + queryParams,true	);
xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    	alert(this.responseText);
        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
   }
};
xhr.send();

</script> -->
<style>
	.fl { float:left; }
</style>
<script>
	var data_yg;
	$(function() {
		$.ajax({
			type: "get",
			url: "TestYGServlet",
			data: { value1:"값1" },
			dataType: "json",
			success: function(data){
				data_yg = data;
				var s="<div style='width:1200px; margin:0 auto;'>";
				for(var i=0; i<=data.length-1; i++) {
					s+="<div class='fl' style='width:250px;'>";
					s+="<table style='font-size:6px;'>";
					s+="<tr class='popfile'>";
					s+="<td>popfile</td>";
					s+="<td><img style='width:200px;' src='"+data[i].popfile+"'/></td>";
					s+="</tr>";
	
					s+="<tr class='noticeNo'>";
					s+="<td>noticeNo</td>";
					s+="<td>"+data[i].noticeNo+"</td>";
					s+="</tr>";
	
					s+="<tr class='kindCdsexCd'>";
					s+="<td>kindCd/sexCd</td>";
					s+="<td>"+data[i].kindCd+" / " + data[i].sexCd + "</td>";
					s+="</tr>";

					s+="<tr class='orgNm'>";
					s+="<td>orgNm</td>";
					s+="<td>"+data[i].orgNm+"</td>";
					s+="</tr>";
	
					s+="<tr class='age' style='display:none;'>";
					s+="<td>age</td>";
					s+="<td>"+data[i].age+"</td>";
					s+="</tr>";
	
					s+="<tr class='careAddr' style='display:none;'>";
					s+="<td>careAddr</td>";
					s+="<td>"+data[i].careAddr+"</td>";
					s+="</tr>";
					
					s+="<tr class='careNm' style='display:none;'>";
					s+="<td>careNm</td>";
					s+="<td>"+data[i].careNm+"</td>";
					s+="</tr>";
	
					s+="<tr class='careTel' style='display:none;'>";
					s+="<td>careTel</td>";
					s+="<td>"+data[i].careTel+"</td>";
					s+="</tr>";
	
					s+="<tr class='chargeNm' style='display:none;'>";
					s+="<td>chargeNm</td>";
					s+="<td>"+data[i].chargeNm+"</td>";
					s+="</tr>";
	
					s+="<tr class='colorCd' style='display:none;'>";
					s+="<td>colorCd</td>";
					s+="<td>"+data[i].colorCd+"</td>";
					s+="</tr>";
					
					s+="<tr class='desertionNo' style='display:none;'>";
					s+="<td>desertionNo</td>";
					s+="<td>"+data[i].desertionNo+"</td>";
					s+="</tr>";
	
					s+="<tr class='filename' style='display:none;'>";
					s+="<td>filename</td>";
					s+="<td><img style='width:200px;' src='"+data[i].filename+"'></td>";
					s+="</tr>";
	
					s+="<tr class='happenDt' style='display:none;'>";
					s+="<td>happenDt</td>";
					s+="<td>"+data[i].happenDt+"</td>";
					s+="</tr>";
	
					s+="<tr class='happenPlace' style='display:none;'>";
					s+="<td>happenPlace</td>";
					s+="<td>"+data[i].happenPlace+"</td>";
					s+="</tr>";
	
					s+="<tr class='neuterYn' style='display:none;'>";
					s+="<td>neuterYn</td>";
					s+="<td>"+data[i].neuterYn+"</td>";
					s+="</tr>";
	
					s+="<tr class='noticeEdt' style='display:none;'>";
					s+="<td>noticeEdt</td>";
					s+="<td>"+data[i].noticeEdt+"</td>";
					s+="</tr>";
	
					s+="<tr class='noticeSdt' style='display:none;'>";
					s+="<td>noticeSdt</td>";
					s+="<td>"+data[i].noticeSdt+"</td>";
					s+="</tr>";
	
					s+="<tr class='officetel' style='display:none;'>";
					s+="<td>officetel</td>";
					s+="<td>"+data[i].officetel+"</td>";
					s+="</tr>";
	
					s+="<tr class='processState' style='display:none;'>";
					s+="<td>processState</td>";
					s+="<td>"+data[i].processState+"</td>";
					s+="</tr>";
	
					s+="<tr class='specialMark' style='display:none;'>";
					s+="<td>specialMark</td>";
					s+="<td>"+data[i].specialMark+"</td>";
					s+="</tr>";
	
					s+="<tr class='weight' style='display:none;'>";
					s+="<td>weight</td>";
					s+="<td>"+data[i].weight+"</td>";
					s+="</tr>";
					
					s+="</table>";
					s+="</div>";
				}
				s+="</div>";
				$("#yg").html(s);
				//alert(data);
			},
			error: function(error) {
				alert("ERROR:"+error);
			}
		});
	})
</script>
</head>
<body id="body">
	<jsp:include page="Header.jsp"></jsp:include>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<div style="clear:both;"></div>
	<h1 class="f40_cg">유기견정보(YG가 상세보기)<img src="Images/유기견메인.png" width="100" height="60"/></h1>
	<div id="yg"></div>
</body>
</html>