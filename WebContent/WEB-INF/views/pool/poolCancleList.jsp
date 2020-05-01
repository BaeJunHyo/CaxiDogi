<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="./../../../include/header.jsp" %>
<%@ include file="./../../../include/left_frm.jsp" %>
<link href="./css/showShopResv.css" rel="stylesheet">
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css'>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<%
if(loginUser != null){
	if(loginUser.getUser_api()!=0){
		if(loginUser.getUser_name() == null || loginUser.getUser_name().equals("") ||
			loginUser.getNick_name() == null || loginUser.getNick_name().equals("") ||
			loginUser.getPhone() == null || loginUser.getPhone().equals("") ||
			loginUser.getBirthday()== null || loginUser.getBirthday().equals("") ||
			loginUser.getAddress()== null || loginUser.getAddress().equals("")){
%>
<script>
location.href="myPageMove.do";
</script>
<%
		}
	}
}
%>	
<div class="cusSec_right">
		<div class="cusSec_tableWrap tw_wFull">
			<h3>
				<span class="t_sbj">수영장 취소 리스트</span>
			</h3>
		</div>
<div class="cusSec_tableWrap">
	<table class="basic_tableStyle">
		<colgroup>
			<col width="115px">
			<col width="*">
			<col width="57px">
			<col width="57px">
			<col width="115px">
			<col width="115px">
		</colgroup>
		<thead>
			<tr>
				<th>예약일/예약번호</th>
				<th>예약정보</th>
				<th>인원수</th>
				<th>펫수</th>
				<th>예약금액</th>
			</tr>
		</thead>
		<tbody>
		<c:if test = "${fn:length(poolList) != 0 }">
		<c:forEach items="${poolList }" var="showList">
			<tr class ="poolResv" pool_resv_seq = "${showList.pool_resv_seq }">
				<td>
				<p>${showList.pool_resv_ydate }/</p>
				<p>${showList.pool_resv_seq }</p>
				</td>
				<td class="tl">
					<div class="tableThumb_small">
					<c:if test="${pool.pool_photo != 'default' }">
						<img src="<%=request.getContextPath() %>/images/poolImg/${showList.pool_photo }" >
					</c:if>
					<c:if test="${pool.pool_photo == 'default' }">
						<img  src="<%=request.getContextPath()%>/images/poolImg/pool.png" >
						</c:if>
					</div>
					<div class="prdInfo">
					<div class ="info">
							<p class="c_gray">[${showList.pool_name }]</p>
							<p class="pt5">고객명 : <Strong>${showList.pool_resv_name }</Strong>  (${showList.pool_resv_tel } ) </p>
							<p class="pt5">예약일 : ${showList.pool_resv_sdate }</p>
							<p class="pt5">예약시간 : ${showList.pool_resv_time }</p>
							</div>
					</div>
				</td>
				<td>${showList.pool_resv_user }</td>
				<td>${showList.pool_resv_pet}</td>
				<td>${showList.pool_resv_total_price }원</td>
			</tr>
	</c:forEach>
	</c:if>
	<c:if test = "${fn:length(poolList) == 0 }">
			<tr>
				<td colspan="5">취소하신 내역이 없습니다.</td>
			</tr>
	</c:if>
		</tbody>
	</table>
   <jsp:include page="/include/paging.jsp" flush="false">
      <jsp:param name="totalRecordCount" value="${totalRecordCount }" />
      <jsp:param name="pageNumber" value="${pageNumber }" />
      <jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
      <jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
</jsp:include> 
</div>
</div>
</div>

<script>
function goPage( pageNumber ){
	location.href = "poolCancleList.do?pageNumber="+pageNumber;
}

$(document).on("click", ".poolResv", function(){
	var pool_resv_seq = $(this).attr("pool_resv_seq");
	location.href ="pool_reservation.do?pool_resv_seq="+pool_resv_seq;
});

</script>



<%@ include file="./../../../include/footer.jsp" %>