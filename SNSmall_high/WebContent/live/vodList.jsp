<%@page import="web.sns.db.SnsBean"%>
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
<title>종료된 인기 방송 목록 보기</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="./css/font-awesome.min.css" rel="stylesheet"> 
<link href="./css/live.css" rel="stylesheet">
</head>
<body style="background-color: #e3e3e3;">
<div class="container">
	<div class="content">
		<div class="row">
		
		<hr style="border: 1px solid #fff;">
		<div class="live-tit">
		<i class="fa fa-bars" aria-hidden="true"></i> 지난 인기 VOD List
		</div>
		<hr style="border: 1px solid #fff; margin-bottom: 0;">
		<br>
		
<%//List<LiveBean> list = (List<LiveBean>)request.getAttribute("list"); 
Map<LiveBean, ProductBean> map = (Map<LiveBean, ProductBean>)request.getAttribute("map");
List<SnsBean> list = (List<SnsBean>)request.getAttribute("list");
int i=0;
int rank = 1;
if(map.size()==0){%>
	리스트가 없습니다.
<%}else
	for(LiveBean key : map.keySet()){
		LiveBean lb = key;
		ProductBean prob = map.get(key);
		SnsBean sb = list.get(i);
		%>
<!-- 	<table> -->
<!-- 		<td>Rank</td><td>Sns아이디</td><td>sns사진</td><td>판매 물품 이름</td><td>방송 제목</td><td>시청횟수</td> -->
<!-- 		<tr> -->
<%-- 			<td><%=rank %></td> --%>
<%-- 			<td><%=lb.getSns_id() %></td> --%>
<%-- 			<td><img src="./sns_pro_upload/<%=sb.getProfile_img()%>"></td> --%>
<%-- 			<td><%=prob.getSubject() %></td> --%>
<%-- 			<td><%=lb.getTitle() %></td><td><button onclick="location.href='ViewVod.li?video_id=<%=lb.getVideo_id()%>'">방송 보러 가기</button></td> --%>
<%-- 			<td><%=lb.getView() %></td> --%>
<!-- 		</tr> -->
<!-- 	</table> -->
	
	<div class="col-md-3 liveList" style="min-height: 450px;">
				<div class="col-md-2 live-rank">
				<b><%=rank %></b>
				</div>
				<div class="col-md-10 live-view"> 
				시청횟수 <%=lb.getView() %></div>
				<div class="col-md-12 img-bg" style="background-image: url('sns_pro_upload/<%=sb.getProfile_img()%>');"></div>
				<div class="col-md-12 liveListCon1" style="color:#B2D8AC;">
				<%=lb.getSns_id() %>
				</div>
				
				<div class="col-md-12">
				<hr style="margin: 0 2px 3px 2px;">
				</div>
				
				<div class="col-md-12" style="font-weight: bolder; color: #43484E;">
					<%=lb.getTitle() %>
				</div>
				<div class="col-md-12 live-pro">
					# <%=prob.getSubject() %>
				</div>
				
				
				
				<button class="go-live-btn col-md-12" onclick="location.href='ViewVod.li?video_id=<%=lb.getVideo_id()%>'" style="background-color: #B2D8AC;">
				<i class="fa fa-caret-square-o-right" aria-hidden="true"></i>
				VOD 시청
				</button>
		</div>
		<div class="col-md-1"></div>
	
	<%rank++;
	i++;}%>
<div id="live"></div>
</div>
</div>
</div>
</body>
</html>