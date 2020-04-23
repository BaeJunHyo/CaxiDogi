<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%-- 
<%
memberDto sessionUser = (memberDto)request.getSession().getAttribute("loginUser");
if(sessionUser == null){
%>
<script>
	if(confirm("세션이 만료되었습니다.\n 다시 로그인 하시겠습니까?")){
		location.href="login.do";
	}else{
		location.href="main.do";
	}
</script>
<%
}
String memberAuth ="";
if(loginUser.getAuth()==1 || loginUser.getAuth()==2){
	memberAuth = "일반회원";
}else if(loginUser.getAuth()==3){
	memberAuth = "업체회원";
}else if(loginUser.getAuth()==4 || loginUser.getAuth()==5){
	memberAuth = "관리자";
}else{
	memberAuth = "탈퇴회원";
}
%> --%>

<div class="category_dept">
	<ul>
		<li>HOME</li>
		<li>마이페이지</li>
	</ul>
</div>

<!-- container S : -->
<div class="container_subWrap clearfix">
	<div class="cusSec_left">
		<div class="customerMenu">
			<h3>마이페이지</h3>
			<ul class="csSubmenu">
				<li>
					<a href="#n">쇼핑정보</a>
					<ul>
						<li><a href="#n">주문배송조회</a></li>
						<li><a href="#n">취소/교환/반품</a></li>
						<li><a href="#n">환불계좌조회</a></li>
						<li><a href="#n">영수증신청/발급</a></li>
					</ul>
				</li>
				<li>
					<a href="#n">미용 예약정보</a>
					<ul>
						<li><a href="showShopResv.do">미용 예약 내역보기</a></li>
						<li><a href="#n">취소 내역보기</a></li>
					</ul>
				</li>
				<li>
					<a href="#n">수영장 예약정보</a>
					<ul>
						<li><a href="#">수영장 예약 내역보기</a></li>
						<li><a href="#n">취소 내역보기</a></li>
					</ul>
				</li>
				<li>
					<a href="#n">운동장 예약정보</a>
					<ul>
						<li><a href="#">운동장 예약 내역보기</a></li>
						<li><a href="#n">취소 내역보기</a></li>
					</ul>
				</li>
				<li>
					<a href="#n">회원정보관리</a>
					<ul>
						<li><a href="memberDetail.do">회원 정보</a></li>
						<li><a href="memberAddress.do">배송지 정보</a></li>
						<li><a href="sellerAccess.do">판매자 등록하기</a>
					</ul>
				</li>
				<li>
					<a href="#n">서비스정보</a>
					<ul>
						<li><a href="#n">나의 상품평</a></li>
						<li><a href="#n">나의 상품 Q&amp;A</a></li>
						<li><a href="#n">1:1답변확인</a></li>
						<li><a href="#n">이벤트참여내역</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="customerMenu">
			<h4>온라인 고객센터</h4>
			<p class="csNumber">123-4567<img src="./images/mypage/ico_phone.gif" class="pl5"></p>
			<ul class="csTime">
				<li>
					평일
					<span class="c_gray">09:00 ~ 19:00</span>
				</li>
				<li>
					토/일요일 및 공휴일
					<span class="c_gray">09:00 ~ 17 :00</span>
				</li>
			</ul>
		</div>
	</div>
<!--</div>  //end wrap -->
