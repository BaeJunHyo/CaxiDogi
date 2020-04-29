$(function(){
   // �곹뭹 �몃꽕�� 留덉슦�ㅼ삤踰꾩떆 硫붿씤�� �섑���
   $('.prdThumb li').click(function(){
      // $('.prdImg img').attr('src',$('a',this).attr('href'));
      $('.prdThumb li').removeClass('current');
      $(this).addClass('current');
   })

   $('.bttm_optionLayer').hide();
   // �곹뭹�뷀뀒�� ��찓�� �ㅽ겕濡ㅼ떆 �곕씪�ㅻ땲湲�
   $(window).scroll(function(){
      var winHeight = $(window).height() + 10;
      var scrollVar = $(window).scrollTop();   //�붾㈃ �ㅽ겕濡� �믪씠 媛�
      var footerHeight = $('.footerWrap').height();
      var ov_h = $('.optionView').height();

      $('.optionView').css({'bottom':-ov_h});
      if (scrollVar > winHeight){
         $('.detailTab').css({'position':'fixed','top':'0'})
         $('.bttm_optionLayer').show();
      }
      else {
         $('.detailTab').css({'position':'static','top':'0'})
         $('.bttm_optionLayer').hide();
      }

   });

   // �곹뭹 誘몃━蹂닿린 踰꾪듉 �≪뀡
   $('.prdPreview_wrap').hide();
   $('.prdArea li .prdHover .btn_prdPreview').on('click',function(){
      $('.prdPreview_wrap').show();
   });
   $('.prdPreview_wrap .btn_prdPreview_close').on('click',function(){
      $('.prdPreview_wrap').hide();
   });

   // �뚯씠釉� ��떎�대낫湲� �뺤떇 �≪뀡
   $('.view_tableCn,.view_tableCn02').hide();
   $('.view_tableTit').click(function(){
      var toggleAction = $(this).next('.view_tableCn,.view_tableCn02').toggle()
      var toggleActionCss = $(this).toggleClass('current')

      if($(this).next('.view_tableCn,.view_tableCn02') !== null){
         toggleAction();
         toggleActionCss();
      } else {}
   })


   // 留덉슦�� �ㅻ쾭�� �덉씠�댄뙘�낆갹 �≪뀡
   $('.btnHover').click(function(){
      $('.btnHover_cn').show();
   });
   $('.btnHover_cn .btn_close_h').click(function(){
      $('.btnHover_cn').hide();
   })



})


// move
$(document).ready(function(){
   $('.detailTab li a').on('click', function(e){
      e.preventDefault();
      var targetAttr = $(this).attr('href');
      var targetH = $(targetAttr).position().top;
      $('html, body').animate({scrollTop : targetH + 1000});
      $('.detailTab li a').removeClass('current');
      $(this).addClass('current');
   });
});

/* quick menu initialization */
var quick_menu = $('.detailTab');
var quick_top = 150;
quick_menu.css('top', $(window).height());
$(document).ready(function(){
   quick_menu.animate( { "top": $(document).scrollTop() + quick_top +"px" }, 500 );
   $(window).scroll(function(){
      quick_menu.stop();
      quick_menu.animate( { "top": $(document).scrollTop() + quick_top + "px" }, 500 );
   });
});


$(function(){
   var ov_h = $('.optionView').height();

   $('.optionView').css({'bottom':-ov_h});
   $('.optionBox .leftSec').click(function(){
      $('img',this).toggle();
      $('.optionView').slideToggle('slow',function(){
         $('.optionView').stop().animate({'bottom':50},'slow');
      });
   })
   $('.btn_close_optionView').click(function(){
      $('.optionView').stop().animate({'bottom':-ov_h},'slow');
   })

   if ($(window).scrollTop() + $(window).height() >= $(document).height()) {
       $('.bttm_optionLayer').css({'bottom':footerHeight-44});
    } else {
       $('.bttm_optionLayer').css({'bottom':0});
    }
})


$(function(){
   $('.prd_lp, .lp_box, .lp_bg').show();

   $('.link_lp').mouseenter(function(){
      $('.prd_lp',this).show();
   }).mouseleave(function(){
      $('.prd_lp',this).hide();
   })

   $('.click_lp_ins').click(function(){
      $('.prd_lp.ins_lp').show();
   })

   $('.click_lp_coup').click(function(){
      $('.prd_lp.coup_lp').show();
   })

   $('.btn_close_lp').click(function(){
      $('.prd_lp').hide();
      $('.lp_bg, .lp_box').hide();
      $('.lp_box_ll').hide();
   })
   

   $('.prd_lp .tabMenu li a').each(function(index){
      $(this).attr('data-tabNum',index+1)
   })

   $('.prd_lp .tabCn_1').show();
   $('.prd_lp .tabMenu li').click(function(){
      var tabNum = parseInt($(this).attr('data-tabNum'));

      $('.prd_lp .tabCn').hide();
      $('.prd_lp .tabCn_'+tabNum).show();

      $('.prd_lp .tabMenu li').removeClass('current');
      $(this).addClass('current');
   })

   $('.btn_wishlist').click(function(){
      $('.lp_box, .lp_bg').show();
   })


   // brand list toggle
   $('table.brandList tr:nth-child(2)~').hide();

   $('.brand_moreBtn').toggle(
      function(){
         $('table.brandList tr:nth-child(2)~').show();
         $('table.brandList').addClass('on');
         $('.brand_moreBtn img').attr('src','images/btn_more_brand_off.png');
      },
      function(){
         $('table.brandList tr:nth-child(2)~').hide();
         $('table.brandList').removeClass('on');
         $('.brand_moreBtn img').attr('src','images/btn_more_brand_on.png');
      }

   );

   $('.top_menu li').click(function(){
      $('.lp_bg').show();
      $('.lp_policy').show()
   })

   // 硫붿씤 �щ씪�대뱶 �≪뀡
   var window_w = $(window).width();

   // $('.promotionView').css({'width':window_w*3})
   // $('.slideNav li').click(function(){
   //    // var index = $('.slideNav li').index(this);
   //    // $('.promotionView li').css({'display':'none'});
   //    // $('.promotionView li:nth-child('+(index+1)+')').css({'display':'block'});
   //    // $('.slideNav li').removeClass('current')
   //    // $(this).addClass('current')
   //    mainSlide()
   // })

   // function mainSlide(index){
   //    index++
   //    $('.promotionView li').css({'display':'none'});
   //    $('.promotionView li:nth-child('+(index+1)+')').css({'display':'block'});
   //    $('.slideNav li').removeClass('current')
   //    $('.slideNav li:nth-child('+(index+1)+')').addClass('current')
   // }

   // $('.slideNav li').each(function(index){
   //    $(this).attr('data-i',index+1);
   // })
   // $('.slideNav li').click(function(){
   //    var index = parseInt($(this).attr('data-i'))
   // })

})



/*$(document).ready(function(){

   var topBar = $("#gnb").offset();

   $(window).scroll(function(){
      
      var docScrollY = $(document).scrollTop()
      var barThis = $("#gnb")
      var fixNext = $("#fixNextTag")

      if( docScrollY > gnb.top ) {
         barThis.addClass("top_bar_fix");
         fixNext.addClass("pd_top_80");
      }else{
         barThis.removeClass("top_bar_fix");
         fixNext.removeClass("pd_top_80");
      }

   });

})*/
// 메뉴바 고정
$(document).ready(function(){
   
   $(".header-btm").each(function(){
      var header = $(this);
      var headerOffset = header.offset().top;
    
      $(window).scroll(function(){
         var wScroll = $(window).scrollTop();
         if( wScroll > headerOffset){
           header.addClass("fixed");
           
           
         } else {
           header.removeClass("fixed");
         }
      });
   });
   
/*$("#nav").each(function(){
      var header = $(this);
      var headerOffset = header.offset().top;
    
      $(window).scroll(function(){
         var wScroll = $(window).scrollTop();
         if( wScroll > headerOffset){
           nav.addClass("show1");
           
         } else {
           header.addClass("show");
         }
      });
   });
});*/

/*jQuery(document).ready(function(){
    $(".box").hover(function(){
       $(".text").show();
    },function(){
       $(".text").hide();
    });*/

// header부분 nav
$(document).ready(function(){
      // 전체메뉴
      $(".allmenu").click(function(e){
         e.preventDefault();
         $("#nav").addClass("subnav");
         //$("#nav").toggleClass("show");
         $("#nav").toggle();
         $("#nav").css('visibility', 'visible');       
      });
///////////////////////////////////////////////////////////////////////
      // 서브메뉴
      var tabMenu = $(".gnb li.subNav a");
       var tabSubMenu = $(".submenu");
       var tabSubli = $("li.ssub");


       // submenu 를 클릭했을때
       tabMenu.on("click", function(e){
           // 클릭한 메뉴가 몇번째 메뉴인지 가져옴
           var idx = tabMenu.index($(this));
        
           // 모든 서브메뉴 안보이게
           tabSubMenu.hide();
           // 서브메뉴중에서 클릭한 메뉴에 해당하는 서브메뉴만 보이게
           tabSubMenu.eq(idx).show();
        
           // 현재 on 이미지를 off 이미지로 변경
           //tabMenu.find("img.on").removeClass("on").toggle();
           // 클릭한 탭 이미지만 on 이미지로 변경
           //$(this).find("img").addClass("on").toggle({to:"on"});
       }).on("mouseover", function(){
           // 마우스 오버됬을때 클릭한것처럼 동작
           $(this).click();
       }).on("mouseout", function(){
    	  var idx = tabMenu.index($(this));
          tabSubMenu.eq(idx).css("display", "none");
       });
       
       
       // ssub메뉴 클릭 시
       /*
        * tabSubli.on("click", function(e){
          var idx = tabSubli.index($(this));
          
          tabSubli.eq(idx).addClass("on");
       });
       
       tabSubli.on("click", function(e){
          //var idx = tabSubli.index($(this));
          
          tabSubli.hasClass("on").removeClass("on");
       });
       */
       
       /*tabSubli.find("li.ssub").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
          tabSubli.removeClass("on");     // sBtn 속에 (active) 클래스를 삭제 한다.
         $(this).addClass("on"); // 클릭한 a에 (active)클래스를 넣는다.
      })*/
////////////////////////////////////////////////////////////////////
       tabSubli.on("click", function(e){
          var idx = tabSubli.index($(this));
          
          tabSubli.eq(idx).show();
       }).on("click", function(){
          $(this).addClass("on");
       }).on("click"),function(){
          var idx = tabSubli.index($(this));
          $(this).removeClass("on");
       }
       /////////////////////////////////////////////////////
       
       $("#subGoods").mouseover(function(){
          $("#subGoods").show();
       });
       
       $("#subGoods").mouseout(function(){
          $("#subGoods").hide();
       });
       
       
       
       $("#subActive").mouseover(function(){
          $("#subActive").show();
       });
       
       $("#subActive").mouseout(function(){
          $("#subActive").hide();
       });
       
       
       
       $("#subCommu").mouseover(function(){
          $("#subCommu").show();
       });
       
       $("#subCommu").mouseout(function(){
          $("#subCommu").hide();
       });
       
   });
});

