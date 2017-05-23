<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<%List<Map<String, Object>> list = (List)request.getAttribute("list"); 
Map<String, Object> map = null;
String color = "";
int limit = 0;
%>
<%if(list == null){
	%>
	nothing
	<%}else{
	if(list.size()<5) limit = list.size();
	else limit = 5;%>

<ul id="list_view_ul">
<%for(int i=0; i<limit; i++){
	map = list.get(i);
	if(map.get("state").equals("on")){
		color = "#ddd";
	}else if(map.get("state").equals("now")){
		color = "red";
	}
%>
	<li style="background-color: <%=color%>"><a href="OffAlarm.al?num=<%=map.get("num")%>"><%=map.get("content")%></a> </li>
<%} %> 
</ul>
<%if(list.size()>5){%>
<input type="button" value="더보기" onclick="location.href='AlarmList.al'">
<%}} %>
</body>
</html>