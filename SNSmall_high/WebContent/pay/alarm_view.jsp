<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%  
String msg = request.getParameter("msg");
System.out.println(msg);
%> 
<style type="text/css">  
a { text-decoration:none; color: black; font-size: 12px;}  
a:Visited {}  
a:Active {}  
a:Hover { text-decoration:none; color:black;font-size: 12px;}  
body,table,td {  font-family: ""; font-size: 12px; }  
.button_normal {font-family:"";font-size:12px;}  
</style>  
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
<%=msg%>  
</body>
</html>