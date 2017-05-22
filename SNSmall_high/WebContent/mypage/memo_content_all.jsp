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
<script type="text/javascript">
function fncheckdelete(para_getNum){
	
	if(confirm("메모를 삭제하시겠습니까?")){
		if(para_getNum!=""){
			document.frmdelete.num.value=para_getNum;
			document.frmdelete.submit();
		}else{
			alert("메모가 이상하다");
			return;
		}
	}else{
		return;
	}
}
 
</script>
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
// 세션 가져오기
// 세션이 없으면 또는 세션이 admin이 아니면 main.jsp 이동
if(id ==null ){
 	response.sendRedirect("./Main.cl");
}
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">쪽지글 내용보기
            <small>쪽지글 목록</small>
        </h1>
     </div>
</div>
<div class="row">

<%

// MemoBean meb = request 저장된 meb값 가져오기
// String pageNum= request 저장된 pageNum값 가져오기
// 		request.setAttribute("meb", meb);
// 		request.setAttribute("pageNum", pageNum);
MemoBean meb=(MemoBean)request.getAttribute("meb");
String pageNum=(String)request.getAttribute("pageNum");

%>

<h3>받은쪽지 보기</h3>
<table border=1>
<tr bgcolor="orange"><td>쪽지번호</td><td colspan=3><%=meb.getNum()%></td></tr>
<tr bgcolor="#ffeecc"><td>보낸사람</td><td><%=meb.getFrom_id()%></td><td>작성일</td><td><%=meb.getDate()%></td></tr>
<tr bgcolor="#ffeecc"><td>쪽지제목</td><td colspan=3><%=meb.getSubject()%></td></tr>
<tr bgcolor="#ffeecc"><td>쪽지내용</td><td colspan=3><%=meb.getContent()%></td></tr>
<tr bgcolor="#ffeecc"><td colspan=4>

<!-- <input type="button" value="쪽지삭제" onclick="location.href='./MemoDeleteGet.me?num=<%=meb.getNum()%>&pageNum=<%=pageNum%>'">-->
<input type="button" value="쪽지삭제" onclick="javascript:fncheckdelete(<%=meb.getNum()%>);">
<input type="button" value="답글쓰기" onclick="location.href='./MemoReWrite.me?num=<%=meb.getNum()%>&re_ref=<%=meb.getRe_ref()%>&re_lev=<%=meb.getRe_lev()%>&re_seq=<%=meb.getRe_seq()%>&from_id=<%=meb.getFrom_id()%>&to_id=<%=meb.getTo_id()%>'">

<input type="button" value="쪽지목록" onclick="location.href='./MemoListAll.me?pageNum=<%=pageNum%>'"></td></tr>
</table>

<form action="./MemoDeleteAllAction.me?pageNum=<%=pageNum %>" method="post" name="frmdelete" >
       <input type="hidden" name="num" value="">
</form>


    <!-- /.container -->
<!--     <div class="container"> -->
    
<div class="row text-center">
<div class="col-lg-12">
<ul class="pagination">


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
