<%@page import="java.text.SimpleDateFormat"%>
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
	<link href="./css/memo.css" rel="stylesheet">  
	
	
<title>Insert title here</title>
<script type="text/javascript">
function snsStatefn() {
    /*var State = document.getElementById("snsState").value;
    document.getElementById("snselected").innerHTML = "You selected: " + snsState;*/
    
    document.frmSearch.submit();
}

function fncheckdelete(para_getNum){
	
	if(confirm("판매내역을 삭제하시겠습니까?")){
		if(para_getNum!=""){
			document.frmdelete.num.value=para_getNum;
			/* document.write("document.frmdelete.num.value : " +document.frmdelete.num.value); */
			document.frmdelete.submit();
		}else{
			alert("판매내역이 이상");
			return;
		}
	}else{
		return;
	}
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
                <%-- <p class="lead"><%=id %></p> --%>
                <jsp:include page="../inc/myinfo_sns_left.jsp"/>
            </div>
            <div class="col-md-9">

<%
// 세션 가져오기

// 세션이 없으면 또는 세션이 admin이 아니면 main.jsp 이동
//if(id ==null ){
// 	response.sendRedirect("./Main.me");
//}

// request에 저장된 memberList 가져오기
List paymentList = (List)request.getAttribute("paymentList");
String pageNum=(String)request.getAttribute("pageNum");
String snsState=(String)request.getAttribute("snsState");
if(snsState==null){snsState="";}
int currentPage=Integer.parseInt(pageNum);
int count=((Integer)request.getAttribute("count")).intValue();
int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
int startPage=((Integer)request.getAttribute("startPage")).intValue();
int endPage=((Integer)request.getAttribute("endPage")).intValue();
int addPoint=0;
SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");

%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">판매내역 목록
            <small></small>
        </h1>
     </div>
</div>
<div class="row">
<form action="SnsSale.sn" method="post" name="frmSearch">
<%-- <%=snsState %> --%>
<select id="snsState" name="snsState" onchange="snsStatefn()">
  <option value="" <%if(snsState.equals("")){ %> selected <%}  %>>정렬방법을 선택하세요
  <option value="payDone" <%if(snsState.equals("payDone")){ %> selected <%}  %>>주문 내역</option>
  <option value="delivery" <%if(snsState.equals("delivery")){ %> selected <%}  %>>배송중</option>
  <option value="done" <%if(snsState.equals("done")){ %> selected <%}  %>>배송완료</option>
  <option value="cancel" <%if(snsState.equals("cancel")){ %> selected <%}  %>>주문취소</option>
  <option value="cancelHold" <%if(snsState.equals("cancelHold")){ %> selected <%}  %>>취소신청</option>
  <option value="waiting" <%if(snsState.equals("waiting")){ %> selected <%}  %>>무통장입금</option>
</select><br><br>
</form>

	<table>
<!-- 		<tr bgcolor="orange">
		<td>상품</td><td>상품</td>
		<td>상품</td><td>상품</td>
		<td>날짜</td><td>주문번호</td>
		<td>옵션1</td><td>옵션2</td><td>옵션3</td>
		<td>사용된포인트</td><td>상태표시</td>
		</tr> -->

<%
	//String snsState="";
	try{
		if(paymentList.size()!=0){
			for(int pay=0; pay < paymentList.size(); pay++){
				//PaymentBean pab= 한칸의 데이터 가져와서 저장 .get()
				PaymentBean pab = (PaymentBean)paymentList.get(pay);
				//System.out.println("pay : "+pay);
				if(pay==0||pay%4==0){%>
			<tr>
			<%}%>
				<td id="product">
				  <ul>
					<li>상품번호 : <%=pab.getProduct_num()%></li>
					<%
					ProductBean prb= new ProductBean();
					ProductDAO prdao = new ProductDAO();
					prb = prdao.getProduct(pab.getProduct_num());
					//System.out.println("Payment_num() : "+pab.getProduct_num());
					//System.out.println("Product_num() : "+prb.getProduct_num());
					
					%>
					<%-- <li>아이디 : <%=pab.getSns_id()%></li> --%>
					<%-- <li>메인 이미지 : <img src="./vendor_img/<%=prb.getMain_img() %>" ></li>
					<li>디테일이미지 : <img src="./vendor_img/<%=prb.getDetail_img() %>" ></li> --%>
					<li>수량 : <%=pab.getAmount()%></li>
					<li>메시지 : <%=pab.getMessage()%></li>
					<li>날짜 : <%=sdf.format(pab.getDate())%></li>
					<li>주문번호 : <%=pab.getOrder_num()%></li>
					<li>옵션1 : <%=pab.getOption1()%></li>
					<li>옵션2 : <%=pab.getOption2()%></li>
					<li>옵션3 : <%=pab.getOption3()%></li>
					<li>사용된포인트 : <%=pab.getUsedPoint()%></li>
					<%-- <li>상태표시 : <%=pab.getState()%></li> --%>
						<input type="button" value="상세보기" onclick="location.href='SnsSaleDetailAction.sn?num=<%=pab.getProduct_num()%>'">
						<input type="button" value="삭제하기" onclick="javascript:fncheckdelete(<%=pab.getProduct_num()%>);">
					
  				</ul>
				</td>
			<%if(pay%4==3){ %>
			</tr>
			<%
			}}
		}else{
		%>
		<tr><td colspan=4>판매내역이 없습니다.</td></tr>
		<%
		}
	}catch(Exception e){e.printStackTrace();}	
	//System.out.println("addPoint : "+addPoint);
%>
<%-- 		<tr align="center">
			<td id="accPoint">누적<br>포인트</td>
			<td></td>
			<td><%=addPoint %>P</td>
			<td><%=count %>개</td>
		</tr> --%>
	</table>
	
	<form action="./snsSaleDeleteAction.sn?pageNum=<%=pageNum %>" method="post" name="frmdelete" >
       <input type="hidden" name="num" value="">
	</form>
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
		%><li><a href="SnsSale.sn?pageNum=<%=startPage-pageBlock%>">&laquo;</a></li>&nbsp;<%
	}
	//1...10   11...20   21...30
	for(int i=startPage; i<=endPage; i++){
		if(i==currentPage){%>
                    <li class="active">
                        <a href="#"><%=i %></a>
                    </li>
                    <%}else{ %>
                    <li><a href="SnsSale.sn?pageNum=<%=i%>&snsState=<%=snsState%>">[<%=i%>]</a></li>
                    <%}}
	//다음 페이지
	if(endPage<pageCount){ //엔트페이지가 페이지블록보다 작을 때
		%><li><a href="SnsSale.sn?pageNum=<%=startPage+pageBlock%>">&raquo;</a></li><%
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
