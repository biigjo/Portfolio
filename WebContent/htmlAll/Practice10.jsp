<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.dd.vo.*" %>
<%
	Connection conn = null;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "daengforest";
	String pw = "454612";
	
	try {		//jdbc 연동
		Class.forName(driver);
		conn = DriverManager.getConnection(url, id, pw);
	} catch(ClassNotFoundException e) {
		e.printStackTrace();
	}catch(SQLException e) {
		e.printStackTrace();
	}
	
	ArrayList<CommunityVo> list = new ArrayList<CommunityVo>();	//데이터베이스에 있는 내용을 넣어주기 위한 ArrayList 변수
		
	int pageSize=10;	//한페이지에 보여질 게시글 수 즉 EX) 1페이지는 총 10개 게시물이 있음
	int pageNo=0;	// 페이징처리를 하기위해 꼭 필요한 변수 웹 페이지에서 쓰일 페이지 넘버다
	if(request.getParameter("page")!=null) {	//웹 ?page='내용' 파라미터를 받는데 정의를 해주지 않았으므로 null이다 하지만 정의를 했다면 null이 아니므로 그 정의한 값을 pageNo에 넣어주기위한 조건문
		pageNo = Integer.parseInt(request.getParameter("page"));
	} else {
		pageNo = 1;	// 웹 ?page='내용' 에 값을 정의하지 않은경우 null 기본값이기 때문에 첫페이지를 나오게하는 식을 만들기위해 (밑에 pstmt.setInt(1, 내용)) 기본값을 정해준다 변수 선언 당시에 0이 아니라 1이라고 할경우 굳이 조건문 할 필요 없음.
	}
	
	PreparedStatement pstmt = conn.prepareStatement("select * from (select rownum rnum, b.* from (select c.bno, cc.name, c.title, c.writer, to_char(writer_date, 'YYYY-MM-DD') 게시날짜, c.hitcount from community c, community_category cc where cc.cno = c.category_number order by bno desc) b) where rnum>=? and rnum<=?");
	pstmt.setInt(1, (1 + pageSize*(pageNo-1)));
	pstmt.setInt(2, (pageSize*pageNo));
	
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()) {
		
		int bno = rs.getInt(2);
		String category = rs.getString(3);
		String title = rs.getString(4);
		String writer = rs.getString(5);
		String date = rs.getString(6);
		int hitcount = rs.getInt(7);
		/* CommunityVo vo = new CommunityVo(bno, category, title, writer, date, hitcount); */
		/* list.add(vo); */
	}
	pstmt.close();
	rs.close();
	
	pstmt = conn.prepareStatement("select count(*) from community");	//총 게시글 수가 몇개인지 구하는 sql문 
	rs = pstmt.executeQuery();
	int count = 0;	//
	if(rs.next()){
		count = rs.getInt(1);
	}
	out.println(count);
	int pageTotal = count / pageSize+(count%pageSize==0 ? 0 : 1);	// 페이지에 총 합을 넣은 변수
	out.println(pageTotal);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>댕댕포레스트 댕댕커뮤니티</title>
<link href="css/Daeng.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</head>
<body id="body">
	<div id="header">
	<div id="topbtn" >
		<button type="submit" class="btn btn-defalut btn-sm"><img src="Images/로그인버튼.png" width="60" height="40" onclick="location.href='Login.html'"></button>
		<button type="submit" class="btn btn-defalut btn-sm"><img src="Images/회원가입버튼.png" width="60" height="40" onclick="location.href='Join.html'"></button>
		<button type="submit" class="btn btn-defalut" onclick="location.href='Message.html'">댕댕쪽지</button> &nbsp; 
	</div>
		<h1 id="logoall">
			<button type="submit" class="btn btn-defalut btn-sm"><img src="Images/강아지로고2.gif" style="width:400px; height:100px;" onclick="location.href='Home.html'" />
			</button>
		</h1>
	<div id="categorybtn">
			<div id="btn_query" style="float:left">
				<button class="btn btn-defalut btn-sm"><img src="Images/홈버튼.png" style="width:130px; height:105px;" onclick="location.href='Home.html'"></button> &nbsp; &nbsp;
			</div>
			<div id="btn_query" style="float:left">
				<button class="btn btn-defalut btn-sm"><img src="Images/댕댕사전버튼.png" style="width:130px; height:105px;" onclick="location.href='Dictionary.html'"></button> &nbsp; &nbsp; 
			</div>
			<div id="btn_query" style="float:left">
				<button class="btn btn-defalut btn-sm"><img src="Images/커뮤니티버튼.png" style="width:130px; height:105px;" onclick="location.href='Community.html'"></button> &nbsp; &nbsp; 
			</div>
			<div id="btn_query" style="float:left">
				<button class="btn btn-defalut btn-sm"><img src="Images/자랑방버튼.png" style="width:130px; height:105px;" onclick="location.href='BoardPic.html'"></button> &nbsp; &nbsp; 
			</div>
			<div id="btn_query" style="float:left">
				<button class="btn btn-defalut btn-sm"><img src="Images/병원버튼.png" style="width:130px; height:105px;" onclick="location.href='Hospital.html'"></button> &nbsp; &nbsp; 
			</div>
			<div id="btn_query" style="float:left">
				<button class="btn btn-defalut btn-sm"><img src="Images/유기견버튼.png" style="width:130px; height:105px;" onclick="location.href='Abandoned.html'"></button>
			</div>
		</div>
	</div>	
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<div style="clear:both;"></div>
		<h1 class="f40_cb">댕댕커뮤니티<img src="Images/커뮤니티메인.png" width="100" height="60"/></h1>
		<div class="menu">
     	 <button type="submit" class="btn btn-defalut btn-lg">전체보기</button> &nbsp; 
	      <button type="submit" class="btn btn-defalut btn-lg">댕댕산책모임</button> &nbsp; 
	      <button type="submit" class="btn btn-defalut btn-lg">댕댕이야기방</button> &nbsp; 
	      <button type="submit" class="btn btn-defalut btn-lg">댕댕노하우방</button> &nbsp; 
	      <button type="submit" class="btn btn-defalut btn-lg">댕댕공동구매</button> &nbsp; 
	      <button type="submit" class="btn btn-defalut btn-lg">댕댕짝꿍구함</button> &nbsp; 
 	  </div>
		<br/>
	<div id="write1">
		<div id="write">
			<button type="submit" class="btn btn-defalut btn-lg" style="font-size:25px;" onclick="location.href='CommunityWrite.html'">글쓰기</button>
		</div>
		<table id="board" class="table table-hover">
			<thead>
				<tr>
					<th>글번호</th>
					<th style="width:162pxs;">분류</th>
					<th style="width:635px;">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회</th>
				</tr>
				</thead>
				<%
					for(CommunityVo vo : list) {	//데이터베이스에서 가져와 ArrayList list에 담은 값들을 뿌려주기위한 작업
				
				%>
						<tbody>
						<tr>
							<td><%=vo.getBno()%></td>
							<td><%=vo.getCategory()%></td>
							<td style="text-align:left;"><%=vo.getTitle() %></td>
							<td><%=vo.getWriter() %></td>
							<td><%=vo.getDate() %></td>
							<td><%=vo.getHitcount() %></td>
						</tr>
						</tbody>
				<%
					}
				int pageStart = (pageNo%pageSize==0) ? pageNo - (pageSize-1) : pageNo - (pageNo%pageSize-1);
				int pageEnd = pageStart + (pageSize-1);
				%>
	</table>
	</div>
		<br/>
		<div class="list">
		<%
			if(pageStart!=1) {	//페이지 1~10 구간엔 이전이 없어야 하므로 pageStart가 1이 아닌경우에만 이전 <a> 태그가 나오게 조건
		%>		<a href="Practice10.jsp?page=<%=pageStart-1%>">이전</a>
		<%	}
		%>
		<%
			for(int i=pageStart; i<=pageEnd; i++) { // 페이지 스타트와 페이지 엔드까지 1 2 3 4 5 6 7 8 9.... 그 페이지로 이동하는 <a>태그를 만든다
				if(i>pageTotal){	// 페이지 스타트와 페이지 엔드는 1~10 11~20 21~30 이렇게 10단위로 늘어나기 때문에 총 페이지 수와 상관없이 <a>태그가 만들어질것이다 그러므로 조건문에 i가 pageTotal보다 커질경우 break를 타고 반복문을 나온다
					break;
				}
		%>		<a href="Practice10.jsp?page=<%=i%>"><%=i%></a>
		
		
		<% 	
			}
			if(pageEnd<pageTotal) {	// 1~10 11~20 마지막 페이지가 20일경우 페이지 수는 20개 결국 pageEnd는 20이 될거고 그이상 갈 수 없으니 페이지수(pageTotal)보다 pageEnd가 작을경우에만 다음<a> 태그를 만든다
		%>		<a href="Practice10.jsp?page=<%=pageEnd+1%>">다음</a>	
		<%	}
		%>
		
	</div>
	<br/>
</body>
</html>
