<%@page import="cd.com.a.model.memberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<%@include file="/include/bo/bo_header.jsp" %>
<%@include file="/include/bo/bo_leftNav_product.jsp" %>
<%
List<memberDto> sellerAccessList = (List<memberDto>)request.getAttribute("sellerAccessList");
%>
<style>
.btn_pass{
	display: inline-block;
    height: 24px;
    line-height: 24px;
    padding: 0 15px;
    margin: 0 3px 0 0;
    font-size: 13px;
    color: #fff;
    border-radius: 12px;
    background: #1d2b36;
}
.btn_return{
	display: inline-block;
    height: 24px;
    line-height: 24px;
    padding: 0 15px;
    margin: 0 3px 0 0;
    font-size: 13px;
    color: #fff;
    border-radius: 12px;
    background: #1d2b36;
}
</style>
<div class="containerWrap">
	<ul class="gnb">
      <li><a href="#n">기본설정</a></li>
      <li><a href="#n" class="current">상품관리</a></li>
      <li><a href="#n">주문/배송</a></li>
      <li><a href="#n">회원</a></li>
      <li><a href="#n">게시판</a></li>
      <li><a href="#n">프로모션</a></li>
      <li><a href="#n">디자인</a></li>
      <li><a href="#n">통계</a></li>
   </ul><!--// gnb -->
	<div class="container">
	
		<div class="cn_wrap">
		<div class="table_top">
            <span class="table_sbj">샐러 승인 관리</span>
			<button type="button" class="btn_r_red"id="btn_accessReturn">반려</button>
			<button type="button" class="btn_r_red"id="btn_accessPass">승인</button>
         </div><!--// table_top -->
		<table border="1">
			<!-- <col width="250px">
			<col width="150px">
			<col width="70px">
			<col width="100px">
			<col width="300px">
			<col width="20px"> -->
			<tr align="center">
				<th>I D</th>
				<th>닉 네 임</th>
				<th>실  명</th>
				<th>연 락 처</th>
				<th colspan="2">주  소</th>
				<th><input type="checkbox" name="chk_All" id="chk_All"></th>
			</tr>
			<%
			if(sellerAccessList!=null && sellerAccessList.size()!=0){
				memberDto sellerList = null;
				String address = null;
				for(int i = 0; i<sellerAccessList.size();i++){
					sellerList = sellerAccessList.get(i);
			%>
			<tr align="center">
				<td><%=sellerList.getId() %></td>
				<td><%=sellerList.getNick_name() %></td>
				<td><%=sellerList.getUser_name() %></td>
				<td><%=sellerList.getPhone() %></td>
				<td width="250px"><%=(String)sellerList.getAddress().split("/")[1] %></td>
				<td width="45px">
					<input type="button" class="btn_pass" value="승인">
					<input type="button" class="btn_return" value="반려">
					<input type="hidden" name="mem_seq" class="mem_seq"value="<%=sellerList.getMem_seq()%>">
				</td>
				<td>
					<input type="checkbox" id="chk_box" name="chk_box"value="<%=sellerList.getMem_seq() %>">
				</td>
			</tr>
			<%		
				}
			}else{
			%>
			<tr>
				<td colspan="6">승인 대기 중인 회원이 없습니다.</td>
			</tr>
			<%}%>
		</table>
		</div>
	</div>
</div><!-- containerWrap -->
<script src="<%=request.getContextPath() %>/js/sellerAccess.js"></script>