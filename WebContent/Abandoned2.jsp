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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery.ajax-cross-origin.min.js"></script>
<link rel="stylesheet" href="css/jquery-ui.css"/>
<script>
/* var xhr = new XMLHttpRequest();
var url = 'http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic'; // URL
var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'%2BRAEmNZhWsaIO%2F5p4L3hJ3KXrn%2B3aVb5t3Se1uV5WB0JC%2F73dqpRo89BbxrNeHNOdzZ3RHZzXvEqiPUrQPqnjg%3D%3D'; //Service Key
xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
    }
};

xhr.send('');
*/

var url = 'http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic';   // URL이라고.
//var queryParams = '?bgnde=20210713&endde=20210713&pageNo=1&numOfRows=1&' + encodeURIComponent('ServiceKey') + '='+'%2BRAEmNZhWsaIO%2F5p4L3hJ3KXrn%2B3aVb5t3Se1uV5WB0JC%2F73dqpRo89BbxrNeHNOdzZ3RHZzXvEqiPUrQPqnjg%3D%3D'; /*Service Key*/
queryParams = '';
url = url + queryParams;

$.ajax({
    crossOrigin: true,
    url: "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic",
    datatype: "text",
    success: function(data) {
      	alert(data);
    },
    error: function(a,b,c) {
    	alert("ERROR! " + a + " / " + b + " / " + c);
    }
});
  
</script>
</head>
<body id="body">
</body>
</html>