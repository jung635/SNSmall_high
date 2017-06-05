
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="web.memo.db.MemoBean"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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


<script type="text/javascript">
function fncheckdelete(para_getNum){
	
	if(confirm("메모를 삭제하시겠습니까??")){
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
SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
%>
  <!-- Page Content -->
  <div class="container">
    <div class="more_content">
    <!-- Page Content -->
        <div class="row">
            <div class="col-md-3">
                <%-- <p class="lead"><%=id %></p> --%>
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

//엔터키 (\r\n) => <br> 바꾸기
String content = meb.getContent();
if(content !=null){
	content=meb.getContent().replace("\r\n", "<br>");
}
%>

<h3>받은쪽지 보기</h3>
<table border=1>
<tr bgcolor="orange"><td>쪽지번호</td><td colspan=3><%=meb.getNum()%></td></tr>
<tr bgcolor="#ffeecc"><td>보낸사람</td><td><%=meb.getFrom_id()%></td><td>작성일</td><td><%=sdf.format(meb.getDate())%></td></tr>
<tr bgcolor="#ffeecc"><td>쪽지제목</td><td colspan=3 class="subject"><%=meb.getSubject()%></td></tr>
<tr bgcolor="#ffeecc"><td>쪽지내용</td><td colspan=3 class="content"><%=content%></td></tr>
<tr bgcolor="#ffeecc"><td colspan=4>

<!-- <input type="button" value="쪽지삭제" onclick="location.href='./MemoDeleteGet.me?num=<%=meb.getNum()%>&pageNum=<%=pageNum%>'">-->
<input type="button" value="쪽지삭제" onclick="javascript:fncheckdelete(<%=meb.getNum()%>);">
<input type="button" value="답글쓰기" onclick="javascript:memoreopen(<%=meb.getNum()%>, '<%=meb.getFrom_id()%>', '<%=meb.getTo_id()%>');">
<%-- <input type="button" value="답글쓰기" onclick="location.href='./MemoReWrite.me?num=<%=meb.getNum()%>&from_id=<%=meb.getFrom_id()%>&to_id=<%=meb.getTo_id()%>'"> --%>
<input type="button" value="쪽지목록" onclick="location.href='./MemoListGet.me?pageNum=<%=pageNum%>'"></td></tr>
</table>

<form action="./MemoDeleteGetAction.me?pageNum=<%=pageNum %>" method="post" name="frmdelete" >
       <input type="hidden" name="num" value="">
</form>

<form action="./MemoReWrite.me?pageNum=<%=pageNum %>&from_id=<%=meb.getFrom_id()%>&to_id=<%=meb.getTo_id() %>" method="post" name="frmrewrite" >
       <input type="hidden" name="num" value="">
       <input type="hidden" name="from_id" value="">
       <input type="hidden" name="to_id" value="">
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
   
<script type="text/javascript">
function memoreopen(para_getNum, para_getFrom_id, para_getTo_id){
	
	window.open("./MemoReWrite.me?num=<%=meb.getNum()%>&from_id=<%=meb.getFrom_id()%>&to_id=<%=meb.getTo_id()%>", "답장하기", "width=540, height=490, top=100, left=100");
	
<%-- 	window.open("image_test.jsp?num="+number+"&picture=<%=pb.getFile() %>"
		?pageNum=<%=pageNum %>&from_id=<%=meb.getFrom_id()%>&to_id=<%=meb.getTo_id() %> --%>
		
//  	if(para_getNum!=""){
		
// 		document.frmrewrite.num.value=para_getNum;
// 		document.frmrewrite.from_id.value=para_getFrom_id;
// 		document.frmrewrite.to_id.value=para_getTo_id;
		
		
//  		/* document.write("num : "+document.frmrewrite.num.value+"from_id : "+document.frmrewrite.from_id.value+"to_id : "+document.frmrewrite.to_id.value); */
		
// 	}else{
// 		alert("메모가 이상하다");
// 		return;
// 	}
	
}

</script>

</body>
</html>
