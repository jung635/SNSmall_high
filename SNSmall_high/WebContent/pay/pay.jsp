<%@page import="java.util.Date"%>
<%@page import="web.client.db.ClientDAO"%>
<%@page import="web.client.db.ClientBean"%>
<%@page import="java.util.List"%>
<%@page import="web.product.db.ProductDAO"%>
<%@page import="web.product.db.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">

<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
String type = (String)session.getAttribute("type");
String product_str = request.getParameter("product_num");
String amount_str = request.getParameter("amount"); //갯수
String vendorId_str = request.getParameter("vendor_id");
String cart_str = "";
if(request.getParameter("cart_num") != null){
	cart_str = request.getParameter("cart_num");
}
System.out.println("cart_num: "+ cart_str);
String option1_str = "";
String option2_str = "";
String option3_str = "";
if(request.getParameter("option1")!=null){
	option1_str = request.getParameter("option1");
}
if(request.getParameter("option2")!=null){
	option2_str = request.getParameter("option2");
}
if(request.getParameter("option3")!=null){
	option3_str = request.getParameter("option3");
}

String snsId_str = request.getParameter("sns_id");
ClientBean cb = new ClientBean();
ClientDAO cdao = new ClientDAO();
cb = cdao.getMember(id);
String merchant_uid="high_" + new Date().getTime();
%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script>
var method;
var price;
var point=0;
var message;
var address;
//결제 제어
function pay(){
	document.getElementById("usingPoint").defaultValue = "0";
	if($("input:checkbox[id='policyChecked1']").is(":checked")){
		if($("input:checkbox[id='policyChecked2']").is(":checked")){
			method = $(":input:radio[name=method]:checked").val();
			if(method == null) alert("결제수단을 결정해주세요");
			else if(method == 'card') card();
	 		else if(method == 'deposit') deposit();
	 		else if(method == 'withPoint') withPoint();
		 }else{alert("개인정보 제공에 동의해주세요");}
	}else{alert("결제수단에 동의해 주세요");}
}

//카드 결제
function card(){
	price = document.getElementById('price').innerText;
	price_result = document.getElementById('price_result').innerText;
	point = document.getElementById('usingPoint').value;
	message = document.getElementById('message').value;
	address = document.getElementById('address').value;
	IMP.init('imp29540450');
	IMP.request_pay({
	    pg : 'danal_tpay', //아임포트 관리자에서 danal_tpay를 기본PG로 설정하신 경우는 생략 가능
	    pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
	    merchant_uid : '<%=merchant_uid %>', //상점에서 관리하시는 고유 주문번호를 전달
	    name : '결제 진행중',
	    buyer_email : '<%=cb.getEmail()%>',
	    buyer_name : '<%=cb.getName()%>',
	    buyer_tel : '<%=cb.getPhone()%>', //누락되면 카드사 인증에 실패할 수 있으니 기입해주세요
	    buyer_addr : '<%=cb.getAddress()%>',
	    amount : price_result,
	   custom_data: {
		   price : price,
		   amount_str : '<%=amount_str%>',
		   product_str : '<%=product_str%>',
		   point : point,
		   vendorId_str : '<%=vendorId_str%>',
		   snsId_str : '<%=snsId_str%>',
		   message : message,
		   option1_str : '<%=option1_str%>',
		   option2_str : '<%=option2_str%>',
		   option3_str : '<%=option3_str%>',
		   method : method,
		   address : address,
		   cart_str : '<%=cart_str%>'
	   }
	}, function(rsp) {
	    if ( rsp.success ) {
	    	console.log(rsp);
	    	$.ajax({
	    		url: 'PayCompleteAction.pa',
	    		type: 'POST',
	    		data: {
	        		merchant_uid : rsp.merchant_uid,
	        		price : rsp.custom_data.price,
	        		amount_str : rsp.custom_data.amount_str,
	        		product_str : rsp.custom_data.product_str,
	        		point : rsp.custom_data.point,
	        		vendorId_str : rsp.custom_data.vendorId_str,
	        		snsId_str : rsp.custom_data.snsId_str,
	        		message : rsp.custom_data.message,
	        		option1_str : rsp.custom_data.option1_str,
	        		option2_str : rsp.custom_data.option2_str,
	        		option3_str : rsp.custom_data.option3_str,
	        		method : rsp.custom_data.method,
	        		address : rsp.custom_data.address,
	        		cart_str : rsp.custom_data.cart_str,
	    		},
	    		success : function(result, status){
	    			console.log(result);
	    			console.log(status);
	    			location.href="./PayDone.pa?merchant_uid="+rsp.merchant_uid;
	    		},
	    		error: function(xhr, status, error){
	    			console.log(xhr);
	    			console.log(status);
	    			console.log(error);
	    		}
	    	});
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        alert(msg);
	    }
	});
}

//무통장 입금
function deposit(){
	window.open("about:blank", "deposit_view" , "width=500,height=500");
	document.fr.action="Deposit.pa";
	document.fr.target="deposit_view";
	document.fr.method="post";
	document.fr.submit();
}

function withPoint(){
	document.fr.action="PayCompleteAction.pa";
	document.fr.method="post";
	document.fr.submit();
}

//포인트 변경
function pointChanged(price, myPoint){
	point =  document.getElementById('usingPoint').value;
	if(price==point){
		alert('전액을 포인트로 계산합니다.');
		document.getElementById('price_result').innerText = price-point;
		document.getElementById('myPoint').innerText = myPoint-point;
		document.getElementById('withPoint').checked = true;
	}
	if(price-point<0){
		alert('포인트를 상품 가격 이상으로 사용하실 수 없습니다.');
		document.getElementById('usingPoint').value = 0;
		document.getElementById('myPoint').innerText = myPoint;
		document.getElementById('withPoint').checked = false;
	}else if(myPoint-point<0){
		alert('포인트가 부족합니다.');
		document.getElementById('usingPoint').value = 0;
		document.getElementById('myPoint').innerText = myPoint;
		document.getElementById('withPoint').checked = false;
	}else{
		document.getElementById('price_result').innerText = price-point;
		document.getElementById('myPoint').innerText = myPoint-point;
		document.getElementById('withPoint').checked = false;
	}
}

function allPointPay(){
	point =  document.getElementById('usingPoint').value;
	myPoint = document.getElementById('myPoint').innerText;
	price = document.getElementById('price').innerText;
	
	if(price-myPoint>0){
		alert('포인트가 부족합니다.');
		document.getElementById('usingPoint').value = 0;
		document.getElementById('withPoint').checked = false;
	}else{
		alert('전액을 포인트로 계산합니다.');
		document.getElementById('price_result').innerText = 0;
		document.getElementById('myPoint').innerText = myPoint-price;
		document.getElementById('usingPoint').value =price;
	}
	
	
}


function addressFind() {
	new daum.Postcode({
		oncomplete: function(data) {
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

  			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
			}

			if(data.userSelectedType === 'R'){
				if(data.bname !== ''){
					extraAddr += data.bname;
			}
			if(data.buildingName !== ''){
				extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
  				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}
			document.getElementById('address').value = fullAddr + '('+ data.zonecode + ')';
			document.getElementById('address').focus();
		}
	}).open();
}
</script>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<!-- Page Content -->
<%
String[] option1 = option1_str.split(",");
String[] option2 = option2_str.split(",");
String[] option3 = option3_str.split(",");
String[] amount = amount_str.split(",");
String[] product_num = product_str.split(",");
ProductDAO pdao = new ProductDAO();
int price=0;
String address = cdao.getMember(id).getAddress();
%>

<div class="container">
	<div class="content">
		<form action="" name="fr">
		<input type="hidden" name="amount_str" value='<%=amount_str %>'>
		<input type="hidden" name="product_str" value='<%=product_str %>'>
		<input type="hidden" name="vendorId_str" value='<%=vendorId_str %>'>
		<input type="hidden" name="snsId_str" value='<%=snsId_str %>'>
		<input type="hidden" name="option1_str" value='<%=option1_str %>'>
		<input type="hidden" name="option2_str" value='<%=option2_str %>'>
		<input type="hidden" name="option3_str" value='<%=option3_str %>'>
		<input type="hidden" name="merchant_uid" value='<%=merchant_uid %>'>
		<input type="hidden" name="cart_str" value='<%=cart_str %>'>
		<div id="title">
			<h1>주문/결제</h1>
			<hr>
  		</div>
		<div id="user_info">
	  		<div id="title_in"><h2>구매자 정보</h2></div>
			<table id="buyer" border="1">
				<tr><td style="width: 150px;">이름</td><td>정선주</td></tr>
				<tr><td>배송주소</td><td><input type="text" name="address" id="address" value="<%=address%>"><input type="button" onclick="addressFind()" value="우편번호 찾기"></td></tr>
				<tr><td>연락처</td><td>010-000-0000</td></tr>
				<tr><td>배송 요청 메세지</td><td><input type="text" id="message" name="message"></td></tr>
			</table>
		</div>
		<div id="product_info">
			<div id="title_in"><h2>상품 정보</h2></div>
			<table id="product" border="1">
				<tr><th rowspan="<%=product_num.length+1 %>"  style="width: 150px;">배송상품</th><th>배송상품 이름</th><th>수량</th><th>가격</th></tr>
	 			<%for(int i=0; i<product_num.length; i++){ 
	 				String option_all = "";
					ProductBean pb = pdao.getProduct(Integer.parseInt(product_num[i]));
 					if(i<option1.length && option1[i].trim().length()>0){
						option_all += option1[i]+"/";
					}
					if(i<option2.length && option2[i].trim().length()>0){
						option_all += option2[i]+"/";
					}
					if(i<option2.length && option3[i].trim().length()>0){
						option_all += option3[i]+"/";
					}
					if(option_all.length()>0) option_all = option_all.substring(0,option_all.length()-1); 
					%>
	 				<tr><td><%=pb.getSubject() %>(<%=option_all %>)</td><td><%=amount[i] %></td><td><%=pb.getPrice()*Integer.parseInt(amount[i]) %></td></tr>
					<%price += pb.getPrice()*Integer.parseInt(amount[i]);} %>
			</table>
		</div>
		<div id="product_info">
			<div id="title_in"><h2>결제 정보</h2></div>
			<table id="pay" border="1">
				<tr><td style="width: 150px;">상품가격</td><td><%=price %></td></tr>
				<tr><td>포인트사용</td><td><input type="number" id="usingPoint" name="point" onkeyup="pointChanged(<%=price%>,<%=cb.getPoint()%>)"><span style="float: right;" id="myPoint"><%=cb.getPoint() %></span></td></tr>
				<tr><td>총 금액</td><td><span id="price"><%=price %></span></td></tr>
				<tr><td>결제 할 금액</td><td><span id="price_result"><%=price %></span></td></tr>
				<tr><td>결제방법</td>
					<td><input type="radio" value="card" name="method">신용카드
	            		<input type="radio" value="deposit" name="method">무통장입금
	            		<input type="radio" value="withPoint" id="withPoint" name="method" onclick="allPointPay()">전액 포인트 결제
				</tr>
			</table>
			<input type="hidden" name="price" value='<%=price %>'>
			<input type="checkbox" id="policyChecked1">선택한 결제수단으로 향후 결제 이용에 동의합니다. (선택)
		</div>
		<div id="policy">
			<div id="policy1">
			<p>
				 개인정보 제 3자 제공 동의
				회원의 개인정보는 당사의 개인정보취급방침에 따라 안전하게 보호됩니다.
				“회사”는 이용자들의 개인정보를 "개인정보 취급방침의 개인정보의 수집 및 이용목적"에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다.
				회사가 제공하는 서비스를 통하여 주문 및 결제가 이루어진 경우 구매자 확인 및 해피콜 등 거래이행을 위하여 관련된 정보를 필요한 범위 내에서 거래 업체에게 제공합니다.
				상품명
				제공받는자	제공목적	제공정보	보유 및 이용기간
				워너비스톤 여성용 블루밍 쉘플라워 귀걸이, 골드
				워너비스톤	서비스 제공, 사은행사, 구매자확인, 해피콜	성명, 휴대전화번호(또는 안심번호), 배송지주소, 이메일
				※ 구매자와 수취인이 다를 경우에는 수취인의 정보(해외 배송 상품은 개인통관고유부호 또는 여권번호 포함)가 제공될 수 있습니다.	재화 또는 서비스의 제공이 완료된 즉시 파기 (단, 관계법령에 정해진 규정에 따라 법정기간 동안 보관)
				※ 동의 거부권 등에 대한 고지
				개인정보 제공은 서비스 이용을 위해 꼭 필요합니다. 개인정보 제공을 거부하실 수 있으나, 이 경우 서비스 이용이 제한될 수 있습니다.
			</p>
			</div>
			<div id="policy1_check"><input type="checkbox" id="policyChecked2">본인은 개인정보 제3자 제공 동의에 관한 내용을 모두 이해하였으며 이에 동의합니다.</div>
		</div>
		<div style="text-align: center; margin-top: 50px;">
			<input type="button" value="결제하기" onclick="pay()">
		</div>
	
		</form>
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
<!-- /.container -->
</body>
</html>