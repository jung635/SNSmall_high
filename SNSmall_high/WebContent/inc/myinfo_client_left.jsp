<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="list-group">
	<div id="showbtn">
		<a href="PayList.pa" class="list-group-item showbtn">내 정보</a>
		<div id="show_content">
			<a href="./clientView.cl"  class="list-group-item">내 정보 확인</a>
			<a href="./passCheck.cl"  class="list-group-item">내 정보 수정</a>
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
	<a href="AlarmListView.al" class="list-group-item">메시지 리스트</a>
</div>
  
