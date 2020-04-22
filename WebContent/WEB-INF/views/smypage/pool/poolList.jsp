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
				<span class="t_sbj">수영장 리스트</span>
			</h3>
		</div>
		
		<div class="clearfix">
		<table class ="basic_tableStyle" width = "100%">
		<tr>
			<th>업체 번호</th>
			<th>수영장이름</th>
			<th>수영장주소</th>
			<th>수영장영업시간</th>
			<th>작업</th>
		</tr>
		<c:if test = "${fn:length(poolList) == 0 }">
		<tr align="center">
			<td colspan="5" >등록된 수영장이 없습니다</td>
		</tr>
		</c:if>
		<c:if test="${fn:length(poolList) !=0 }">
			<c:forEach items="${poolList }" var="pool" varStatus="sp">
				<c:if test="${pool.pool_auth == 1 }">
			<tr>
				<th>${pool.pool_seq }</th>
				<td>${pool.pool_name }</td>
				<td>${pool.pool_addr }</td>
				<td>${pool.pool_time }</td>
				<td >
					<input type = "button" pool_seq = "${pool.pool_seq }" class="btn_line_s resvCheckBtn" value ="예약 내역 확인">
					
				</td>
			</tr>
			</c:if>
			</c:forEach>
		</c:if>
	</table>
	
		</div>

	</div><!--// contents -->

</div><!--container E : -->
<script type="text/javascript">
$(".modifyPoolBtn").click(function(){
	var pool_seq = $(this).attr("pool_seq");
	location.href = "modifyPool.do?pool_seq="+pool_seq;
});
$(".reModifyPoolBtn").click(function(){
	var pool_seq = $(this).attr("pool_seq");
	location.href = "reModifyPool.do?pool_seq="+pool_seq;
});
$(".stopPoolBtn").click(function(){
	var pool_seq = $(this).attr("pool_seq");
	$.ajax({
          url:"./poolStop.do",
          type:'post',
          data: {"pool_seq" : pool_seq},
          success: function (data){
             //alert("성공");
			 if(data == "ok"){
				 alert("해당 pool의 상태를 정지로 변경하였습니다.")
				 location.href="sellerPoolList.do";
			 } else {
				 alert("해당 pool의 상태를 변경하지 못하였습니다.");
			}
          },
          error: function (e){
             alert("통신실패");
     	}
	});
});

</script>

<%@ include file="./../../../../include/footer.jsp" %>