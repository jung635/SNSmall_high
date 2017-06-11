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
	<link href="./css/member.css" rel="stylesheet">  
<title>Insert title here</title>
</head>
<body>
	
<jsp:include page="../inc/header.jsp"/>
  <!-- Page Content -->
  <div class="container">
    <div class="content">

        <!-- Introduction Row -->
        <div class="row">
            <div class="col-lg-12">
            <br>
                <div class="join_subject" style="color:#43484E;">회원가입 
                </div>
                
            </div>
        </div>

        <!-- Team Members Row -->
        <div class="row">
            <div class="col-lg-12">
              <div class="join-mini-subject" style="margin-bottom: 100px;"><h2 style="padding: 2px 0 6px 0;">　Type</h2></div>
            </div>
 
            <div class="col-lg-4 col-sm-6 text-center">
                <a href="clientJoin.cl">
                	<img class="img-circle img-responsive img-center" src="images/join/custom2.gif" alt="">
                </a>
                	<h3>일반회원
                 		<small>Client</small>
                	</h3>
                	<p>일반 회원으로 가입하시면<br> 물품을 구매할 수 있으며,<br> 각종 포인트 혜택을 받으실 수 있습니다.</p>
                
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
            	<a href="vendorJoin.ve">
               		<img class="img-circle img-responsive img-center" src="images/join/vendor2.gif" alt="">
               	</a>
                <h3>판매자
                    <small>Vender</small>
                </h3>
                <p>사업자가 판매자로 가입하여,<br> 물품을 판매하고,<br> 홍보의 목적으로 SNS Celeb과 소통하고,<br> 홍보를 할 수 있습니다.</p>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <a href="sns_join.sn">
                	<img class="img-circle img-responsive img-center" src="images/join/sns2.gif" alt="">
                </a> 
                	<h3>SNS Celeb
                    	<small>SNS Celebrity</small>
                	</h3>
                <p>Social Network <br>Services/Sites Celebrity로<br> 홍보와 판매자와 소통할 수 있습니다.</p>
            </div>
        </div>

        <hr style="margin-top: 100px;">

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </footer>

    </div>
   </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="./js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="./js/bootstrap.min.js"></script>

</body>
</html>