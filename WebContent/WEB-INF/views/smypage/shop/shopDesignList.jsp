<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../../../../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
%>
<%@ include file="./../../../../include/left_frm_seller.jsp" %>
		<!-- 마이페이지 메인 -->
	<div class="cusSec_right">
		<div class="cusSec_tableWrap tw_wFull">
			<h3>
				<span class="t_sbj">디자이너 리스트</span>
			</h3>
		</div>
		<div class="clearfix">
		<table class ="basic_tableStyle" width = "100%">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>추가금</th>
			<th>예약시간</th>
			<th>상태</th>
			<th>작업</th>
		</tr>
		<c:if test = "${fn:length(designerList) == 0 }">
		<tr align="center">
			<td colspan="5" >등록된 디자이너가 없습니다</td>
		</tr>
		</c:if>
		<c:if test="${fn:length(designerList) !=0 }">
			<c:forEach items="${designerList }" var="designer" varStatus="sp">
			<tr>
				<th>${sp.index+1 }</th>
				<td>${designer.design_name }</td>
				<td>${designer.design_price }</td>
				<td>${designer.design_time }</td>
				<td>
					<c:if test ="${designer.design_auth == 0 }">
						재직
					</c:if>
					<c:if test ="${designer.design_auth == 1 }">
						퇴사
					</c:if>
					<c:if test ="${designer.design_auth == 2 }">
						정지
					</c:if>
				</td>
				<td >
					
					<c:if test="${designer.design_auth == 0 }">
						<input type = "button"  design_seq = "${designer.design_seq }" class="btn_line_s modifydesignBtn" value ="수정">
						<input type = "button"  design_seq = "${designer.design_seq }" class="btn_line_s stopDesignBtn" value ="정지">
						<input type = "button"  design_seq = "${designer.design_seq }" class="btn_line_s designDeleteBtn" value ="삭제">
					</c:if>
					<c:if test="${designer.design_auth == 2 }">
						<input type = "button"  design_seq = "${designer.design_seq }" class="btn_line_s playDesignBtn" value ="복귀">
						<input type = "button"  design_seq = "${designer.design_seq }" class="btn_line_s designDeleteBtn" value ="삭제">
					</c:if>
				</td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
		</div>
	<div style = "margin-top : 10px;" align = "right">
	<button type="button" class="btn_dark_m" onclick ="location.href='sellerShopList.do'">Shop List</button>
	<button type="button" class="btn_dark_m" onclick ="location.href='shopDesignAdd.do?shop_seq=${shop_seq}'">디자이너 등록</button>
	</div>
	</div><!--// contents -->

</div><!--container E : -->


<script type="text/javascript">
	$(".modifydesignBtn").click(function(){
		var design_seq = $(this).attr("design_seq");
		var shop_seq = ${shop_seq};
		
		 $.ajax({
	          url:"./checkDesign.do",
	          type:'post',
	          data: {"design_seq" : design_seq,
		          	  "shop_seq" : shop_seq},
	          success: function (data){
	             //alert("성공");
				 if(data == "ok"){
	             	location.href="designModify.do?design_seq="+design_seq+"&shop_seq="+shop_seq;
				 } else {
					 alert("해당 디자이너의 예약 정보가 남아있습니다.");
				}
	          },
	          error: function (e){
	             alert("통신실패");
	     	}
		});
		
	});
	
	$(".designDeleteBtn").click(function(){
		var design_seq = $(this).attr("design_seq");
		var shop_seq = ${shop_seq};
		$.ajax({
	          url:"./deleteDesignAf.do",
	          type:'post',
	          data: {"design_seq" : design_seq,
		          	  "shop_seq" : shop_seq},
	          success: function (data){
	             //alert("성공");
				 if(data == "ok"){
					 alert("해당 디자이너의 상태를 변경하였습니다.")
					 location.href="shopDesignList.do?shop_seq="+${shop_seq};
				 } else {
					 alert("해당 디자이너의 예약 정보가 남아있습니다.");
				}
	          },
	          error: function (e){
	             alert("통신실패");
	     	}
		});
	});

	$(".stopDesignBtn").click(function(){
		var design_seq = $(this).attr("design_seq");
		var shop_seq = ${shop_seq};
		$.ajax({
	          url:"./stopDesignAf.do",
	          type:'post',
	          data: {"design_seq" : design_seq,
		          	  "shop_seq" : shop_seq},
	          success: function (data){
	             //alert("성공");
				 if(data == "ok"){
					 alert("해당 디자이너의 상태를 정지로 변경하였습니다.")
	             	location.href="shopDesignList.do?shop_seq="+${shop_seq};
				 } else {
					 alert("해당 디자이너의 상태를 변경하지 못하였습니다.");
				}
	          },
	          error: function (e){
	             alert("통신실패");
	     	}
		});
	});
	
	$(".playDesignBtn").click(function(){
		var design_seq = $(this).attr("design_seq");
		var shop_seq = ${shop_seq};
		$.ajax({
	          url:"./playDesignAf.do",
	          type:'post',
	          data: {"design_seq" : design_seq,
		          	  "shop_seq" : shop_seq},
	          success: function (data){
	             //alert("성공");
				 if(data == "ok"){
					 alert("해당 디자이너의 상태를 변경하였습니다.")
	             	location.href="shopDesignList.do?shop_seq="+${shop_seq};
				 } else {
					 alert("해당 디자이너의 상태를 변경하지 못하였습니다.");
				}
	          },
	          error: function (e){
	             alert("통신실패");
	     	}
		});
	});
</script>
<%@ include file="./../../../../include/footer.jsp" %>