jQuery(document).ready(function($){
  
$('.booking_list2 h2').click(function(){
if($(this).parents('.booking_list2').hasClass('txt_active')){ 
  $(this).parents('.booking_list2').removeClass('txt_active');

$(this).find('i').removeClass('fa-angle-up');
$(this).find('i').addClass('fa-angle-down');
 $(this).parents('.booking_list2').find('.child2').css('display','none');
    $(this).parents('.booking_list2').css('flex-direction','inherit');
  
}else{

$(this).find('i').removeClass('fa-angle-down');
$(this).find('i').addClass('fa-angle-up');
    $(this).parents('.booking_list2').find('.child2').css('display','block');
    $(this).parents('.booking_list2').css('flex-direction','column');
    $(this).parents('.booking_list2').addClass('txt_active')
}
  });
  
$('.mind_menu li').click(function(){
  console.log($(this).attr('data-cat'))
  $('.mind_menu li').each(function(){
    $(this).removeClass('active_mind');
  });
  $(this).addClass('active_mind');
});

  
});