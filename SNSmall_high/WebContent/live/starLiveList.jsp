<%@page import="web.sns.db.SnsBean"%>
<%@page import="web.product.db.ProductDAO"%>
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
</head>
<body>

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
			<td><%=lb.getTitle() %></td><td><button onclick="location.href='ViewLive.li?video_id=<%=lb.getVideo_id()%>'">방송 보러 가기</button></td>
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
			<td><%=lb_vod.getTitle() %></td><td><button onclick="location.href='ViewVod.li?video_id=<%=lb_vod.getVideo_id()%>'">방송 보러 가기</button></td>
		</tr>
	</table>
	<%} %>
</body>
</html>