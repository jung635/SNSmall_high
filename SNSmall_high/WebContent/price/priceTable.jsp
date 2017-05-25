<%@page import="web.sns.db.SnsBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="csstransforms csstransforms3d csstransitions">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="./css/font-awesome.min.css" rel="stylesheet"> 
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet">
</head>
<body>

<jsp:include page="../inc/header.jsp"/>
<!-- Page Content -->
<div class="container">
	<div class="content">
  		<!-- Introduction Row -->
        <div class="row" style="margin-top: 43px">
            <div class="col-lg-12">
                <h1 class="page-header">PriceTable</h1>
                <p>SNS 스타들의 등급에 따라 받는 profit이 달라집니다. </p>
            </div>
        </div>

        <!-- Team Members Row -->
		<div class="row">
            <div class="col-md-4">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <h3 class="panel-title">Basic</h3>
                    </div>

                    <ul class="list-group">
                        <li class="list-group-item"><span id="standard"><strong>기본</strong></span> 판매액</li>
                        <li class="list-group-item"><strong>5%</strong> Profit</li>
<!--                         <li class="list-group-item"><strong>Unlimited</strong> Email Accounts</li>
                        <li class="list-group-item"><strong>10GB</strong> Disk Space</li>
                        <li class="list-group-item"><strong>100GB</strong> Monthly Bandwidth</li>
 -->                        <li class="list-group-item"><a href="snsList.sn?category=basic&order=sell" class="btn btn-primary">Basic SNS스타 보기</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <h3 class="panel-title">Plus</h3>
                    </div>
                    <ul class="list-group">
                        <li class="list-group-item"><span id="standard"><strong>500만원 이상</strong></span> 판매액</li>
                        <li class="list-group-item"><strong>10%</strong> Profit</li>
                        <li class="list-group-item"><a href="snsList.sn?category=plus&order=sell" class="btn btn-primary">Plus SNS스타 보기</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <h3 class="panel-title">Premium <span class="label label-success">Best</span></h3>
                    </div>
                    <ul class="list-group">
                        <li class="list-group-item"><span id="standard"><strong>1000만원 이상</strong></span> 판매액</li>
                        <li class="list-group-item"><strong>20%</strong> Profit</li>
                        <li class="list-group-item"><a href="snsList.sn?category=premium&order=sell" class="btn btn-primary">Premium SNS스타 보기</a>
                        </li>
                    </ul>
                </div>
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
</body>
</html>