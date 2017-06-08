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

<%//List<LiveBean> list = (List<LiveBean>)request.getAttribute("list"); 
Map<LiveBean, ProductBean> map = (Map<LiveBean, ProductBean>)request.getAttribute("map");
int rank = 1;
if(map.size()==0){%>
	리스트가 없습니다.
<%}else
	for(LiveBean key : map.keySet()){
		LiveBean lb = key;
		ProductBean prob = map.get(key);
		%>
	<table>
		<td>Rank</td><td>Sns아이디</td><td>판매 물품 이름</td><td>방송 제목</td><td>시청횟수</td>
		<tr>
			<td><%=rank %></td>
			<td><%=lb.getSns_id() %></td>
			<td><%=prob.getSubject() %></td>
			<td><%=lb.getTitle() %></td><td><button onclick="location.href='ViewVod.li?url=<%=lb.getUrl()%>&product_num=<%=lb.getProduct_num()%>&title=<%=lb.getTitle()%>&sns_id=<%=lb.getSns_id()%>'">방송 보러 가기</button></td>
			<td><%=lb.getView() %></td>
		</tr>
	</table>
	<%rank++;
	}%>
<div id="live"></div>
</body>
</html>