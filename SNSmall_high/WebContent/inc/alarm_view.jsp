<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function _CloseOnEsc() {  
    if (event.keyCode == 27) { window.close(); return; }  
  }  
  function Init() {  
    document.body.onkeypress = _CloseOnEsc;  
  }  
  function Set(url) {  
      if(opener!=null){  
          opener.location.href = url;   
      }else{  
          var opener_win = dialogArguments;  
          opener_win.location.href = url;   
      }  
      window.close();  
  }  
  function popupResize(){   
      var pop_width = document.body.scrollWidth + 30;   
      var pop_height = document.body.scrollHeight + 60;   
      if(pop_width>800) pop_width = 800;   
      if(pop_height>500) pop_height = 500;   
      window.resizeTo(pop_width,pop_height);   
  }  
</script>  

</head>
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

<ul>
<%for(int i=0; i<limit; i++){
	map = list.get(i);
	if(map.get("state").equals("on")){
		color = "#0a8dff";
	}else if(map.get("state").equals("now")){
		color = "red";
	}else{
		color = "#ddd";
	}
%>
	<li style="background-color: <%=color%>"><%=map.get("content")%> </li>
<%} %> 
</ul>
<%if(list.size()>5){%>
<input type="button" value="더보기">
<%}} %>
</body>
</html>