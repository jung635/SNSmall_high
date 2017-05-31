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
	response.sendRedirect("./Login.ve");  
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
				<div class="info-top-tit">　내정보 보기</div>
				
				<div class="vendor_info">
	<table>
	<tr> 
		<td> <span class="mini-tit">Main Image</span> </td>
		<td>　　　　</td>
		<td> <span class="mini-tit">Sub Image</span> </td> </tr>
	<tr> 
		<td>
			<div class="img-bg"><img src="./sns_pro_upload/<%=sb.getProfile_img()%>" width="200" height="200" style="margin: 10px 50px 10px 0; border-radius:8px;"></div>
		</td>
		<td>　　　　</td>
		<td>
		
		<div>
		<%  if(array.length<=3){
		for(int i=0;i<array.length;i++){%>
    		<img src="./sns_pro_upload/<%=array[i]%>"  width="100" height="100">
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
		</td>
	</tr>
	</table>			
				

					<legend>　Basic info</legend>
					
						<div class="col-md-3 info-tit">ID</div>
						<div class="col-md-9 info-con"><%=id %></div>
						
						<div class="col-md-3 info-tit">Name</div>
						<div class="col-md-9  info-con"><%=sb.getName() %></div>
						
						<div class="col-md-3 info-tit">Category</div>
						<div class="col-md-9 info-con"><%=sb.getCategory() %></div>
						
						<div class="col-md-3 info-tit">Introduce</div>
						<div class="col-md-9 info-con"><%=sb.getContent() %></div>
						
					<legend>　SNS Acount</legend>
						
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
						
						<legend>total sale</legend>
						
						<div class="col-md-3 info-tit">Rank</div>
						<div class="col-md-9 info-con"><%=sb.getRank() %></div>
						
						<div class="col-md-3 info-tit">Sell</div>
						<div class="col-md-9 info-con"><%=sb.getSell() %></div>
						
						<div class="col-md-3 info-tit">Profit</div>
						<div class="col-md-9 info-con"><%=sb.getSns_profit() %></div>
		
						
						<div class="col-md-3"></div>
						<div class="col-md-9"></div>
						
						<div class="col-md-3"></div>
						<div class="col-md-9"></div>
						
						<div class="col-md-3"></div>
						<div class="col-md-9"></div>



 
 
						</div>
					</div>
				</div>
			</div>
		</div>
	
</body>
</html>