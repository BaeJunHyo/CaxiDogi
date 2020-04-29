<%@page import="cd.com.a.model.memberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
memberDto loginUser = (memberDto)request.getSession().getAttribute("loginUser");
if(loginUser != null){
	System.out.println("LoginSessionChecking="+loginUser.toString());
}

%>	
<html>
<head>
<title>CaxiDogi</title>
<meta charset="utf-8">
<link href="<%=request.getContextPath() %>/css/reset.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet">
<%-- <link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet">--%>
<link href="<%=request.getContextPath() %>/css/prd_detail.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">
<!-- <link href="css/setting.css" rel="stylesheet"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.bxslider.js"></script>
<script src="<%=request.getContextPath() %>/js/common.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link href="<%=request.getContextPath() %>/css/order.css" rel="stylesheet">
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
  
<!-- 코어태그 -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>




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
		<a href="main.do" class="logo">
			<h1>
				<img src="<%=request.getContextPath() %>/images/img_logo.png" alt="CaxiDogi 로고">
			</h1>
		</a>
		<div class="service_section">
			<ul class="top_menu clearfix">
			<%
			if(loginUser == null){
			%>
				<li><a href="loginView.do">로그인</a></li>
				<li><a href="newAccount.do">회원가입</a></li>
			<%
			}else{
				// 세션 닉네임 없을시
				if(loginUser.getUser_name() == null){
			%>
				<li><Strong><%=loginUser.getId() %></Strong> 님 환영합니다</li>
			<%
				// 세션 닉네임 존재시
			}else{
			%>
				<li><Strong><%=loginUser.getUser_name() %></Strong> 님 환영합니다</li>
			<%		
				}
				if(loginUser.getAuth() == 3){
			%>
			  
				<li><a href="sellerMyPage.do">셀러페이지</a></li>
				<li><a href="#none" onclick="location.href='myPageMove.do'">마이페이지</a></li>
			<%		
				}else if(loginUser.getAuth() == 4 || loginUser.getAuth() == 5){
			%>
				<li><a href="productList.do">관리자페이지</a></li>
				
			<%
				}else{
			%>
				<li><a href="#none" onclick="location.href='myPageMove.do'">마이페이지</a></li>
			<%
				}
			%>
				<li><a href="#none" onclick="logout()">로그아웃</a></li>
				<li><a href="#test.do">고객센터</a></li>
			<%
			} 
			%>
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
            <a href="#none" class="allmenu">
               <div class="hamburger">
                  <span class="line"></span> 
                  <span class="line"></span> 
                  <span class="line"></span>
               </div> 전체메뉴
            </a>
            </li>
            <li class="subNav">
               <a href="prdList.do" class="pet">PET GOODS</a>
               <ul id="subGoods" class="submenu">
                  <li class="ssub" onclick="location.href('');">
                     	강아지
                  </li>
                  <li class="ssub">
                     	고양이
                  </li>
                  <li class="ssub">
                    	 공용
                  </li>
               </ul>
            </li>
            <li class="subNav">
               <a href="#" class="active">ACTIVE</a>
               <ul id="subActive" class="submenu">
                  <li class="ssub" onclick="location.href='getShopList.do'">
                     	미용 
                  </li>
                  <li class="ssub" onclick="location.href='getPoolList.do'">
                    	수영장
                  </li>
                  <li class="ssub"onclick="location.href=''">
                     	운동장
                  </li>
               </ul>
            </li>
            <li class="subNav">
               <a href="#" class="commu">COMMUNITY</a>
               <ul id="subCommu" class="submenu">
                  <li class="ssub">
                    	 공지사항
                  </li>
                  <li class="ssub">
                     QnA
                  </li>
               </ul>
            </li>
         </ul>
      </div>
      <!--sub allmenu -->
      <nav id="nav" style="display: none;">
         <div class="container">
            <div class="row">
               <div class="nav">
               	  <ul class="clearfix">
                     <li><a href="#">[Product]</a></li>
                     <li><a href="#">[Location]</a></li>
                     <li><a href="searchHospital.do">24시 동물병원 찾기</a></li>
                  </ul>
                  <ul class="clearfix">
                     <li><a href="#">강아지</a></li>
                     <li><a href="#">고양이</a></li>
                     <li><a href="#">공용</a></li>
                  </ul>
                  <ul>
                     <li><a href="getShopList.do">미용</a></li>
                     <li><a href="getPoolList.do">수영장</a></li>
                     <li><a href="#">운동장</a></li>
                  </ul>
                  <ul>
                     <li><a href="#">공지사항</a></li>
                     <li><a href="#">QnA</a></li>
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
<script>
<!-- Session logout  -->
function logout(){
	/* if(confirm("로그아웃하시겠습니까?")){
		location.href="logout.do";
	} */
	
	Swal.fire({
		  title: '로그아웃하시겠습니까?',
		  icon: 'question',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText:'아니요',
		  confirmButtonText: '예'
		}).then((result) => {
		  if (result.value) {
	  		location.href="logout.do";
	  	  }
		});
}

</script>