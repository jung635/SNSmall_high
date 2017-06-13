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
<title>Live 방송 목록</title>
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
		<i class="fa fa-bars" aria-hidden="true"></i> Broadcast List
		</div>
		<hr style="border: 1px solid #fff; margin-bottom: 0;">
		<br>
			
			
<%//List<LiveBean> list = (List<LiveBean>)request.getAttribute("list"); 
Map<LiveBean, ProductBean> map = (Map<LiveBean, ProductBean>)request.getAttribute("map");
List<SnsBean> list = (List<SnsBean>)request.getAttribute("list");
int i=0;
if(map.size()==0){%>
	리스트가 없습니다.
<%}else
	for(LiveBean key : map.keySet()){
		LiveBean lb = key;
		ProductBean prob = map.get(key);
		SnsBean sb = list.get(i);
		%>
		<div class="col-md-3 liveList" style="min-height: 400px;">
				
				<div class="col-md-12 img-bg" style="background-image: url('sns_pro_upload/<%=sb.getProfile_img()%>');"></div>
				<div class="col-md-12 liveListCon1">
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
				
				
				
				<button class="go-live-btn col-md-12" onclick="location.href='ViewLive.li?video_id=<%=lb.getVideo_id()%>'">
				<i class="fa fa-caret-square-o-right" aria-hidden="true"></i>
				LIVE
				</button>
		</div>
		<div class="col-md-1"></div>
	<%i++;} %>
			
			
		</div>
	</div>
</div>

</body>
</html>