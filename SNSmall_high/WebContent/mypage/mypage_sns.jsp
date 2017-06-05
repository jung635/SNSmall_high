<%@page import="java.util.StringTokenizer"%>
<%@page import="web.sns.db.SnsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet"> 
	<link href="./css/member.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<%
String id = (String)session.getAttribute("id"); 
String type= (String)session.getAttribute("type");

if(id==null){
	response.sendRedirect("./login.cl");  
}

SnsBean sb = (SnsBean)request.getAttribute("sb");

//서브이미지 분해
String[] array;
String s = sb.getDetail_img();
array=s.split(",");

%>
<div class="container">
 
  <div class="more_content">
     <div class="col-md-3">
   <jsp:include page="../inc/myinfo_sns_left.jsp"/>
     </div>
		<div class="col-md-9">
			<div style="margin: 50px 0 50px 0">
				<div class="top-subject">내 정보 보기</div>

					<div class="col-md-12 table-liner-top">
						<div class="col-md-4 table-colorBg-top">
						<span class="table-txt">아이디</span>
						</div>
						<div class="col-md-8 pass-conf-text"><%=id %></div>
					</div>
					
					<div class="col-md-12 table-liner">
						<div class="col-md-4 table-colorBg">
						<span class="table-txt">이름</span>
						</div>
						<div class="col-md-8 pass-conf-text"><%=sb.getName() %></div>
					</div>
					
					<div class="col-md-12 table-liner">
						<div class="col-md-4 table-colorBg">
						<span class="table-txt">카테고리</span>
						</div>
						<div class="col-md-8 pass-conf-text"><%=sb.getCategory() %></div>
					</div>
					
					<div class="col-md-12 table-liner">
						<div class="col-md-4 table-colorBg">
						<span class="table-txt">SNS계정<br><br><br><br><br></span>
						</div>
						<div class="col-md-8 pass-conf-text">
						
						<div class="col-md-3 info-tit">Instagram</div>
						<div class="col-md-9 info-con">
							<%if(sb.getInstagram()==null || sb.getInstagram().equals("")){%>미등록<%}else{%><%=sb.getInstagram()%><%}%>
						</div>
						
						<div class="col-md-3 info-tit">Facebook</div>
						<div class="col-md-9 info-con">
							 <%if(sb.getFacebook()==null || sb.getFacebook().equals("")){%>미등록<%}else{%><%=sb.getFacebook()%><%}%> 
						</div>
						
						<div class="col-md-3 info-tit">Twitter</div>
						<div class="col-md-9 info-con">
							<%if(sb.getTwitter()==null || sb.getTwitter().equals("")){%>미등록<%}else{%><%=sb.getTwitter()%><%}%>
						</div>
						
						<div class="col-md-3 info-tit">Blog</div>
						<div class="col-md-9 info-con">
							<%if(sb.getBlog()==null || sb.getBlog().equals("")){%>미등록<%}else{%><%=sb.getBlog()%><%}%>
						</div>
						
						<div class="col-md-3 info-tit">Etc</div>
						<div class="col-md-9 info-con">
							<%if(sb.getEtc()==null || sb.getEtc().equals("")){%>미등록<%}else{%><%=sb.getEtc()%><%}%>
						</div>
						
						</div>
					</div>
					
					<div class="col-md-12 table-liner">
						<div class="col-md-4 table-colorBg">
						<span class="table-txt">소개글</span>
						</div>
						<div class="col-md-8 pass-conf-text"><%=sb.getContent() %></div>
					</div>
					
					<div class="col-md-12 table-liner">
						<div class="col-md-4 table-colorBg">
						<span class="table-txt">소개글</span>
						</div>
						<div class="col-md-8 pass-conf-text"><%=sb.getContent() %></div>
					</div>
					
					<div class="col-md-12 table-liner">
						<div class="col-md-4 table-colorBg">
							<span class="table-txt">메인 이미지<br><br><br><br><br><br><br><br><br><br><br></span>
						</div>
						<div class="col-md-8 pass-conf-text">
							<img src="./sns_pro_upload/<%=sb.getProfile_img()%>" width="200" height="200" style="margin: 0px 0px 10px 0; border-radius:8px;">
						</div>
					</div>
					
					<div class="col-md-12 table-liner">
						<div class="col-md-4 table-colorBg">
						<span class="table-txt">서브이미지<br><br><br><br><br><br>
						<%if(array.length>=5){ %><br><br><br><br><br><%}%>
						</span>
						</div>
						<div class="col-md-8 pass-conf-text">
						
							<%  if(array.length<=3){
		for(int i=0;i<array.length;i++){%>
		
    		<img src="./sns_pro_upload/<%=array[i]%>"  width="100" height="100" ">
  <%	}
		}else if(array.length>=3){
			for(int i=0; i<=3;i++){%>
			<img src="./sns_pro_upload/<%=array[i]%>"  width="100" height="100">
		<%}%>
	<br> 
	<%for(int i=4;i<array.length;i++){%>
		<img src="./sns_pro_upload/<%=array[i]%>"  width="100" height="100">
	<%}
	}%>	
						
						</div>
					</div>
					
					<div class="col-md-12" style="margin-top: 50px;"><div class="top-subject" style="border-color: #B2D8AC">SN# 판매 정보</div></div>
				
					<div class="col-md-12 table-liner-top">
						<div class="col-md-4 table-colorBg-top" style="background-color: #B2D8AC">
						<span class="table-txt">등급</span>
						</div>
						<div class="col-md-8 pass-conf-text"><%=sb.getRank() %></div>
					</div>
					
					<div class="col-md-12 table-liner">
						<div class="col-md-4 table-colorBg" style="background-color: #B2D8AC">
						<span class="table-txt">판매량</span>
						</div>
						<div class="col-md-8 pass-conf-text"><%=sb.getSell() %></div>
					</div>
					
					<div class="col-md-12 table-liner">
						<div class="col-md-4 table-colorBg" style="background-color: #B2D8AC">
						<span class="table-txt">이익</span>
						</div>
						<div class="col-md-8 pass-conf-text"><%=sb.getSns_profit() %></div>
					</div>	
						
						</div>
						<jsp:include page="../inc/footer.jsp"/>
					</div>
				</div>
			</div>

	
</body>
</html>