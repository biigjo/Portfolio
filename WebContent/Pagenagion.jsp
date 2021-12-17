<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%	int pageNo = (int)(request.getAttribute("pageNo"));
int pageSize = (int)(request.getAttribute("pageSize"));
int pageTotal = (int)(request.getAttribute("pageTotal"));
int pageStart = (pageNo%pageSize==0) ? pageNo - (pageSize-1) : pageNo - (pageNo%pageSize-1);
int pageEnd = pageStart + (pageSize-1);
int pageNext = pageEnd+1;
int pageBack = pageStart-1;
String ctgr = (String)(request.getAttribute("ctgr"));
if(ctgr == null){
	ctgr = "0";
} 
int pn = (int)(request.getAttribute("pn"));
int option = 0;
String searchCtt = null;
if((request.getAttribute("option")!=null) && (request.getAttribute("searchCtt"))!=null) {
	option = (int)(request.getAttribute("option"));
	searchCtt = (String)(request.getAttribute("searchCtt"));
}
%>
</head>
<body>
	 	<%if(pn==2){ %>
		<%
		 	if(pageStart!=1) {	
		%>		<a href="DaengController?command=CommunityAction&ctgr=<%=ctgr %>&page=<%=pageBack%>">이전</a> 
		<% 	}
		 	for(int i=pageStart; i<=pageEnd; i++) {
	 			if(pageTotal<i) {
					break;
				}
		%>			
	 	<% 	if(i==pageNo) {
	 		
	 	%>		<%=i %>
		<% 	} else {
		%>		<a href="DaengController?command=CommunityAction&ctgr=<%=ctgr %>&page=<%=i%>"><%=i%></a>
		<%  }
		 	}
			if(!(pageEnd>=pageTotal)) {
		%> 		<a href="DaengController?command=CommunityAction&ctgr=<%=ctgr %>&page=<%=pageNext%>">다음</a>
		<%  } 
		%>
	 	<%}else if(pn==1) { %>
		<%
		 	if(pageStart!=1) {	
		%>		<a href="DaengController?command=CommunityAction&page=<%=pageBack%>">이전</a> 
		<% 	}
		 	for(int i=pageStart; i<=pageEnd; i++) {
	 			if(pageTotal<i) {
					break;
				}
		%>			
	 	<% 	if(i==pageNo) {
	 		
	 	%>		<%=i %>
		<% 	} else {
		%>		<a href="DaengController?command=CommunityAction&page=<%=i%>"><%=i%></a>
		<%  }
		 	}
			if(!(pageEnd>=pageTotal)) {
		%> 		<a href="DaengController?command=CommunityAction&page=<%=pageNext%>">다음</a>
		<%  } 
		%>
		
		
		
		<%} else if(pn==3) {%> 
		<%
		 	if(pageStart!=1) {	
		%>		<a href="SearchServlet?selectop=<%=option%>&search=<%=searchCtt%>&page=<%=pageBack%>">이전</a> 
		<% 	}
		 	for(int i=pageStart; i<=pageEnd; i++) {
	 			if(pageTotal<i) {
					break;
				}
		%>			
	 	<% 	if(i==pageNo) {
	 		
	 	%>		<%=i %>
		<% 	} else {
		%>		<a href="SearchServlet?selectop=<%=option%>&search=<%=searchCtt%>&page=<%=i%>"><%=i%></a>
		<%  }
		 	}
			if(!(pageEnd>=pageTotal)) {
		%> 		<a href="SearchServlet?selectop=<%=option%>&search=<%=searchCtt%>&page=<%=pageNext%>">다음</a>
		<%  } 
		%>
		<%} else if(pn==4) {%> 
		<%
		 	if(pageStart!=1) {	
		%>		<a href="SearchServlet?ctgr=<%=ctgr%>&selectop=<%=option%>&search=<%=searchCtt%>&page=<%=pageBack%>">이전</a> 
		<% 	}
		 	for(int i=pageStart; i<=pageEnd; i++) {
	 			if(pageTotal<i) {
					break;
				}
		%>			
	 	<% 	if(i==pageNo) {
	 		
	 	%>		<%=i %>
		<% 	} else {
		%>		<a href="SearchServlet?ctgr=<%=ctgr%>&selectop=<%=option%>&search=<%=searchCtt%>&page=<%=i%>"><%=i%></a>
		<%  }
		 	}
			if(!(pageEnd>=pageTotal)) {
		%> 		<a href="SearchServlet?ctgr=<%=ctgr%>&selectop=<%=option%>&search=<%=searchCtt%>&page=<%=pageNext%>">다음</a>
		<%  } 
		%>
		
		
		
		
		<%} %><br/>
</body>
</html>