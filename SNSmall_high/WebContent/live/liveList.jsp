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
if(list.size()==0){%>
	리스트가 없습니다.
<%}else
	for(int i=0; i<list.size(); i++){
		LiveBean lb = list.get(i);%>
	<table>
		<td>Sns아이디</td><td>물건 번호</td><td>비디오 id</td>
		<tr>
			<td><%=lb.getSns_id() %></td>
			<td><%=lb.getProduct_num() %></td>
			<td><%=lb.getVideo_id() %></td><td><button onclick="location.href='ViewLive.li?video_id=<%=lb.getVideo_id()%>&token=<%=lb.getToken()%>'">방송 보러 가기</button></td>
		</tr>
	</table>
<%} %>
<div id="live"></div>
</body>
</html>