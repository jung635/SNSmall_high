<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet"> 
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
var loading= false;
limit = 20;

$(document).ready(function(){
	alarmViewMore(limit)
});


alarmViewMore(limit);

$(window).scroll(function() {
    if (!loading && ($(window).scrollTop() >  $(document).height() - $(window).height() - 100)) {
        loading= true;
		limit += 5;
        alarmViewMore(limit);

        loading = false; // reset value of loading once content loaded
    }
});
function alarmViewMore(limit){
	var xhttp;    
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
            var alarm_msg = this.responseText;  
            document.getElementById("alarm_list_box").innerHTML = alarm_msg; 
		}
	};
	xhttp.open("GET", 'AlarmList.al?limit='+limit, true);
	xhttp.send();	
}
</script>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<%String id = (String)session.getAttribute("id");
String type = (String)session.getAttribute("type");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm");
%>
<div class="container">
	<div class="more_content">
		<div class="row">
            <div class="col-md-3"">
                <p class="lead"><%=id %></p>
                <%if(type.equals("client")){ %>
                	<jsp:include page="../inc/myinfo_client_left.jsp"/>
                <%}else if(type.equals("vendor")){ %>
               	 	<jsp:include page="../inc/myinfo_vendor_left.jsp"/>
                <%}else if(type.equals("sns")){ %>
                 	<jsp:include page="../inc/myinfo_sns_left.jsp"/>
                <%} %>
            </div>
            <div class="col-md-9" id="alarm_list_box" style="text-align: center;">
            
            </div>
		</div>
	</div>
</div>
</body>
</html>