<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div class="list-group">
	<div id="showbtn">
		<a href="PayList.pa" class="list-group-item showbtn">내 정보</a>
		<div id="show_content">
			<a href="#"  class="list-group-item">내 정보 확인</a>
			<a href="#"  class="list-group-item">내 정보 수정</a>
			<a href="#"  class="list-group-item">회원 탈퇴</a>
		</div>
	</div>
	
	<%
			String type= (String)session.getAttribute("type");
			System.out.println(type);
			if(type.equals("sns")){ %>
				<div id="showbtn">
				<a href="PayList.pa" class="list-group-item showbtn">내 정보</a>
			<div id="show_content">
				<a href="MyPage.sn"  class="list-group-item">내 정보 확인</a>
				<a href="passConfirm.sn"  class="list-group-item">내 정보 수정</a>
				<a href="#"  class="list-group-item">회원 탈퇴</a>
			</div>
			</div>
			<%} %>
	
	<a href="PayList.pa" class="list-group-item">주문 내역</a>
	<a href="ZzimList.zz" class="list-group-item">찜 목록</a>
	<a href="CartList.ca" class="list-group-item">장바구니</a>
	<a href="SnsSale.sn" class="list-group-item">SNS 판매내역</a>
	<a href="CancelList.ve" class="list-group-item">취소 내역(vendor)</a>
	<a href="DepositList.ve" class="list-group-item">디파짓 내역(vendor)</a>
</div>
  
