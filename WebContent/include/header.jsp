<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<title>CaxiDogi</title>
<meta charset="utf-8">
<link href="./css/reset.css" rel="stylesheet">
<link href="./css/common.css" rel="stylesheet">
<link href="./css/prd_detail.css" rel="stylesheet">
<link href="./css/style.css" rel="stylesheet">
<!-- <link href="css/setting.css" rel="stylesheet"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="./js/jquery.bxslider.js"></script>
<script src="./js/common.js"></script>

<!--   <script type="text/javascript">
   $(document).ready(function (){
	   var jbOffset = $( '.nav' ).offset();
	   $( window ).scroll(function (){
		   if ( $( document ).scrollTop() > jbOffset.top ) {
			   $( '.nav' ).addClass( 'jbFixed' );
		   }
		   else {
			   $( '.nav' ).removeClass( 'jbFixed' );
		   }
	   });
	   
   });
  
  </script> -->


</head>

<body>

	<!-- topBanner S : -->
	<%-- <div class="topBanner">
    <div class="sunny_inner">
      <dl>
        <dt>“ 밤새 아픈 동물들을 위한 <span>24시 동물병원 - </span> ”</dt>
        <dd><a href="">동물병원 24시 매장보기<span>&gt;</span></a></dd>
      </dl>
    </div>
  </div> --%>
	<!-- topBanner E : -->

	<!-- header S : -->
	<div class="header">
		<a href="#n" class="logo">
			<h1>
				<img src="images/img_logo.png" alt="CaxiDogi 로고">
			</h1>
		</a>
		<div class="service_section">
			<ul class="top_menu clearfix">
				<li><a href="loginView.do">로그인</a></li>
				<li><a href="newAccount.do">회원가입</a></li>
				<li><a href="#n">고객센터</a></li>
			</ul>
			<p class="main_menu">
				<span class="searchArea"> <input type="text"> <a
					href="#n"><img src="images/ico_h_search.gif" alt="검색버튼"></a>
				</span> <a href="#n"><img src="images/ico_h_cart.gif" alt="장바구니버튼"></a>
			</p>
		</div>
		<!--// service_section -->
	</div>
	<!-- header E : -->


	<!-- nav -->
	<div class="header-btm">
		<div class="inner">
			<ul class="gnb clfix">
				<li class="navi_btn">
				<a href="#none">
						<div class="hamburger">
							<span class="line"></span> 
							<span class="line"></span> 
							<span class="line"></span>
						</div>
				</a>
				</li>
				<li><a href="#" class="pet">PET GOODS </a></li>
				<li><a href="#" class="active">ACTIVE</a></li>
				<li><a href="#" class="resv" >RESERVATION</a></li>
				<li><a href="#" class="commu">COMMUNITY</a></li>
			</ul>
		</div>
		<!--sub menu -->
	<nav id="nav" style="display: none;">
		<div class="container">
			<div class="row">
				<div class="nav">
					<ul class="clearfix">
						<li><a href="#">HTML Reference1</a></li>
						<li><a href="#">HTML Reference2</a></li>
						<li><a href="#">HTML Reference3</a></li>
						<li><a href="#">HTML Reference4</a></li>
					</ul>
					<ul>
						<li><a href="getShopList.do">pet beauty</a></li>
						<li><a href="getPoolList.do">Pool</a></li>
						<li><a href="#">HTML Reference7</a></li>
					</ul>
					<ul>
						<li><a href="#">HTML Reference8</a></li>
						<li><a href="#">HTML Reference9</a></li>
						<li><a href="#">HTML Reference10</a></li>
					</ul>
					<ul>					
						<li><a href="#">HTML Reference11</a></li>
						<li><a href="#">HTML Reference12</a></li>
						<li><a href="#">HTML Reference13</a></li>
						<li><a href="#">HTML Reference14</a></li>
						<li><a href="#">HTML Reference15</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
		<!-- //inner -->
	</div>
		
	
	
	
	
	
	<!-- <div class="nav">
    <ul class="gnb" id="gnb">
      <li><a href="#n">반려용품</a></li>
      <li><a href="#n">액티브</a></li>
      <li><a href="#n">예약</a></li>
      <li><a href="#n">커뮤니티</a></li>
      <li><a href="#n">마이페이지</a></li>
    </ul>
  </div> -->