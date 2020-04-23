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
				<span class="t_sbj">수영장 예약 상세</span>
			</h3>
		</div>
		
		<div class="clearfix">
			<ul>
				<li>
					<dl>
						<dt>상호명</dt>
						<dd class="c_green">${pool.pool_name}</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>주소</dt>
						<dd>${fn:split(pool.pool_addr, '/')[1] }</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>연락처</dt>
						<dd id="tel"></dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>예약일</dt>
						<dd>${pool_resv.pool_resv_sdate }</dd>
					</dl>
					<input type ="hidden" name ="pool_resv_sdate" value ="${pool_resv.pool_resv_sdate }">
				</li>
				<li>
					<dl>
						<dt>예약 시간</dt>
						<dd>${pool_resv.pool_resv_time}</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>인원</dt>
						<dd>
						${pool_resv.pool_resv_user}
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>반려견</dt>
						<dd>
						${pool_resv.pool_resv_pet}
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>예상 총 금액</dt>
						<dd id="price">
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>예약자명</dt>
						<dd>
							${pool_resv.pool_resv_name}
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>연락처</dt>
						<dd id="userTel">
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>코멘트</dt>
						<dd>
						${pool_resv.pool_resv_comment }
						</dd>
					</dl>
				</li>
			</ul>
	
		</div>

	</div><!--// contents -->

</div><!--container E : -->
<script type="text/javascript">
$(document).on("click",".poolResv", function(){

	alert($(this).attr("pool_resv_seq"));
	
});
</script>

<%@ include file="./../../../../include/footer.jsp" %>