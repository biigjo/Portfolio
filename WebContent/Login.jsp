<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   String type = null;
   if(request.getParameter("type")!=null) {
      type = "?type=" + request.getParameter("type");
   } // ?type=CommunityWrite.jsp
	 // ?type=DaengController?command=MsgReceiveAction&mtype=Receive
   String url = null;
   if(request.getParameter("url")!=null) {
      url = "?url=" + request.getParameter("url");
   }
   session.setAttribute("url", url);
   //out.println(type);
   if(request.getParameter("mtype")!=null) {
	   type = "?type=" + request.getParameter("type") + "&mtype=" + request.getParameter("mtype");	
   }
   
%>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕포레스트 로그인</title>
<link href="css/Daeng.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body id="body">
		<h1 id="logoall">
			<button type="submit" class="btn btn-defalut btn-sm"><img src="Images/강아지로고2.gif" width="600" height="160" onclick="location.href='Home.jsp'" />
			</button>
		</h1>
	<br/><br/><br/>
	<h1 id="lojotitle">로그인</h1>
	<br/><br/>
	<form action="DaengController<%if(request.getParameter("type")!=null) {%><%=type %> <% } %>" method="post">
	<input type="hidden" value="Login" name="command"/>
  <div class="form-group">
  	<div class="col-sm-15">
      <input type="text" class="form-control" id="text" name="id" placeholder="아이디">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label"></label>
      	<div class="col-sm-15">
      <input type="password" class="form-control" id="password" name="pw" placeholder="비밀번호">
    </div>
  </div>
  <div class="form-group">
	<div class="col-sm-15">
      <div class="checkbox">
        <br/>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-15">
    <div id="lojobtn">
      <button type="submit" class="btn btn-default btn-lg">로그인하기</button>
      </div>
    </div>
   </div>
  </form>
    <div id="loginbtn" style="text-align:center;">
      <button type="submit" class="btn btn-default" onclick="location.href='Find.jsp'">아이디 또는 비밀번호찾기</button>
      <button type="submit" class="btn btn-default" onclick="location.href='Join2.jsp'">회원가입</button>
    </div>
</body>	
</html>