<%@page import="web.product.db.ProductBean"%>
<%@page import="web.product.db.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="web.payment.db.PaymentBean"%>
<%@page import="web.payment.db.PaymentDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	<link href="./css/main.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">
<title>Insert title here</title>
<%
List<PaymentBean> pb_list = (List<PaymentBean>)request.getAttribute("pb_list");
List<Integer> cancel_num = (List<Integer>)request.getAttribute("cancel_num"); 
int usedPoint = (Integer)request.getAttribute("usedPoint");
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	check();
});

function check(){
	if('<%=cancel_num.size()%>'==0){
		alert('�̹� ��ҽ�û�� �ϰų� ��ҵ� ��ǰ�� ��ҽ�û�� �Ұ��� �մϴ�.');
		history.back();
	}else if('<%=usedPoint%>'>0){
		alert('����Ʈ�� ����� ����� �ش� ��ǰ �ۼ�Ʈ�� �ش��ϴ� ����Ʈ�� �������� �� �ֽ��ϴ�.');
	}
}
</script>
</head>
<body>
<%
if(cancel_num.size()!=0){ %>
<%
int cancel_point = (Integer)request.getAttribute("cancel_point");
int length = pb_list.size();
String merchant_uid = pb_list.get(0).getOrder_num();
int price = (Integer)request.getAttribute("price");
ProductDAO prodao = new ProductDAO();
String cancel_num_str = "";
%>
<jsp:include page="../inc/header.jsp"/>
  <!-- Page Content -->
  <div class="container">
    <div class="more_content">
		<div id = "pay_check">
		<div><h2>���� ���� Ȯ��</h2></div>
		<table border="1" style="width: 900px; margin: auto;">
			<tr><td rowspan="<%=length+1 %>" style="width: 150px;">�ֹ���ȣ<br><%=merchant_uid%></td><td>��ǰ����</td><td>����</td><td>����</td><td>�� �ݾ�</td></tr>
			<%for(int i=0; i<length; i++){
				PaymentBean pb = pb_list.get(i);
				boolean isCancel = false;
				int product_num = pb.getProduct_num();
				ProductBean prob = prodao.getProduct(product_num);
				for(int j=0; j<cancel_num.size(); j++){
					if(cancel_num.get(j)==product_num){
						cancel_num_str += pb.getNum()+",";
						isCancel = true;
					}
				}
				if(isCancel){%>
					<tr style="font-style: italic; font-weight: bold;"><td><%=prob.getSubject() %>(��һ�ǰ)</td><td><%=prob.getPrice() %></td><td><%=pb.getAmount() %></td><td><%=pb.getAmount()*prob.getPrice() %></td></tr>
				<%}else{%>
					<tr><td><%=prob.getSubject() %></td><td><%=prob.getPrice() %></td><td><%=pb.getAmount() %></td><td><%=pb.getAmount()*prob.getPrice() %></td></tr>
			 <%}}%>
			<tr><td colspan="5" style="text-align: right;">����� ����Ʈ: <%=usedPoint %></td></tr>
			<tr><td colspan="5" style="text-align: right;">�� �ݾ�: <%=price %></td></tr>
	 		<tr><td colspan="5" style="text-align: right; font-style: italic; font-weight: bold; "> ȸ�� ���� ����Ʈ: <%=cancel_point %></td></tr>
	 		<tr><td colspan="5" style="text-align: right;">�� ���� �ݾ�: <%=price-usedPoint %></td></tr>
		</table>
		</div>
	</div>
	<div id="pay_bottom">
		<input type="button" value="���Ÿ��" onclick="location.href='PayList.pa'">
		<input type="button" value="�ֹ� ���" onclick="location.href='PayCancelPoint.pa?num=<%=cancel_num_str%>'">
		<input type="button" value="Ȯ��">
		<%} %>
	</div>
	<!-- Footer -->
	<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; Your Website 2014</p>
			</div>
		</div>
	</footer>
 </div>
</body>
</html>