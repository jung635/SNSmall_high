<%@page import="web.vendor.db.VendorBean"%>
<%@page import="web.product.db.ProductBean"%>
<%@page import="java.util.List"%>
<%@page import="web.client.db.ClientDAO"%>
<%@page import="web.client.db.ClientBean"%>
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
	<link href="./css/member.css" rel="stylesheet"> 
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="./js/jquery.js"></script>
<script type="text/javascript">
var pass_reg = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~,!,@,#,$,*,(,),=,+,_,.,|]).{10,20}$/;
//우편번호 검색
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('address2').focus();
        }
    }).open();
}

//비밀번호변경
$(document).ready(function() {
	$('#passChange').click(function() {
		$('#passChWall').toggle('fast',function(){
		});
		$(this).next().toggle('fast', function() {
		});
	});
});

function passCheckSubmit(){
//////비밀번호 유형 체크
	if (document.pr.newpass.value == "") {
		alert("비밀번호를 입력해주세요");
		document.pr.newpass.focus();
		return false;
	} else if (!pass_reg.test(document.pr.newpass.value)) {
		alert("비밀번호는 영문, 숫자, 특수문자 조합 10-20자리로 구성해주세요.");
		document.pr.newpass.focus();
		return false;
	}
	//////비밀번호 일치 체크
	if (document.pr.newpass2.value == "") {
		alert("비밀번호를 다시한번 입력해주세요");
		document.pr.newpass2.focus();
		return false;
	}else if(document.pr.newpass.value != document.pr.newpass2.value) {
		alert("비밀번호가 일치하지 않습니다");
		document.pr.newpass2.focus();
		return false;
	}
}

//비밀번호 일치 체크 디스플레이
function passCheck() {
	if (document.pr.newpass.value == document.pr.newpass2.value) {
		document.getElementById("passdbCheckDisplay").innerHTML = "비밀번호가 일치합니다";
	} else {
		document.getElementById("passdbCheckDisplay").innerHTML = "비밀번호가 일치하지 않습니다.";
	}
	
	
}

//비밀번호 유형 체크 디스플레이
function passFormCheck() {
	var pwd = document.pr.newpass.value;

	if (!pass_reg.test(pwd)) {
		document.getElementById("passCheckDisplay").innerHTML = "영문,숫자,특수문자 조합 10-20자리로 구성해주세요.";
	} else {
		document.getElementById("passCheckDisplay").innerHTML = "OK!";

	}
}
</script>
</head>
<body>
<jsp:include page="../../inc/header.jsp"/>
	<%
		/* 아이디 없을경우 제어 구간 */
		String id = (String) session.getAttribute("id");
		
		if (id == null) {
			response.sendRedirect("./login.ve");
		}
		/* 아이디 없을경우 제어 구간 */
		VendorBean vb = (VendorBean)request.getAttribute("vb");
		String postcode = (String)request.getAttribute("postcode");
		String address = (String)request.getAttribute("address");
		String address2 = (String)request.getAttribute("address2");
	%>
	<!-- Page Content -->
  <div class="container">
    <div class="more_content">
    <!-- Page Content -->
        <div class="row">
        
            <div class="col-md-3">
<%--                 <p class="lead"><%=id %></p> --%>
                <jsp:include page="../../inc/myinfo_vendor_left.jsp"/>               
            </div>
            <div class="col-md-9">
            		 <div style="margin: 50px 0 50px 0">
				<div class="top-subject">내 정보 수정</div>	
						
							
							<div class="col-md-12 table-liner-top">
								<div class="col-md-4 table-colorBg-top">
									<span class="table-txt">아이디</span>
								</div>
								<div class="col-md-4 pass-conf-text"><%=id %></div>
								<div class="col-md-4"></div>
							</div>
						
							<div class="col-md-12 table-liner">
								<div class="col-md-4 table-colorBg">
									<span class="table-txt">비밀번호</span><span id="passChWall"
										style="display: none;"><br><br><br><br><br><br><br><br><br>
									<br></span>
								</div>
								<div class="col-md-4 pass-conf-text">
									<input type="button" id="passChange" value="비밀번호 변경" class="dup4" style="margin-top: 0px;">
									<div style="display: none;">
									<form action="./passModifyAction.ve" name="pr" onsubmit="return passCheckSubmit()">
											new password &nbsp;&nbsp; <input type="password"
												name="newpass" id="newpass" onkeyup="passFormCheck()"><br>
											<span id="passCheckDisplay"></span><br> retype password<input
												type="password" id="newpass2" name="newpass2"
												onkeyup="passCheck()"><br> <span
												id="passdbCheckDisplay"></span><br> <input
												type="submit" value="변경" class="dup4">
										</form>
									</div>
								</div>
								<div class="col-md-4"></div>
							</div>
							
							<form action="./vendorUpdateAction.ve" id="vendor" method="post"
								name="fr">
							
							<div class="col-md-12 table-liner">
								<div class="col-md-4 table-colorBg">
									<span class="table-txt">이름</span>
								</div>
								<div class="col-md-4 pass-conf-txt">
									<input type="text" name="name" value="<%=vb.getPerson_name()%>" class="form-control">
								</div>
								<div class="col-md-4"></div>
							</div>
							
							<div class="col-md-12 table-liner">
								<div class="col-md-4 table-colorBg">
									<span class="table-txt">회사명</span>
								</div>
								<div class="col-md-4 pass-conf-txt">
									<input type="text" name="company" class="form-control" value="<%=vb.getCompany_name()%>">
								</div>
								<div class="col-md-4"></div>
							</div>
							
							<div class="col-md-12 table-liner">
								<div class="col-md-4 table-colorBg">
									<span class="table-txt">연락처</span>
								</div>
								<div class="col-md-4 pass-conf-txt">
									<input type="text" name="phone" value="<%=vb.getPhone()%>" class="form-control">
								</div>
								<div class="col-md-4"></div>
							</div>
							
							<div class="col-md-12 table-liner">
								<div class="col-md-4 table-colorBg">
									<span class="table-txt">주소<br><br><br><br><br><br></span>
								</div>
								<div class="col-md-4 pass-conf-txt">
									<input type="text" name="postcode" id="postcode" placeholder="우편번호" value="<%=postcode%>" class="form-control" style="margin-bottom: 5px;">
									<input type="text" name="address" id="address" placeholder="주소" value="<%=address%>" class="form-control" style="margin-bottom: 5px;">
									<input type="text" name="address2" id="address2" placeholder="상세주소" value="<%=address2%>" class="form-control" style="margin-bottom: 5px;">
									
								</div>
								<div class="col-md-4"><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="dup3"></div>
							</div>
					
							<div class="col-md-12">	
								<div class="col-md-4"></div>
								<div class="col-md-4">
									<input type="submit" value="회원 정보 수정" class="colmd-4-btn">
								</div>
								<div class="col-md-4"></div>
							</div>
							
						</form>
					</div>
				</div>	
            </div>
        </div>
    </div>
    <!-- /.container -->
    <div class="container">
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
</body>
</html>