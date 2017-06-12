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

<%List<LiveBean> list = (List<LiveBean>)request.getAttribute("list"); 
ProductDAO pdao = new ProductDAO();
int product_num = (Integer)request.getAttribute("product_num"); 
ProductBean pb = pdao.getProduct(product_num);
%>
<h2><%=pb.getSubject() %></h2>
<%if(list.size()==0){%>
	리스트가 없습니다.
<%}else
	for(int i=0; i<list.size(); i++){
		LiveBean lb = list.get(i);
		%>
	<table>
		<td>Sns아이디</td><td>방송 제목</td>
		<tr>
			<td><%=lb.getSns_id() %></td>
			<td><%=lb.getTitle() %></td><td><button onclick="location.href='ViewLive.li?video_id=<%=lb.getVideo_id()%>&token=<%=lb.getToken()%>&product_num=<%=lb.getProduct_num()%>&title=<%=lb.getTitle()%>&sns_id=<%=lb.getSns_id()%>'">방송 보러 가기</button></td>
		</tr>
	</table>
	<%} %>
<div id="live"></div>
</body>
</html>