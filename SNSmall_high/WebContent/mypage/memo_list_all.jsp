<%@page import="web.memo.db.MemoBean"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet"> 
	<link href="./css/memo.css" rel="stylesheet"> 
	
<title>Insert title here</title>

<style>
table,th,td {
  border : 1px solid black;
  border-collapse: collapse;
}
th,td {
  padding: 5px;
}
</style>

</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<%
String id = (String)session.getAttribute("id");

%>
  <!-- Page Content -->
  <div class="container">
    <div class="more_content">
    <!-- Page Content -->
        <div class="row">
            <div class="col-md-3">
                <p class="lead"><%=id %></p>
                <jsp:include page="../inc/myinfo_sns_left.jsp"/>
            </div>
            <div class="col-md-9">
<%
List memoListAll=(List)request.getAttribute("memoListAll");
String pageNum=(String)request.getAttribute("pageNum");
int count=((Integer)request.getAttribute("count")).intValue();
int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
int startPage=((Integer)request.getAttribute("startPage")).intValue();
int endPage=((Integer)request.getAttribute("endPage")).intValue();

// 세션 가져오기

// 세션이 없으면 또는 세션이 admin이 아니면 main.jsp 이동
if(id ==null ){
 	response.sendRedirect("./Main.cl");
}

%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">쪽지글 목록
            <small>전체쪽지함</small>
        </h1>
     </div>
</div>
<div class="row">


<h3><a href="./MemoWrite.me">[쪽지쓰기]</a></h3>

<table border=1>
<tr bgcolor="orange">
	<td>번호</td><td>보낸사람</td><td>받는사람</td><td>제목</td><td>내용</td><td>날짜</td>
</tr>
<%
	for(int i=0; i < memoListAll.size(); i++){
		//memoBean meb= 한칸의 데이터 가져와서 저장 .get()
		MemoBean meb = (MemoBean)memoListAll.get(i); //downcasting
		// 자바빈(MemoBean) 변수=배열한칸 접근 배열변수.get()
		//부모                                                      자식
		
%>
<tr bgcolor="#ffeecc">
<td><%=meb.getNum() %></td><td><%=meb.getFrom_id() %></td><td><%=meb.getTo_id() %></td>
<td>
<a href="./MemoContentAll.me?num=<%=meb.getNum()%>&pageNum=<%=pageNum%>"><%= meb.getSubject()%></a></td>
<td>
<a href="./MemoContentAll.me?num=<%=meb.getNum()%>&pageNum=<%=pageNum%>"><%= meb.getContent()%></a></td>
<td><%=meb.getDate() %></td>
</tr>
<%
}
%>
</table>
    <!-- /.container -->
<!--     <div class="container"> -->
    
<div class="row text-center">
<div class="col-lg-12">
<ul class="pagination">

<%
//페이지 출력
if(count!=0){
	//전체 페이지 수 구하기   게시판글  50개 한 화면에 보여줄 글개수 10 => 5 페이지
	//						56개 한 화면에 보여줄 글개수 10 => 5 페이지 + 1(나머지) =>6
	//한 화면에 보여줄 페이지 번호 개수
	//시작페이지 번호 구하기   1~10=>1   11~20=>11   21~30=>21
	//끝페이지 번호 구하기
	//이전 페이지
	if(startPage>pageBlock){ // 스타트페이지가 페이지블럭보다 많을 때
		%><a href="MemoListAll.me?pageNum=<%=startPage-pageBlock%>">[이전]</a>&nbsp;<%
	}
	//1...10   11...20   21...30
	for(int i=startPage; i<=endPage; i++){
		%><a href="MemoListAll.me?pageNum=<%=i%>">[<%=i%>]</a>&nbsp;<%
	}
	//다음 페이지
	if(endPage<pageCount){ //엔트페이지가 페이지블록보다 작을 때
		%><a href="MemoListAll.me?pageNum=<%=startPage+pageBlock%>">[다음]</a><%
	}
}

%>
</ul>
</div>
</div>  
    
        <hr>
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>
    </div>
  </div>
    <!-- /.container -->
    <!-- jQuery -->
    
</body>
</html>
