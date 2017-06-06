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
<script>
var token;
window.fbAsyncInit = function() {
	FB.init({
      appId            : '1685211914841647',
      autoLogAppEvents : true,
      xfbml            : true,
      version          : 'v2.9'
    });
    FB.AppEvents.logPageView();
};

(function(d, s, id) {
   var js, fjs = d.getElementsByTagName(s)[0];
   if (d.getElementById(id)) return;
   js = d.createElement(s); js.id = id;
   js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.9&appId=1685211914841647";
   fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk'));

function getLive(id, token){
	 FB.api(id, function (response) {
	    	console.log(response);
	    	console.log(token);
	    	 // alert(accessToken);
	    	//alert(response.status);
	      if (response && !response.error) {
	        //alert(response);
	        document.getElementById('live').innerHTML=response.embed_html;
	      }
	    },{access_token: token});
 }

</script>

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
			<td><%=lb.getVideo_id() %></td><td><button onclick="getLive('<%=lb.getVideo_id()%>', '<%=lb.getToken()%>')">방송 보러 가기</button></td>
		</tr>
	</table>
<%} %>
<div id="live"></div>
</body>
</html>