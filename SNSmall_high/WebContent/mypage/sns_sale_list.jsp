<%@page import="web.product.db.ProductBean"%>
<%@page import="web.product.db.ProductDAO"%>
<%@page import="web.payment.db.PaymentDAO"%>
<%@page import="web.payment.db.PaymentBean"%>
<%@page import="java.util.List"%>
<%@page import="web.client.db.ClientDAO"%>
<%@page import="web.client.db.ClientBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
<script type="text/javascript">
function snsStatefn() {
    /* var x = document.getElementById("snsState").value; */
    /* document.getElementById("snselected").innerHTML = "You selected: " + x; */
    document.frmSearch.submit();
}
</script>
<style>
table,th,td {
  border : 1px solid black;
  border-collapse: collapse;
}
th,td {
  padding: 5px;
}
</style>
<script>
var method = "";
var page = 0;
showCustomer("payDone");
function showCustomer(str) {
	method = str;
	page = 6;
	//alert(page);
  var xhttp;    
  if (str == "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("txtHint").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "PayInnerList.pa?method="+str+"&page="+page, true);
  xhttp.send();
}

function more() {
	//alert(method);
	page += 2;
	//alert(page);
  var xhttp;    
  if (method == "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("txtHint").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "PayInnerList.pa?method="+method+"&page="+page, true);
  xhttp.send();
}
</script>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<%
String id = (String)session.getAttribute("id");
/* ClientDAO cdao = new ClientDAO();
ClientBean cb = cdao.getMember(id);
PaymentDAO pdao = new PaymentDAO();
ProductDAO prodao = new ProductDAO();
//List<PaymentBean> pay_list = pdao.getPaymentById(id);
List<PaymentBean> pay_list = (List<PaymentBean>)request.getAttribute("pay_list");
System.out.println(pay_list.size()); */
%>
  <!-- Page Content -->
  <div class="container">
    <div class="more_content">
    <!-- Page Content -->
        <div class="row">
            <div class="col-md-3">
                <p class="lead"><%=id %></p>
                <jsp:include page="../inc/myinfo_sns_left.jsp"/>
            </div>
            <div class="col-md-9">
<!--             <form action=""> 
<select name="order" onchange="showCustomer(this.value)">
<option value="">정렬방법을 선택하세요</option>
<option value="payDone">주문 내역</option>
<option value="delivery">배송중</option>
<option value="done">배송완료</option>
<option value="cancle">주문취소</option>
</select>
</form> -->
<%
// 세션 가져오기
//String id =(String)session.getAttribute("wndms4145");
// 세션이 없으면 또는 세션이 admin이 아니면 main.jsp 이동
// if(id ==null ){
// 	response.sendRedirect("./Main.me");
// }

// request에 저장된 memberList 가져오기
List paymentList = (List)request.getAttribute("paymentList");
String pageNum=(String)request.getAttribute("pageNum");
int currentPage=Integer.parseInt(pageNum);
int count=((Integer)request.getAttribute("count")).intValue();
int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
int startPage=((Integer)request.getAttribute("startPage")).intValue();
int endPage=((Integer)request.getAttribute("endPage")).intValue();
int addPoint=0;

%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">판매내역 목록
            <small>[전체 내역수 : <%=count %>]</small>
        </h1>
     </div>
</div>
<div class="row">
<form action="SnsSale.my" method="post" name="frmSearch">
<select id="snsState" name="snsState" onchange="snsStatefn()">
  <option value="">정렬방법을 선택하세요
  <option value="delay">delay
  <option value="done">done
  <option value="cancel">cancel
  <option value="waiting">waiting
</select><br><br><!-- <div id="snselected"></div> -->
</form>

	<table border=1>
		<tr align="center">
		<td>번호</td><td>아이디</td><td>수량</td><td>메시지</td>
		<td>날짜</td><td>주문번호</td><td>옵션1</td><td>옵션2</td><td>옵션3</td>
		<td>사용된포인트</td><td>상태표시</td></tr>

<%
	for(int i=0; i < paymentList.size(); i++){
		//PaymentBean pab= 한칸의 데이터 가져와서 저장 .get()
		PaymentBean pab = (PaymentBean)paymentList.get(i);
		//부모                                                      자식
		System.out.println("i : "+i);
		addPoint+=pab.getUsedPoint();
%>
		<tr align="center">
		<td><%=pab.getProduct_num()%></td><td><%=pab.getSns_id()%></td><td><%=pab.getAmount()%></td><td><%=pab.getMessage()%></td>
		<td><%=pab.getDate()%></td><td><%=pab.getOrder_num()%></td><td><%=pab.getOption1()%></td><td><%=pab.getOption2()%></td>
		<td><%=pab.getOption3()%></td><td><%=pab.getUsedPoint()%></td><td><%=pab.getState()%></td>
		</tr>
<%
	}
	System.out.println("addPoint : "+addPoint);
%>
		<tr align="center">
		<td>누적포인트</td><td></td><td></td><td></td>
		<td></td><td></td><td></td><td></td>
		<td></td><td><%=addPoint %></td><td></td>
		</tr>
</table>
    <!-- /.container -->
<!--     <div class="container"> -->
    
<div class="row text-center">
<div class="col-lg-12">
<ul class="pagination">

<%
//페이지 출력
if(count!=0){
	//전체 페이지 수 구하기   게시판글  50개 한 화면에 보여줄 글개수 10 => 5 페이지
	//						56개 한 화면에 보여줄 글개수 10 => 5 페이지 + 1(나머지) =>6
	//한 화면에 보여줄 페이지 번호 개수
	//시작페이지 번호 구하기   1~10=>1   11~20=>11   21~30=>21
	//끝페이지 번호 구하기
	//이전 페이지
	if(startPage>pageBlock){ // 스타트페이지가 페이지블럭보다 많을 때
		%><li><a href="SnsSale.my?pageNum=<%=startPage-pageBlock%>">&laquo;</a></li>&nbsp;<%
	}
	//1...10   11...20   21...30
	for(int i=startPage; i<=endPage; i++){
		if(i==currentPage){%>
                    <li class="active">
                        <a href="#"><%=i %></a>
                    </li>
                    <%}else{ %>
                    <li><a href="SnsSale.my?pageNum=<%=i%>">[<%=i%>]</a></li>
                    <%}}
	//다음 페이지
	if(endPage<pageCount){ //엔트페이지가 페이지블록보다 작을 때
		%><li><a href="SnsSale.my?pageNum=<%=startPage+pageBlock%>">&raquo;</a></li><%
	}
}

%>  
</div>
</div>  
    
        <hr>
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>
    </div>
  </div>
    <!-- /.container -->
    <!-- jQuery -->
    
</body>
</html>
