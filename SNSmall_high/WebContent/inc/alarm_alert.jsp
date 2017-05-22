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
<%if(list == null){
%>
nothing
<%}else{
	if(list.size()<5) limit = list.size();
	else limit = 5;%>
<div style="float:right;"><input type="button" value="X" onclick="offAlert()"></div>
<ul id="alert_view_ul">

<%for(int i=0; i<limit; i++){
		map = list.get(i);%>

	<li><a href="OffAlarm.al?num=<%=map.get("num")%>"><%=map.get("content") %></a></li>
<%} %>
</ul>
<%if(list.size()>5){%>
<input type="button" value="더보기">
<%} %>
<%} %>

</body>
</html>