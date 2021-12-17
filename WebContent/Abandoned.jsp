<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>댕댕포레스트 유기견정보</title>
<link href="css/Daeng.css" rel="stylesheet">
<link href="Daeng.css" type="text/css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="js/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" href="css/jquery-ui.css"/>
<style>
	.fl { 
		float:left; margin-left:5%; 
	}
	
	#info2 {
		font-size:13px;
		margin-left:23%;
		
	}
</style>

<script>
	$(document).on("click", ".abView", function() {
		 var profile = "";	// 사진
		 var noticeNo = "";  // 공고번호
		 var kindGender = "";  // 품종 / 성별
		 var age = "";		// 나이
		 var weight = "";	// 체중
		 var happenPlace = "";	// 발견장소
		 var happenDt = ""; 	// 발견날짜
		 
		 //profile = $(this).parent().parent().html();   // <tr class="profile"><td>.............
		 //profile = $(this).parent().parent().parent().find(".profile").children("td").eq(1).html();  // <img ...
		 profile = $(this).parent().parent().parent().find(".profile").children("td").eq(1).children("img").attr("src");  // <img ...
		 //alert("profile - "+profile);
		 noticeNo = $(this).parent().parent().parent().find(".noticeNo").children("td").eq(1).text();
		 //alert("noticeNo = " + noticeNo);
		 kindGender = $(this).parent().parent().parent().find(".kindCdsexCd").children("td").eq(1).text();
		 //alert("kindGender = " + kindGender);
		 age = $(this).parent().parent().parent().find(".age").children("td").eq(1).text();
		 //alert("age : " + age);
		 weight = $(this).parent().parent().parent().find(".weight").children("td").eq(1).text();
		 //alert("weight : " + weight);
			 happenPlace = $(this).parent().parent().parent().find(".happenPlace").children("td").eq(1).text();
		 //alert("happenPlace : " + happenPlace);
		 happenDt = $(this).parent().parent().parent().find(".happenDt").children("td").eq(1).text();
		 //alert("happenDt : " + happenDt);

		var new_window = window.open("abView.jsp", "", "width=480px, height=680px");
		new_window.profile = profile;
		new_window.noticeNo = noticeNo;
		new_window.kindGender = kindGender;
		new_window.age = age;
		new_window.weight = weight;
		new_window.happenPlace = happenPlace;
		new_window.happenDt = happenDt;
		 
		 /*
		//alert($(this).parent().parent().parent().children("tr").eq(1).children("td.variety").text());		
		var notice = $(this).parent().parent().children("tr").eq(1).children("td.notice").text();	// 제이쿼리는 버튼 id값 말고 class로 해야 내용 다 나옴
		//var new_window = window.open("TestYGJava?notice="+encodeURI(notice), "", "width=800px, height=750px");
		var new_window = window.open("abView.jsp", "", "width=800px, height=750px");
		new_window.yg = "YG!";
		new_window.yg2 = "YG2!!!";
	 	*/
	 });
 
	$(document).ready (function(){
		
		var pageNo = 1;
		
    $(window).scroll(function() {
    	
    	if($(window).scrollTop() + $(window).height() >= $(document).height()) {
    		pageNo++;
		$.ajax({
    		type: "get",
    	 	url: "TestYGServlet",
    	 	data: {"pageNo":pageNo},
    	 	datatype: "JSON",
    	 	success: function(data) {
    	 		  for(var i = 0; i<=data.length-1; i++){
    					data_yg = data;
    					var s="<div style='width:1500px; margin-left:14%;'>";
    	 				s+="<div>";
    					s+="<div class='fl'>"
    					s+="<table style='font-size:15px;'>";
    					s+="<tr class='profile'>";
    					s+="<td></td>";
    					s+="<td class='abView'><img style='width:300px; height:200px; cursor:pointer;' src='"+data[i].popfile+"'/></td>";
    					s+="</tr>";
    					
    					s+="<tr class='noticeNo'>";
    					s+="<td></td>";
    					s+="<td class='notice'>"+data[i].noticeNo+"</td>";
    					s+="</tr>";

    					s+="<tr class='kindCdsexCd'>";
    					s+="<td></td>";
    					s+="<td>"+data[i].kindCd+" / " + data[i].sexCd + "</td>";
    					s+="</tr>";

    					s+="<tr class='orgNm'>";
    					s+="<td></td>";
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
    					s+="</div></div></div>";
    					$("#yg").append(s);
    	 		  }
    	 		 
    	 	   },
    	 	  
    	 	   error: function(request, status, error) { alert("ERR."); }
    	   });
    	}	 
    });
   
});
</script>
</head>
<body id="body">
	<jsp:include page="Header.jsp"></jsp:include>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<div style="clear:both;"></div>
	<h1 class="f40_cg">유기견정보<img src="Images/유기견메인.png" width="100" height="60"/></h1>
	<img src="Images/유기안내문.JPG" style="width:900px; margin-left:23%;"><br/>
	<img src="Images/유기견메인.JPG" style="width:900px; height:320px; margin-left:23%;"><br/>
	<div id="info2"><br/>
	검색시 유의사항 : 품종오류가 발생할 수 있으니 축종을 전체로 설정 후 한번 더 검색하시기 바랍니다. <br/>
	<span style="color:#c4585b;">공고중인 동물 소유자는 "자세히 보기"를 참고하시어 해당</span> 시군구 및 <span style="color:blue;">동물보호센터</span> 또는 <br/>
	<span style="color:blue;">동물보호상담센터 1577-0954</span>로 문의하시기 바랍니다. <br/>
	동물보호센터 및 동물병원 근무시간은 <span style="color:#c4585b;">09:00 ~ 18:00이므로 문의전화는 근무시간에만 가능</span>합니다.
	</div>
	<br/>
	<div id="yg"></div>
</body>
</html>
