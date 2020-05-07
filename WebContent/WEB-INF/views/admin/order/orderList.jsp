<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../../../../include/bo/bo_header.jsp" %>

<%
String category = (String)request.getAttribute("s_category");
if(category == null) category = "";
	
String keyword = (String)request.getAttribute("s_keyword");
if(keyword == null) keyword = "";
%>

<script>
var category = "<%=category %>";
var keyword = "<%=keyword %>";
$(document).ready(function () {
	$("#_s_category").val( category );
	$("#_s_keyword").val( keyword );
	
	document.prdSrchFrm.s_keyword.value = keyword;
});
</script>

<%@ include file="/include/bo/bo_leftNav_order.jsp"%>

<div class="containerWrap">
	<%@ include file="/include/bo/bo_gnb_order.jsp"%>

	<form name="serchForm" id="serchForm" method="post">
		<div class="container">
			<div class="top clearfix">
				<ul class="menu_dept clearfix">
					<li>상품관리</li>
					<li>상품리스트</li>
				</ul>
				<ul class="color_info clearfix">
					<li><img src="./images/bo/img_colorInfo_01.gif">입력정보</li>
					<li><img src="./images/bo/img_colorInfo_02.gif">조회정보</li>
					<li><img src="./images/bo/img_colorInfo_03.gif">링크</li>
					<li><img src="./images/bo/img_colorInfo_04.gif">신규/수정</li>
					<li><img src="./images/bo/img_colorInfo_05.gif">삭제</li>
				</ul>
			</div><!--// top -->
	
		
			<div class="cn_wrap">
				<div class="table_top">
					<span class="table_sbj">주문 요청 검색</span>
				</div><!--// table_top -->
				
				<!-- 검색 -->
				<table class="product_srchTable">
					<colgroup>
						<col width="162px">
						<col width="*">
						<col width="162px">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>검색어</th>
							<td colspan="3">
								<select id="_s_category" name="s_category">
									<option value="0" selected>통합검색</option>
									<option value="주문번호">주문번호</option>
									<option value="ID">회원ID</option>
									<option value="회원이름">회원이름</option>
								</select>
								<input type="text" id="_s_keyword" name="s_keyword">
							</td>
						</tr>
						<tr>
						    <th>구매 요청 상태</th>
						    <td>
						        <span class="select_wrap">
						            <input type="radio" name="s_soldState" value="0" checked="checked">
						            <label>전체</label>
						            
						            <input type="radio" name="s_soldState" value="1">
						            <label>교환</label>
						            
						            <input type="radio" name="s_soldState" value="2">
						            <label>반품</label>
						            
						            <input type="radio" name="s_soldState" value="3">
						            <label>환불</label>
						        </span>
						        <!-- <span class="select_wrap">
						            
						        </span>
						        <span class="select_wrap">
						            
						        </span> -->
						    </td>
						</tr>
						<tr class="prdSearch">
							<td colspan="4">
								<a href="#n" id="_btnSearch">검 색</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- //cn_wrap -->
			
			<div>
				<table>
					<colgroup>
						<col width="">
						<col width="">
						<col width="">
					</colgroup>
					<thead>
						
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>	
	</form>
</div>
		