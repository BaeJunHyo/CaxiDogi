<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<title>BO</title>
<meta charset="utf-8">
<link href="<%=request.getContextPath() %>/css/reset.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/admin/bo_common.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/admin/bo_style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="   crossorigin="anonymous"></script>
<script src="<%=request.getContextPath() %>/js/bo_common.js" type="text/javascript"></script>

<!-- favicon 16, 24, 32, 64, 152 -->
<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/ico/favicon_ico.ico">
<link rel="apple-touch-icon" href="<%=request.getContextPath() %>/images/ico/icon_57.png">
<link rel="apple-touch-icon" sizes="72x72" href="<%=request.getContextPath() %>/images/ico/icon_72.png">
<link rel="apple-touch-icon" sizes="114x114" href="<%=request.getContextPath() %>/images/ico/icon_114.png">
<link rel="apple-touch-icon" sizes="144x144" href="<%=request.getContextPath() %>/images/ico/icon_144.png">

<!-- ckediter -->
<script src="//cdn.ckeditor.com/4.11.4/standard/ckeditor.js"></script>
<!--  <script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>-->

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type='text/css'>
<link href='https://fonts.googleapis.com/css?family=PT+Sans:700' rel='stylesheet' type='text/css'>

<!-- 코어태그 -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>

</head>
<body>

<div class="header">
	<span style="border: 1px solid white; margin: auto; margin-left: 70px;"><font style="color:white;">로고넣고 싶어요</font></span>
	
	<!--  [헤더 메뉴바]
	
	<h1><a href="#n" class="logo"><img src="images/img_logo_bo.png"></a></h1>
	<a href="#n" class="btn_menu"><img src="images/ico_hamburger.png"></a>
	<div class="m_right">
		<a href="#n" class="btn_user">로그인</a>
		
		<ul>
			<li><a href="#n">사이트맵</a></li>
			<li><a href="#n">회원가입</a></li>
			<li><a href="#n">메뉴얼</a></li>
			<li><a href="#n">마이쇼핑몰</a></li>
		</ul>
	</div>
	-->
</div><!--// header -->