<%@page import="web.product.db.ProductDAO"%>
<%@page import="web.product.db.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="web.cart.db.CartDAO"%>
<%@page import="web.cart.db.CartBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet"> 
<title>Insert title here</title>
<!-- 체크박스에 체크가 되어있으면 function에서 합쳐서 합가격 리턴  -->
<script type="text/javascript">

function myfunction(){
	var sum=0;
	var client_id ="";
	var product_num ="";
	var amount="";
	var vendor_id ="";
	var sns_id="";
	var option1="";
	var option2="";
	var option3="";
	var num="";
	var checklength = document.form1.check.length;
	for(i=0;i<checklength;i++){
		if(document.form1.check[i].checked){
			sum+=parseInt(document.form1.check[i].value);
			client_id += document.form1.client_id_input[i].value+","; 
			product_num += document.form1.product_num_input[i].value+","; 
			amount += document.form1.amount_input[i].value+","; 
			vendor_id += document.form1.vendor_id_input[i].value+","; 
			if((document.form1.sns_id_input[i].value)==null){
				sns_id=" ,";
			}else{
				sns_id += document.form1.sns_id_input[i].value+","; 
			}
			option1	+= document.form1.option1_input[i].value+","; 
			option2 += document.form1.option2_input[i].value+","; 
			option3 += document.form1.option3_input[i].value+","; 
			num += document.form1.num_input[i].value+",";
		}
	}
	document.getElementById("price").innerText=sum;
	document.getElementById("client_id").value=client_id;
	document.getElementById("product_num").value=product_num;
	document.getElementById("amount").value=amount;
	document.getElementById("vendor_id").value=vendor_id;
	document.getElementById("sns_id").value=sns_id;
	document.getElementById("option1").value=option1;
	document.getElementById("option2").value=option2;
	document.getElementById("option3").value=option3;
	document.getElementById("num").value=num;
}


function check1(){
	if(document.form1.amount.value==null){
		
	}else{
		document.form1.submit();
	}
}
</script>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
String type = (String)session.getAttribute("type");

%>
  <!-- Page Content -->
  <div class="container">
    <div class="more_content">
    <!-- Page Content -->
        <div class="row">
        
            <div class="col-md-3">
                <p class="lead"><%=id %></p>
                <%if(type.equals("client")){ %>
                <jsp:include page="../inc/myinfo_client_left.jsp"/>
                <%}else if(type.equals("vendor")){ %>
                <jsp:include page="../inc/myinfo_vendor_left.jsp"/>
                <%} %>
            </div>
            <div class="col-md-9">
<%
List<CartBean> cblist = new ArrayList<CartBean>();
%>
<form action="Pay.pa" method="post" name="form1">

<%
int sum=0;
String client_id ="";
String product_num ="";
String amount="";
String vendor_id ="";
String sns_id="";
String option1="";
String option2="";
String option3="";
String num="";
List cl = (List)request.getAttribute("CartList"); 

ProductDAO pdao = new ProductDAO();




for(int i=0;i<cl.size();i++){
	CartBean cb = (CartBean)cl.get(i);

	int price=cb.getPrice();
	ProductBean prob = pdao.getProduct(cb.getProduct_num()); 
%>
<input type="hidden" name = "num_input" value="<%=cb.getNum()%>">
<input type="hidden" name = "client_id_input" value="<%=cb.getClient_id()%>">
<input type="hidden" name = "product_num_input" value="<%=cb.getProduct_num()%>">
<input type="hidden" name = "amount_input" value="<%=cb.getAmount()%>">
<input type="hidden" name = "vendor_id_input" value="<%=cb.getVendor_id()%>">
<input type="hidden" name = "sns_id_input" value="<%=cb.getSns_id()%>">
<input type="hidden" name = "option1_input" value="<%=cb.getOption1()%>">
<input type="hidden" name = "option2_input" value="<%=cb.getOption2()%>">
<input type="hidden" name = "option3_input" value="<%=cb.getOption3()%>">
<input type="checkbox" name="check" value="<%=cb.getPrice()%>" onchange="myfunction()" checked>

<!-- 장바구니 정보 -->
<a href="ProductDetail.pr?product_num=<%=prob.getProduct_num() %>">
<img src="./vendor_img/<%=prob.getMain_img() %>" height="150px" width="200px">
물품 번호:<%=cb.getProduct_num() %>
품명:<%=cb.getSubject()%>
<%if(cb.getOption1()!=null){
	%>/<%=cb.getOption1()%>
	
	<%}if(cb.getOption2()!=null){ %>
	/<%=cb.getOption2()%>
	<%}if(cb.getOption3()!=null){%>
		/<%=cb.getOption3() %><%
	}

%>

수량:<%=cb.getAmount() %>
가격:<%=cb.getPrice() %>
판매자 아이디 :<%=cb.getVendor_id() %>
구매자 아이디 :<%=cb.getClient_id()%>

</a>
<a href="./Cart_Delete.ca?num=<%=cb.getNum()%>"><input type="button" name="delete" value="삭제"></a>
<br>
<!-- 정보 끝 -->

 <br>
<%sum = sum+price;} 
%>

<br>
총가격 :<span id="price"><%=sum %></span>
<input type="hidden" name = "num" id="num" value="<%=num%>">
<input type="hidden" name = "client_id" id="client_id" value="<%=client_id%>">
<input type="hidden" name = "product_num" id="product_num" value="<%=product_num%>">
<input type="hidden" name = "amount" id="amount" value="<%=amount%>">
<input type="hidden" name = "vendor_id" id="vendor_id" value="<%=vendor_id%>">
<input type="hidden" name = "sns_id" id="sns_id" value="<%=sns_id%>">
<input type="hidden" name = "option1" id="option1" value="<%=option1%>">
<input type="hidden" name = "option2" id="option2" value="<%=option2%>">
<input type="hidden" name = "option3" id="option3" value="<%=option3%>">
<%System.out.println("sum : "+sum); %>
 <br>
	<input type="submit" value="결제하기">
 </form>
</div>
</div>
</div>
</div>




</body>
</html>