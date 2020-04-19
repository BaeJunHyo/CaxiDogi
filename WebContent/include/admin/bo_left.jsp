<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="lnbWrap">
	<h2>로그인 관리자 정보</h2>
	<ul class="lnb">
		<li class="lnb_sbj">
			<a href="#n">공지사항관리</a>
			<ul id="공지사항_subMenu" class="sub_lnbmenu">
				<li><a href="<%=request.getContextPath()%>/notice/main.do">공지사항 보기</a></li>
				<li><a href="<%=request.getContextPath()%>/notice/write.do">공지사항 작성</a></li>
			</ul>
		</li>
		<li class="lnb_sbj">
			<a id="주문관리" href="<%=request.getContextPath() %>/shop/main.do">업체관리</a>
			<ul id="주문관리_sub" class="sub_lnbmenu">
				<li><a href="#n">sub_menu_1</a></li>
				<li><a href="#n">sub_menu_2</a></li>
			</ul>
		</li>
		<li class="lnb_sbj">
			<a href="#n">Menu 3</a>
			<ul class="sub_lnbmenu">
				<li><a href="#n">sub_menu_1</a></li>
				<li><a href="#n">sub_menu_2</a></li>
				<li><a href="#n">sub_menu_3</a></li>
				<li><a href="#n">sub_menu_4</a></li>
			</ul>
		</li>
		
	</ul>
</div><!--// lnbWrap -->

<script>
// html dom 이 다 로딩된 후 실행된다.
$(document).ready(function(){

    // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
	if($("#MenuConfirm").val() == 1){
		$("#주문관리_sub").slideDown();
	}
	
	if($("#MenuConfirm").val() == 3){
		$("#공지사항_subMenu").slideDown();
	}
    
    
    $(".lnb>a").click(function(){
        var submenu = $(this).next("ul");

        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
        if( submenu.is(":visible") ){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
    });
	
	
    
});
</script>