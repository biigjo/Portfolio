<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<img src="Images/골든리트리버.PNG">
	<img src="Images/골든리트리버.PNG">
<script>
$(document).ready (function(){
	$(window).scroll(function() {
	   if($(window).scrollTop() + $(window).height() >= $(document).height()) {
	       alert("바닥을 침!");
	       $.ajax({
	    	   type: "get",
	    	   url: "MuhanServlet",
	    	   datatype: "JSON",
	    	   success: function(data) {
	    		  for(var i = 0; i<=data.list.length-1; i++){
	    			  var aa = data.list[i];
	    			  var str = "";
	    			  str += "<img src='Images/"+aa.fileName+"'>";
	    			  $("body").append(str);
	    			  
	    		  }
	    	   },
	    	   error: function(request, status, error) { alert("ERR."); }
	      });
	   }
	});
});
</script>
</body>
</html>