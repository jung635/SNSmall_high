<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="web.product.db.ProductBean"%>
<%@page import="web.live.db.LiveBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/live.css" rel="stylesheet">
<link href="./css/font-awesome.min.css" rel="stylesheet"> 
</head>
<body style="background-color:#eef7ee;">
<div class="live_tit"> <i class="fa fa-caret-square-o-right" aria-hidden="true"></i> Broadcast List</div>
<br>
<div>
<%//List<LiveBean> list = (List<LiveBean>)request.getAttribute("list"); 
Map<LiveBean, ProductBean> map = (Map<LiveBean, ProductBean>)request.getAttribute("map");
if(map.size()==0){%>
	리스트가 없습니다.
<%}else
	%>
	<hr style="border:0.2px solid #B2D8AC; margin: 2px; ">
	<%
	for(LiveBean key : map.keySet()){
		LiveBean lb = key;
		ProductBean prob = map.get(key);
		%>
	<table  class="live_mini_bg">
		
		<tr>
		<td></td><td></td>
		</tr>
		
		<tr>
			<td rowspan="3">
				<button class="liveGo" onclick="location.href='ViewLive.li?video_id=<%=lb.getVideo_id()%>&token=<%=lb.getToken()%>&product_num=<%=lb.getProduct_num()%>&title=<%=lb.getTitle()%>'"><img src="./images/live/cast.gif"></button>
			</td>
			<td style="width: 400px;">
			<div class="live_subject">
			
			<i class="fa fa-angle-right" aria-hidden="true"></i>&nbsp;<%=lb.getTitle() %></div>	
			</td>
			<td rowspan="2">
			<div class="pro_subject">#<%=prob.getSubject() %></div>
			</td>
			<td>
			</td>
		</tr>
		<tr>
		<td></td>
		<td></td>
		<td>
		<i class="fa fa-user" aria-hidden="true"></i>
		<%=lb.getSns_id() %>
		</td>
		</tr>
	</table>
	
	<hr style="border:0.2px solid #B2D8AC; margin: 2px; ">
	<%} %>
<div id="live"></div>
</div>
</body>
</html>