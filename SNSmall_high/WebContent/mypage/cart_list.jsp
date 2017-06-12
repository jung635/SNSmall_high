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
	<title>SN#</title> 
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/main.css?ver=3002" rel="stylesheet"> 
	<link href="./css/font-awesome.min.css" rel="stylesheet"> 
	<link href="./css/product.css" rel="stylesheet">
<title>Insert title here</title>
<!-- 체크박스에 체크가 되어있으면 function에서 합쳐서 합가격 리턴  -->
<script src="./js/jquery-3.2.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('input[name=check]').click(function(){
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
		$('input[name=check]').each(function(i){
			if($('input[name=check]').eq(i).val()==null){sumtoint=0;}
			
			$('input[name=price]').val(sum);
				if($('input[name=check]').eq(i).is(":checked")){
					client_id+=$('input[name=client_id_input]').eq(i).val()+",";
					$('input[name=client_id]').val(client_id);
					
					var sumtoint = $('input[name=check]').eq(i).val();
					sum+=parseInt(sumtoint);
					$('input[name=price]').val(sum);
					
					product_num+=$('input[name=product_num_input]').eq(i).val()+",";
					$('input[name=product_num]').val(product_num);
					
					amount+=$('input[name=amount_input]').eq(i).val()+",";
					$('input[name=amount]').val(amount);
					
					vendor_id+=$('input[name=vendor_id_input]').eq(i).val()+",";
					$('input[name=vendor_id]').val(vendor_id);
					
					if($('input[name=sns_id_input]').eq(i).val()!=null){
						sns_id+=$('input[name=sns_id_input]').eq(i).val()+",";
						$('input[name=sns_id]').val(sns_id);						
					}
					
					option1+=$('input[name=option1_input]').eq(i).val()+",";
					$('input[name=option1]').val(option1);	
					if($('input[name=option2_input]').eq(null)){
						option2+=" ,";
					}else{
					option2+=$('input[name=option2_input]').eq(i).val()+",";
					$('input[name=option2]').val(option2);
					}
					if($('input[name=option3_input]').eq(null)){
						option3+=" ,";
					}else{
					option3+=$('input[name=option3_input]').eq(i).val()+",";
					$('input[name=option3]').val(option3);	
					}
					num+=$('input[name=num_input]').eq(i).val()+",";
					$('input[name=cart_num]').val(num);	
					
				}
		});
	});
});

function check1(){
	if(document.form1.price.value==0){
		alert("체크된 상품이 없습니다.");
		return false;
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
                <%if(type.equals("client")){ %>
                <jsp:include page="../inc/myinfo_client_left.jsp"/>
                <%}else if(type.equals("vendor")){ %>
                <jsp:include page="../inc/myinfo_vendor_left.jsp"/>
                <%} %>
            </div>
            <div class="col-md-9">
            
              <div style="margin: 50px 0 50px 0">
				<div class="top-subject">
				<span style="color:gray;"><i class="fa fa-shopping-cart" aria-hidden="true"></i></span>
					 장바구니
				</div>
				
				<%List<CartBean> cblist = new ArrayList<CartBean>();%>
				<form action="Pay.pa" method="post" name="form1">
				<table class="cart-table">
				<tr>
						
						<th colspan="3" style="width: 600px;">상품정보</th>
						<th class="cart-pr-amount" width="100px;">수량</th>
						<th colspan="2" style="width: 150px;">상품금액</th>
						</tr>
				
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
					
					if(cl.size()==0){%>
					<tr><td colspan="3" style="border: none; padding: 40px 0 0 80px;;"><i class="fa fa-check" aria-hidden="true"></i>
					 장바구니가 비었습니다.</td><tr>
					<% }
					
					for(int i=0;i<cl.size();i++){
						CartBean cb = (CartBean)cl.get(i);
					
						int price=cb.getPrice();
						ProductBean prob = pdao.getProduct(cb.getProduct_num()); 
					
					%>

						
						<tr>
						<td rowspan="2">
						<input type="hidden" name = "num_input" value="<%=cb.getNum()%>">
						<input type="hidden" name = "client_id_input" value="<%=cb.getClient_id()%>">
						<input type="hidden" name = "product_num_input" value="<%=cb.getProduct_num()%>">
						<input type="hidden" name = "amount_input" value="<%=cb.getAmount()%>">
						<input type="hidden" name = "vendor_id_input" value="<%=cb.getVendor_id()%>">
						<input type="hidden" name = "sns_id_input" value="<%=cb.getSns_id()%>">
						<input type="hidden" name = "option1_input" value="<%=cb.getOption1()%>">
						<input type="hidden" name = "option2_input" value="<%=cb.getOption2()%>">
						<input type="hidden" name = "option3_input" value="<%=cb.getOption3()%>">
						<input type="checkbox" name="check" id="check" value="<%=cb.getPrice()%>" onchange="myfunction()">
						</td>
						<td rowspan="2">
						<a href="ProductDetail.pr?product_num=<%=prob.getProduct_num() %>">
						<img src="./vendor_img/<%=prob.getMain_img() %>" height="120px" width="120px" style="margin: 0 15px 0 15px;">
						</a>
						</td>
						<td class="cart-pro">
						<a href="ProductDetail.pr?product_num=<%=prob.getProduct_num() %>">
						<%=cb.getSubject()%>
						</a>
						</td>
						<td rowspan="2" class="cart-pr-amount"><%=cb.getAmount() %> 개</td>
						<td rowspan="2" class="cart-pri">
							<%=cb.getPrice() %> 원
						</td>
						<td rowspan="2">
						<a href="./Cart_Delete.ca?num=<%=cb.getNum()%>">
								<input type="button" class="del-btn" name="delete" value="×">
							</a>
						</td>
						
						</tr>
						<tr>
						<td>
						
						<%if(cb.getOption1()!=null){
						%><%=cb.getOption1()%>
						<%}if(cb.getOption2()!=null){%>
						<span style="color:#ccc;">　|　</span><%=cb.getOption2()%>
						<%}if(cb.getOption3()!=null){%>
						<span style="color:#ccc;">　|　</span><%=cb.getOption3() %><%
						}%>
						
						</td>
						
						
						</tr>
						<%sum = sum+price;}%>
				
					
					<!-- 정보 끝 -->
				  </table>
				  <div class="col-md-12 go-pay-box">
				 <%=num %>
				  <b>총 상품 가격 :<input type="text" name="price" value="0" readonly>원</b><br>
				  <input type="hidden" name = "cart_num" id="num" value="<%=num%>">
					<input type="hidden" name = "client_id" id="client_id" value="<%=client_id%>">
					<input type="hidden" name = "product_num" id="product_num" value="<%=product_num%>">
					<input type="hidden" name = "amount" id="amount" value="<%=amount%>">
					<input type="hidden" name = "vendor_id" id="vendor_id" value="<%=vendor_id%>">
					<input type="hidden" name = "sns_id" id="sns_id" value="<%=sns_id%>">
					<input type="hidden" name = "option1" id="option1" value="<%=option1%>">
					<input type="hidden" name = "option2" id="option2" value="<%=option2%>">
					<input type="hidden" name = "option3" id="option3" value="<%=option3%>">
				  </div>
				   <div class="col-md-12" style="text-align: center;">
				  <input type="button" value="주문 결제" class="cart-pay-btn" onclick="check1()">
				  </div>
				 </form>
				
			</div>
		</div>
		</div>
	</div>
</div>
</body>
</html>