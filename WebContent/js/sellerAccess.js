// 체크 박스 전체 선택
$(document).ready(function(){
	$("#chk_All").click(function(){
		 if($("#chk_All").prop("checked")){
			 $("input[name=chk_box]").prop("checked",true);
		 }else{
			 $("input[name=chk_box]").prop("checked",false);
		 }
	});
});

// 체크박스 승인
$("#btn_accessPass").click(function(){
	var passList = new Array();
	   $('input[name="chk_box"]:checked').each(function(index, item){
		   passList.push($(item).val());
	   });
	   if(passList.length == 0){
	   Swal.fire({
        	  icon: 'info',
        	  title: '선택된 회원이 없습니다.',
        	  confirmButtonText: '확인',
        	  showConfirmButton: true
        	}).then(function(){
        		return;
        	});
	   }else{
	   Swal.fire({
			  title: '승인 하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  cancelButtonText:'아니요',
			  confirmButtonText: '예'
			}).then((result) => {
			  if (result.value) {
				  $.ajax({
					type : "POST",
					url : "sellerAccessPass.do",
					data : {"passList":passList},
					datatype : "text",
			  		success : function(data) {
			  			 if(data==="success"){
			  				Swal.fire({
					        	  icon: 'success',
					        	  title: '성공적으로 승인 되었습니다.',
					        	  confirmButtonText: '확인',
					        	  showConfirmButton: true
					        	}).then(function(){
					        		 location.reload();
					        	});
				  		 }
			        },
			    	error : function(xhr,status,error) {
			    		// Ajax error
			    		Swal.fire({
			  				  title: 'Error!',
			  				  text: " 승인에 실패 했습니다..",
			  				  icon: 'error',
			  				  confirmButtonText: '확인'
			  				})
			    	}
					});// ajax end
			  }
			})
	   }
}); //click end

//체크박스 반려
$("#btn_accessReturn").click(function(){
	var failList = new Array();
	   $('input[name="chk_box"]:checked').each(function(index, item){
		   failList.push($(item).val());
	   });
	   if(failList.length == 0){
		   Swal.fire({
	        	  icon: 'info',
	        	  title: '선택된 회원이 없습니다.',
	        	  confirmButtonText: '확인',
	        	  showConfirmButton: true
	        	}).then(function(){
	        		return;
	        	});
	   }else{
	   Swal.fire({
			  title: '반려 하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  cancelButtonText:'아니요',
			  confirmButtonText: '예'
			}).then((result) => {
			  if (result.value) {
				  $.ajax({
					type : "POST",
					url : "sellerAccessFail.do",
					data : {"failList":failList},
					datatype : "text",
			  		success : function(data) {
			  			 if(data==="success"){
			  				Swal.fire({
					        	  icon: 'success',
					        	  title: '성공적으로 반려 되었습니다.',
					        	  confirmButtonText: '확인',
					        	  showConfirmButton: true
					        	}).then(function(){
					        		 location.reload();
					        	});
						 location.reload();
				  		 }
			        },
			    	error : function(xhr,status,error) {
			    		// Ajax error
			    		Swal.fire({
			  				  title: 'Error!',
			  				  text: "반려에 실패 했습니다..",
			  				  icon: 'error',
			  				  confirmButtonText: '확인'
			  				})
			    	}
					});// ajax end
			  }
			})
	   }
}); //click end

//개별 버튼 승인 
$(".btn_pass").click(function(){
	Swal.fire({
		  title: '승인 하시겠습니까?',
		  icon: 'question',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText:'아니요',
		  confirmButtonText: '예'
		}).then((result) => {
		  if (result.value) {
			   var passList = new Array();
				passList.push($(".mem_seq").val());
			  $.ajax({
				type : "POST",
				url : "sellerAccessPass.do",
				data : {"passList":passList},
				datatype : "text",
		  		success : function(data) {
		  			 if(data==="success"){
		  				Swal.fire({
				        	  icon: 'success',
				        	  title: '성공적으로 승인 되었습니다.',
				        	  confirmButtonText: '확인',
				        	  showConfirmButton: true
				        	}).then(function(){
				        		 location.reload();
				        	});
					 location.reload();
			  		 }
		        },
		    	error : function(xhr,status,error) {
		    		// Ajax error
		    		Swal.fire({
		  				  title: 'Error!',
		  				  text: "승인에 실패 했습니다..",
		  				  icon: 'error',
		  				  confirmButtonText: '확인'
		  				})
		    	}
				});// ajax end
		  }
		})
})
// 개별 버튼 반려 
$(".btn_return").click(function(){
	Swal.fire({
		  title: '반려 하시겠습니까?',
		  icon: 'question',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText:'아니요',
		  confirmButtonText: '예'
		}).then((result) => {
		  if (result.value) {
			   var failList = new Array();
			   failList.push($(".mem_seq").val());
			  $.ajax({
				type : "POST",
				url : "sellerAccessFail.do",
				data : {"failList":failList},
				datatype : "text",
		  		success : function(data) {
		  			 if(data==="success"){
		  				Swal.fire({
				        	  icon: 'success',
				        	  title: '성공적으로 반려 되었습니다.',
				        	  confirmButtonText: '확인',
				        	  showConfirmButton: true
				        	}).then(function(){
				        		 location.reload();
				        	});
					 location.reload();
			  		 }
		        },
		    	error : function(xhr,status,error) {
		    		// Ajax error
		    		Swal.fire({
		  				  title: 'Error!',
		  				  text: "반려에 실패 했습니다..",
		  				  icon: 'error',
		  				  confirmButtonText: '확인'
		  				})
		    	}
				});// ajax end
		  }
		})
})
