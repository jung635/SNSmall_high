<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
List<Map<String, Object>> list = (List)request.getAttribute("list"); 
Map<String, Object> map = new HashMap<String, Object>();
String color = "";
int limit = 0;%>
<%if(list == null){%>
<%}else{
	if(list.size()<5) limit = list.size();
	else limit = 5;%>


<%for(int i=0; i<limit; i++){
		map = list.get(i);%>
	<div id="alarm" style="top: <%=i*65+30%>px;"><a href="#" onclick="offAlarm(<%=map.get("num")%>)"><%=map.get("content") %></a><div style="float:right;"><input type="button" value="X" onclick="onAlarm(<%=map.get("num")%>)"></div></div><br>
<%} %>
<%if(list.size()>5){%>
<input type="button" value="더보기">
<%} %>
<%} %>

</body>
</html>