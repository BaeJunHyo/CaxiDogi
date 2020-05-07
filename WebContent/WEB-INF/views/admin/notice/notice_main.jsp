<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../../../../include/bo/bo_header.jsp" %>

<style>
.btn22{display: inline-block;
    height: 24px;
    line-height: 24px;
    padding: 0 15px;
    font-size: 13px;
    color: #fff;
    border-radius: 12px;
    background: #000;float:right;}
</style>

<%@ include file="/include/bo/bo_leftNav_order.jsp"%>

<div class="containerWrap">
	<ul class="gnb">
		<!-- <li><a href="#n">기본설정</a></li> -->
		<li><a href="productList.do" class="current">상품관리</a></li>
		<li><a href="orderList.do">주문/배송</a></li>
		<!-- 
		<li><a href="#n">회원</a></li>
		<li><a href="#n">게시판</a></li>
		<li><a href="#n">프로모션</a></li>
		<li><a href="#n">디자인</a></li>
		<li><a href="#n">통계</a></li> 
		-->
	</ul><!--// gnb -->

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
					<span class="table_sbj">공지 사항 검색</span>
					<a href="javascript:openWrite()" class="btn22">+ 글등록</a>
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
									<option value="title">제목</option>
									<option value="content">내용</option>
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
						            <label>회원</label>
						            
						            <input type="radio" name="s_soldState" value="2">
						            <label>셀러</label>
						            
						            <input type="radio" name="s_soldState" value="3">
						            <label>관리자</label>
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
			<!-- width : 1198 -->
				<table style="width: 1198px;">
					<colgroup>
						<col width="100px">
						<col width="*">
						<col width="150px">
						<col width="150px">
					</colgroup>
					<thead>
						<tr>
							<th>구분</th>
							<th>글제목</th>
							<th>작성일</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						
						</tr>
					</tbody>
				</table>
			</div>
		</div>	
	</form>
</div>

<script>

	function openWrite(){
		window.open("adminNoticeWrite.do","관리자 글 작성","top:200px, left:400px, height=500px, width=800px, scrollbar=yes, location=no,status=no,menubar=no")
		//console.log("누름");
	}
</script>
		
					