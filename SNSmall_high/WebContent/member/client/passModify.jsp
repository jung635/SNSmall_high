<%@page import="web.product.db.ProductBean"%>
<%@page import="java.util.List"%>
<%@page import="web.client.db.ClientDAO"%>
<%@page import="web.client.db.ClientBean"%>
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
	<link href="./css/header.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet"> 
<title>Insert title here</title>
<script type="text/javascript">
var pass_reg =/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~,!,@,#,$,*,(,),=,+,_,.,|]).{8,20}$/;
 		function fun1() {
 		//////��й�ȣ ���� üũ
 		 	if(document.fr.pass.value==""){
 		 		alert("��й�ȣ�� �Է��� �ּ���!");
 		 		document.fr.pass.focus();
 		 		return false;
 		 	}else if(!pass_reg.test(document.fr.pass.value)){
 		 		alert("��й�ȣ�� ������, ����, Ư������ ���� 8-20�ڸ��� �������ּ���.");
 		 		document.fr.pass.focus();
 		 		return false;
 		 	}
 			//////��й�ȣ ��ġ üũ
 		 	if(document.fr.pass2.value==""){
 		 		alert("��й�ȣ�� Ȯ���� �ּ���!");
 		 		document.fr.pass2.focus();
 		 		return false;
 		 	}if(document.fr.pass.value!=document.fr.pass2.value){
 		 		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�!");
 		 		document.fr.pass2.focus();
 		 		return false;
 		 	}
 		}
 		
 		//��й�ȣ ��ġ üũ ���÷���
 		 function passCheck(){
 		 	if(document.fr.pass.value==document.fr.pass2.value){
 		 		document.getElementById("passdbCheckDisplay").innerHTML="��й�ȣ�� ��ġ�մϴ�";
 		 	}else{
 		 		document.getElementById("passdbCheckDisplay").innerHTML="��й�ȣ�� ��ġ���� �ʽ��ϴ�.";	
 		 }	
 		 }

 		//��й�ȣ ���� üũ ���÷���
 		 function passFormCheck(){
 		 	var pwd=document.fr.pass.value;
 		 	
 		 	if(!pass_reg.test(pwd)){
 		 		document.getElementById("passCheckDisplay").innerHTML="��й�ȣ�� ������, ����, Ư������ ���� 8-20�ڸ��� �������ּ���.";	
 		 	}else{
 		 		document.getElementById("passCheckDisplay").innerHTML="OK!";	
 		 		
 		 	}
 		 }
 </script>
</head>
<body>
<jsp:include page="../../inc/header.jsp"/>
	<%
		String id = (String) session.getAttribute("id");
	%>
	<!-- Page Content -->
  <div class="container">
    <div class="more_content">
    <!-- Page Content -->
        <div class="row">
        
            <div class="col-md-3">
<%--                 <p class="lead"><%=id %></p> --%>
                <jsp:include page="../../inc/myinfo_client_left.jsp"/>               
            </div>
            <div class="col-md-9">
                <!-- ���� ���� -->
                <div class="thumbnail">
						<form action="./passModifyAction.cl" id="join" method="post"
							name="fr" onsubmit="return fun1()">
							
							<fieldset>
								<legend>��й�ȣ ����</legend>
								<input type="hidden" name="id" value="<%=id%>">								
								<label>�� ��й�ȣ �Է�</label> <input type="password" name="pass" onkeyup="passFormCheck()"
									required><span id="passCheckDisplay"></span><br>
								<label>�� ��й�ȣ Ȯ��</label> <input type="password" name="pass2" onkeyup="passCheck()"
									required><span id="passdbCheckDisplay"></span><br>
							</fieldset>

							<div id="buttons">
								<input type="submit" value="Ȯ��" class="submit"> <input
									type="reset" value="���" class="cancel" onclick="history.back()">
							</div>
						</form>
				</div>
				<!-- ���� ���� -->
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