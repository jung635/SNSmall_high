<%@page import="web.sns.db.SnsBean"%>
<%@page import="web.live.db.LiveBean"%>
<%@page import="java.util.Map"%>
<%@page import="web.product.db.ProductBean"%>
<%@page import="web.product.db.ProductDAO"%>
<%@page import="web.payment.db.PaymentDAO"%>
<%@page import="web.payment.db.PaymentBean"%>
<%@page import="java.util.List"%>
<%@page import="web.client.db.ClientDAO"%>
<%@page import="web.client.db.ClientBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<%
String type = (String)session.getAttribute("type");
String id = (String)session.getAttribute("id");
%>
<!-- Page Content -->
<div class="container">
	<div class="more_content">
    <!-- Page Content -->
        <div class="row">
            <div class="col-md-3">
                <%if(type.equals("client")){ %>
                <jsp:include page="../inc/myinfo_client_left.jsp"/>
                <%}else if(type.equals("vendor")){ %>
                <jsp:include page="../inc/myinfo_vendor_left.jsp"/>
                <%}else if(type.equals("sns")){ %>
                <jsp:include page="../inc/myinfo_sns_left.jsp"/>
                <%} %>
            </div>
            <div class="col-md-9">
				<%Map<LiveBean, ProductBean> map = (Map<LiveBean, ProductBean>)request.getAttribute("vod_map");

				LiveBean lb = null;
				if((LiveBean)request.getAttribute("lb") != null){
					lb = (LiveBean)request.getAttribute("lb");
				}
				SnsBean sb = (SnsBean)request.getAttribute("sb");
				%>
				<h2><%=sb.getName()%></h2>
				<h3>라이브 방송 중</h3>
				<%if(lb == null){ %>
					진행중인 라이브방송이 없습니다.
				<%}else{ 
					ProductBean prob = (ProductBean)request.getAttribute("prob");%>
					<table>
						<td>Sns아이디</td><td>판매 물품 이름</td><td>방송 제목</td>
						<tr>
							<td><%=lb.getSns_id() %></td>
							<td><%=prob.getSubject() %></td>
						<td><%=lb.getTitle() %></td><td><button onclick="window.open('ViewLiving.li?video_id=<%=lb.getVideo_id()%>', 'live_view' , 'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes')">방송 보러 가기</button></td>
						</tr>
					</table>
				<%} %>
				<h3>방송 종료</h3>
				<%
				if(map.size()==0){%>
					리스트가 없습니다.
				<%}else
				for(LiveBean key : map.keySet()){
					LiveBean lb_vod = key;
					ProductBean prob_vod = map.get(key);
					%>
				<table>
					<td>Sns아이디</td><td>판매 물품 이름</td><td>방송 제목</td>
					<tr>
						<td><%=lb_vod.getSns_id() %></td>
						<td><%=prob_vod.getSubject() %></td>
						<td><%=lb_vod.getTitle() %></td><td><button onclick="window.open('ViewVod.li?video_id=<%=lb_vod.getVideo_id()%>', 'live_view' , 'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes')">방송 보러 가기</button></td>
						</tr>
				</table>
				<%} %>
            </div>
   		</div>
    <!-- /.container -->
    <div class="container">
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
</div>
    <!-- /.container -->
</body>
</html>