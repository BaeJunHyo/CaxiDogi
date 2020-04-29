$(function(){

	/* 濡쒓렇�� �ъ빱�� css */
	// �꾩씠�� �명뭼 �ъ빱��
	$('.login_form span.user_id input').focus(function(){
		$('.login_form span.user_id').css({'border':'1px solid #f1222a'})
		$('.login_form span.user_id label').css({'color':'#f1222a'})
	}).blur(function(){
		$('.login_form span.user_id').css({'border':'1px solid #d1d7df'})
		$('.login_form span.user_id label').css({'color':'#44403f'})
	});

	// 鍮꾨쾲 �명뭼 �ъ빱��
	$('.login_form span.user_pw input').focus(function(){
		$('.login_form span.user_pw').css({'border':'1px solid #f1222a'})
		$('.login_form span.user_pw label').css({'color':'#f1222a'})
	}).blur(function(){
		$('.login_form span.user_pw').css({'border':'1px solid #d1d7df'})
		$('.login_form span.user_pw label').css({'color':'#44403f'})
	});


	/* 상품검색 상세보기 버튼 */
	$('.btn_detailsrch').click(function(){

		// �뚯씠釉� 踰붿쐞 蹂��� 吏���
		var clickAction = '.product_srchTable tr.click_hide~tr'

		// 踰꾪듉 �대┃�� �뚯씠釉� show, hide
		$(clickAction).toggle();

		// 踰꾪듉 �띿뒪�� 蹂�寃�
		if($(this).hasClass("onPress")) {
			$(this).removeClass("onPress");
			$(this).text("상세검색 닫기");
		} else {
			$(this).addClass("onPress");
			$(this).text("상세검색 열기");
		}
	})

	/* �앹뾽 李� �リ린, �뺤씤 踰꾪듉 �대┃ */
	$('.btn_close, .lp_box .btn_lp_c').click(function(){
		$('.lp_box').hide();
	})

	/* �덈룄�� �앹뾽 �� 硫붾돱 */
	// $('.tabWrap01 .tabNav li:first-child').addClass('current');
	// $('.tabWrap01 .tabCnWrap .tabCn1').removeClass('dis_none');

	// $('.tabWrap01 .tabNav li').each(function(index){
	// 	$(this).attr('data-i',index+1);
	// })
	// $('.tabWrap01 .tabNav li').click(function(){
	// 	var i = parseInt($(this).attr('data-i'));
	// 	$('.tabWrap01 .tabNav li').removeClass('current');
	// 	$(this).addClass('current');
	// 	$('.tabWrap01 .tabCnWrap .tabCn').addClass('dis_none');
	// 	$('.tabWrap01 .tabCnWrap .tabCn'+i).removeClass('dis_none');
	// })



	// $('.tabWrap02 .tabNav li:first-child').addClass('current');
	// $('.tabWrap02 .tabCnWrap .tabCn1').removeClass('dis_none');

	// $('.tabWrap02 .tabNav li').each(function(index){
	// 	$(this).attr('data-i',index+1);
	// })
	// $('.tabWrap02 .tabNav li').click(function(){
	// 	var i = parseInt($(this).attr('data-i'));
	// 	$('.tabWrap02 .tabNav li').removeClass('current');
	// 	$(this).addClass('current');
	// 	$('.tabWrap02 .tabCnWrap .tabCn').addClass('dis_none');
	// 	$('.tabWrap02 .tabCnWrap .tabCn'+i).removeClass('dis_none');
	// })


	//btn_lp
	$('.btn_lp .lp_box').hide();
	$('.btn_lp').mouseenter(function(){
		$('.lp_box',this).fadeIn();
	}).mouseleave(function(){
		$('.lp_box',this).hide();
	})

	//btn_print
	$('.btn_print').click(function(){
		$('.lp_print').show();
	})

/*
	�묒꽦��:源�泥쒖슜
	�묒꽦��:2017-06-12
	�⑸룄:�앹뾽李� 以묒븰�뺣젹
*/
})
/*誘몃━蹂닿린 �앹뾽李�*/
$(document).ready(function(){
	$('.play_close').on('click',function(e){
		e.preventDefault();
		$('.modal_pop,.pop_bg').fadeOut();
		$('.modal_pop').center();
	});
	$('.pop_on,.cnfrm_pop,.bg__photo').on('click',function(e){
		e.preventDefault();
		$('.modal_pop,.pop_bg').fadeIn();
		$('.modal_pop').center();
	});
});
/* �앹뾽李� 媛��대뜲 �뺣젹*/
$(document).ready(function(){
	jQuery.fn.center = function() { //�앹뾽李� 媛��대뜲濡� �뺣젹
		this.css('top', Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + 'px');
		this.css('left', Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + 'px');
		return this;
	}
});

/*
	�묒꽦��:源�泥쒖슜
	�묒꽦��:2017-06-13
	�⑸룄:諛곌꼍愿�由� �대┃��
*/
$(document).ready(function(){
	$('.bg-main-list li a').on('click',function(e){
		e.preventDefault();
		$(this).toggleClass('on');
	});
});


// @COMMENT : lnb 접기
$(function(){
	// $('.sub_lnbmenu li a .lnb_sbj').find('.sub_lnbmenu').each(function(index){
	// 	$(this).attr('data-n',index+1)
	// })

	$('.lnb_sbj a').on('click',function(){
		// $(this).attr('src','images/ico_close_lnb.png')
		// var n = parseInt($(this)).attr('data-n')

		if ($('img',this).attr('src') == '../images/bo/ico_close_lnb.png') {
			$('img',this).attr('src','../images/bo/ico_open_lnb.png');
        } else {
            $('img',this).attr('src','../images/bo/ico_close_lnb.png');
        }
	})

	
	$('.lnb_sbj > a').click(function() {
        $('+.sub_lnbmenu',this).slideToggle('slow', function() {
          // 객체가 다 펼치지거나 접히고 나면 여기에 든 내용이 실행된다.
        });
	});
	
	


//@COMMENT : 팝업 열기 / 닫기

 $('.btn_lp_click').click(function(){
 	$('+ .lp_box_click',this).show();
 })
 $('.lp_btn_close').click(function(){
 	$('.lp_box_click').hide();
 })


})