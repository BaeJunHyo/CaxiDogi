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
			<th>번호</th>
			<th>수영장이름</th>
			<th>수영장주소</th>
			<th>수영장영업시간</th>
			<th>승인여부</th>
			<th>작업</th>
		</tr>
		<c:if test = "${fn:length(poolList) == 0 }">
		<tr align="center">
			<td colspan="6" >등록된 수영장이 없습니다</td>
		</tr>
		</c:if>
		<c:if test="${fn:length(poolList) !=0 }">
			<c:forEach items="${poolList }" var="pool" varStatus="sp">
			<tr >
				<th>${sp.index+1 }</th>
				<td>${pool.pool_name }</td>
				<td>${pool.pool_addr }</td>
				<td>${pool.pool_time }</td>
				<td>
					<c:if test = "${pool.pool_auth == 0 || pool.pool_auth == 4}">
						<span style="color : red;">승인대기</span>
					</c:if>
					<c:if test = "${pool.pool_auth == 1 }">
						<span style="color : blue;">승인</span>
					</c:if>
					<c:if test = "${pool.pool_auth == 2 }">
						<span style="color : red;">재신청</span>
					</c:if>
					<c:if test = "${pool.pool_auth == 3 }">
						<span style="color : red;">정지</span>
					</c:if>
				</td>
				<td >
					<c:if test = "${pool.pool_auth == 0 || pool.pool_auth == 4 }">
						<input type = "button" pool_seq = "${pool.pool_seq }" class="btn_line_s modifyPoolBtn" value ="수정">
					</c:if>
					<c:if test = "${pool.pool_auth == 1 }">
						<input type = "button" pool_seq = "${pool.pool_seq }" class="btn_line_s modifyPoolBtn" value ="수정">
						<input type = "button"  class="btn_line_s stopPoolBtn" value ="정지">
					</c:if>
					<c:if test = "${pool.pool_auth == 2 }">
						<input type = "button" pool_seq = "${pool.pool_seq }" class="btn_line_s reModifyPoolBtn" value ="재신청">
					</c:if>
				</td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
	
		</div>
		<div style = "margin-top : 10px;" align = "right">
	<button type="button" class="btn_dark_m" onclick ="location.href='regiPool.do'">수영장 등록</button>
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