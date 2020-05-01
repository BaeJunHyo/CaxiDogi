<%@page import="cd.com.a.model.poolParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../../../../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
poolParam param = (poolParam)request.getAttribute("param");
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
				<span class="t_sbj">수영장 오늘의 예약 리스트</span>
			</h3>
		</div>
		<div style ="margin-bottom : 10px;">
			<c:if test = "${fn:length(poolList) == 0 }">
				등록된 수영장이 없습니다
			</c:if>
			<c:if test = "${fn:length(poolList) != 0 }">
			<select id ="pool_seq">
				<option value="100" >수영장 선택</option>
				<c:forEach items="${poolList }" var="pool" varStatus="pools">
					<c:if test ="${pool.pool_auth == 1 }">
						<option value = "${pool.pool_seq }" >${pool.pool_name }</option>
					</c:if>
				</c:forEach>
			</select>
			</c:if>
		</div>
		<div class="clearfix">
		<table class ="basic_tableStyle" width = "100%">
		<tr>
			<th>업체 번호</th>
			<th>수영장이름</th>
			<th>예약일</th>
			<th>시간</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>인원</th>
			<th>마리</th>
			<th>확인</th>
		</tr>
		<c:if test = "${fn:length(poolSellerResvList) == 0 }">
		<tr align="center">
			<td colspan="8" >예약내역이 없습니다</td>
		</tr>
		</c:if>
		<c:if test="${fn:length(poolSellerResvList) !=0 }">
			<c:forEach items="${poolSellerResvList }" var="resv" varStatus="sp">
			<tr>
				<th>${resv.pool_seq }</th>
				<td>${resv.pool_name }</td>
				<td>${resv.pool_resv_sdate }</td>
				<td>${resv.pool_resv_time }</td>
				<td>${resv.pool_resv_name }</td>
				<td>${resv.pool_resv_tel }</td>
				<td>${resv.pool_resv_user }</td>
				<td>${resv.pool_resv_pet }</td>
				<td>
					<input type = "button" pool_resv_seq = "${resv.pool_resv_seq }" class="btn_line_s useBtn" value ="사용">
				</td>
		
			</tr>
			</c:forEach>
		</c:if>
	</table>
	
		</div>
 <jsp:include page="/include/paging.jsp" flush="false">
      <jsp:param name="totalRecordCount" value="${totalRecordCount }" />
      <jsp:param name="pageNumber" value="${pageNumber }" />
      <jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
      <jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
</jsp:include> 
	</div><!--// contents -->

</div><!--container E : -->
<script type="text/javascript">
$(document).on("click",".useBtn", function(){
	var pool_resv_seq = $(this).attr("pool_resv_seq");
	Swal.fire({
        title: pool_resv_seq+' 예약건 사용',
        text: "예약자정보 확인하셨나요?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes'
      }).then((result) => {
        if (result.value) {
           $.ajax({
               url:"./poolUse.do",
               type:'post',
               data:{"pool_resv_seq" : pool_resv_seq },
               success: function(data){
                  if(data == 'ok'){
                     Swal.fire({
                    		 title: '사용 완료 되었습니다.',
                              icon: 'success', 
                              showConfirmButton: true
                     } ).then(function(){
                                  window.location="poolTodayList.do"});
                  }else if(data == 'no'){
                	  Swal.fire({
                          icon: 'error',
                          title: '캐시도기에 문의해주세요.',
                          showConfirmButton: true
                        });
                  }
               },
               error: function(e){
            	   Swal.fire({
                          icon: 'error',
                          title: '캐시도기에 문의해주세요.',
                          showConfirmButton: true
                        });
               }
            });
        }
      });
	
});

$("#pool_seq").change(function(){
	var poolSeq = $("#pool_seq option:selected").val();
	var poolResvAuth = $("#pool_resv_auth option:selected").val();

	location.href = "poolTodayList.do?poolSeq="+poolSeq;
		
});

$("#pool_resv_auth").change(function(){
	var poolSeq = $("#pool_seq option:selected").val();

	location.href = "poolTodayList.do?poolSeq="+poolSeq;
});

$("#pool_seq").val("<%=param.getPoolSeq()%>").prop("selected", true);

function goPage( pageNumber ){
	//alert(pageNumber);
	var poolSeq = $("#pool_seq option:selected").val();
	location.href = "poolTodayList.do?poolSeq="+poolSeq+"&pageNumber="+pageNumber;
}

</script>

<%@ include file="./../../../../include/footer.jsp" %>