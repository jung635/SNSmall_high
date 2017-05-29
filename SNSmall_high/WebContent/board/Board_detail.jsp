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
	<link href="./css/board.css" rel="stylesheet">
	
	<script src="../js/jquery-3.2.0.js"></script>
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
<!--             <div class="col-lg-12"> -->
<!--                 <h1 class="page-header">홍보게시판</h1> -->
<!--                 <p>SNS 스타와 판매자들간의 매칭을 위한 공간입니다.</p> -->
<!--             </div> -->
        </div>

        <!-- Team Members Row -->
		<div class="row" style="margin-top: 20px;">
		 	<div class="col-md-1"></div>
            <div class="col-md-10">
                <div class="panel panel-default text-center" style="border: none;">
						<div class="col-md-12">
							<div class="board-detail-subject"> <%=bb.getSubject() %> </div>
						</div>
						
						<div class="col-md-3">
							<div class="board-detail-subject2">글쓴이</div>
						</div>
						<div class="col-md-3">
							<div class="board-detail-subjext-con"><%=bb.getId() %></div>
						</div>
						<div class="col-md-3">
							<div class="board-detail-subject2">등록일</div> 
						</div>
						<div class="col-md-3">
							<div class="board-detail-subjext-con"><%=bb.getDate() %></div>
						</div>
						<div class="col-md-12">
							<div class="board-detail-subjext-con"> <%=content %> </div>
						
					
								
					<hr>
					
					<!-- [ 댓글 목록 출력-->
					<a href="./BoardList.bo">목록보기</a> | <a href="">댓글 열기/닫기</a>
					<%
					if(id.equals(bb.getId())&&id!=null){
					%>
					 | <a href="./BoardUpdateForm.bo?num=<%=bb.getNum() %>">수정</a>
					  | <a href="./BoardDelete.bo?num=<%=bb.getNum() %>" onclick="return d_confirm()">삭제</a>
					
					</div>
					
					<div class="col-md-12">
					
				
					<%
					}
					for(int i = 0; i < replyList.size(); i++){
						ReplyBean rb = (ReplyBean)replyList.get(i);	
						String replyContent = rb.getContent();
						if(replyContent != null){replyContent = rb.getContent().replace("\r\n","<br>");}
					%>
					
					<div class="col-md-12">
						<hr>
						</div>
						
					<div  class="col-md-8" style="text-align: left;">
						<%=rb.getId() %>
					</div>
					<div  class="col-md-4">
					<%=rb.getDate() %>
					</div>
					<div class="col-md-10" style="text-align: left; padding-top: 10px;">
						&nbsp;&nbsp;<%=replyContent %>
					</div>	
						<div  class="col-md-2" style="text-align: left;">	
						<%if(id != null && id.equals(rb.getId())){%>			
						<a href="./replyDelete.re?num=<%=rb.getNum()%>" onclick="return d_confirm()">[삭제]</a>
						<%} %>
						</div>
						
						
					
					<%
					}
					%>
					</div>				
					<!-- 댓글 목록 출력 ]-->
										
					<div class="col-md-12">
					<!-- [ 댓글 입력란 -->
					<br>
					<%if(id != null){ %>
					<form action="./replyAction.re" method="post" name="fr">
					<input type="hidden" name="re_ref" value="<%=bb.getNum()%>">
					<input type="hidden" name="id" value="<%=id%>">
					<input type="hidden" name="to_id" value="<%=bb.getId()%>">
					<textarea rows="3" cols="100" name="content" placeholder="　댓글을 입력해주세요."></textarea>
					<input type="submit" class="comment-submit-btn" value="저장">	
						
					</form>
					<%} %>
					</div>
					<!-- 댓글 입력란 ] -->
                </div>
            </div> 
            <div class="col-md-1"></div>                    
		</div>
								
 
        <!-- Footer -->
        <footer>
        <hr>
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