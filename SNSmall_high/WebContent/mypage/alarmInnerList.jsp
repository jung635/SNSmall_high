<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<%String id = (String)session.getAttribute("id");
String type = (String)session.getAttribute("type");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
			<%List<Map<String, Object>> list = (List)request.getAttribute("list"); 
			Map<String, Object> map = null;
			String color = "";
			int limit = (int)request.getAttribute("limit");
			%>
			<%if(list == null){
				%>
				nothing
				<%}else{
					if(list.size()<20 || list.size()<limit) limit = list.size();%>
					<h2>메시지</h2>
					<table style="margin: auto;">
					<%for(int i=0; i<limit; i++){
						map = list.get(i);
						if(map.get("state").equals("on")||map.get("state").equals("now")){
							color = "#1e9ef0";
						}else{
							color = "rgba(255, 255, 255, 0)";
						}
					%>
						<tr style="background-color: <%=color%>">
							<td style="font-size: 16px; height: 45px; padding-right: 63px; width: 400px;"><a href="#" onclick="offAlarm(<%=map.get("num")%>)"><%=map.get("content") %></a></td>
							<td style="font-size: 11px;"><%=sdf.format(map.get("date"))%></td>
						</tr>
					<%} %> 
					</table>
					<%if(list.size()>=5){%>
			<%}} %>
</body>
</html>