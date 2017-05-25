<%@page import="web.reply.db.ReplyBean"%>
<%@page import="web.board.db.BoardBean"%>
<%@page import="web.sns.db.SnsBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	BoardBean bb = (BoardBean)request.getAttribute("bb");
	String pageNum = (String)request.getAttribute("pageNum");
	List replyList = (List)request.getAttribute("replyList");
	String id = (String)session.getAttribute("id");
	String content = bb.getContent();
	if(content != null){content=bb.getContent().replace("\r\n","<br>");}
%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="./css/font-awesome.min.css" rel="stylesheet"> 
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet">
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript">
		/* 경고문 */
		function d_confirm(){
			if(confirm("삭제하시겠습니까?")==true){
			}else{
				return false;
			}
		}
	</script>	
</head>
<body>

<jsp:include page="../inc/header.jsp"/>
<!-- Page Content -->
<div class="container">
	<div class="content">
  		<!-- Introduction Row -->
        <div class="row" style="margin-top: 43px">
            <div class="col-lg-12">
                <h1 class="page-header">홍보게시판</h1>
                <p>SNS 스타와 판매자들간의 매칭을 위한 공간입니다.</p>
            </div>
        </div>

        <!-- Team Members Row -->
		<div class="row">
            <div class="col-md-8">
                <div class="panel panel-default text-center">
					<table style="border-collapse: collapse; text-align: left; width:500;">
							<tr>
								<th>제목</th><td colspan="3"><%=bb.getSubject() %></td>
							</tr>
						
							<tr>
								<th>글쓴이</th><td><%=bb.getId() %></td><th>등록일</th><td><%=bb.getDate() %></td>
							</tr>
						
							<tr>
								<th>내용</th>
								<td colspan="3" width="600"><%=content %></td>
							</tr>
							
							<tr>
								
							</tr>
					</table>
					<hr>
					<!-- [ 댓글 목록 출력-->
					<a href="./BoardList.bo">목록보기</a> | <a href="">댓글 열기/닫기</a>
					<%
					if(id.equals(bb.getId())&&id!=null){
					%>
					 | <a href="./BoardUpdateForm.bo?num=<%=bb.getNum() %>">수정</a>
					  | <a href="./BoardDelete.bo?num=<%=bb.getNum() %>" onclick="return d_confirm()">삭제</a>
					
					<%
					}
					for(int i = 0; i < replyList.size(); i++){
						ReplyBean rb = (ReplyBean)replyList.get(i);	
						String replyContent = rb.getContent();
						if(replyContent != null){replyContent = rb.getContent().replace("\r\n","<br>");}
					%>
					<table style="border-collapse: collapse; text-align: left; width:500;">
						
						<tr>
						<td style="text-align: left;"><%=rb.getId() %><br>
						<%=replyContent %>
						</td>
						<td style="text-align: right;"><%=rb.getDate() %><br>
						<%if(id != null && id.equals(rb.getId())){%>							
						<a href="">[삭제]</a> <a href="">[수정]</a>
						<%} %>
						<a href="#"> [덧글]</a>						
						</td></tr>
					</table>					
					<%
					}
					%>					
					<!-- 댓글 목록 출력 ]-->
										
	
					<!-- [ 댓글 입력란 -->
					<hr>
					<%if(id != null){ %>
					<form action="./replyAction.re" method="post" name="fr">
					<input type="hidden" name="re_ref" value="<%=bb.getNum()%>">
					<input type="hidden" name="id" value="<%=id%>">
					<input type="hidden" name="to_id" value="<%=bb.getId()%>">
					
					<table>
					<tr><td>댓글 입력란</td></tr>
					<tr><td><textarea rows="7" cols="81" name="content"></textarea></td>
					<td><input type="submit" value="저장"></td></tr>					
					</table>
					
					</form>
					<%} %>
					<!-- 댓글 입력란 ] -->
                </div>
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
</body>
</html>