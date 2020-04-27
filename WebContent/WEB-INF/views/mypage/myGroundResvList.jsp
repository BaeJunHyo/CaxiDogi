<%@page import="cd.com.a.model.groundResvParam"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
List<groundResvParam> myGroundResvList = (List<groundResvParam>)request.getAttribute("myGroundResvList");
%>

<div class="cusSec_tableWrap tw_wFull">
	<h3>
		<span class="t_sbj">최근 운동장 예약내역</span>
		<span class="c_gray">(최근 예약 5건 / 1개월 내)</span>
		
		<!-- 더보기 Link 넣을것 -->
		<a href="#n" class="btn_dark_s fr">더보기</a>
	</h3>
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
				<th>진행상태</th>
			</tr>
		</thead>
		<tbody>
		<%
		if(myGroundResvList !=null && myGroundResvList.size()!=0){
			groundResvParam groundResv = null;
			int size = 0;
			if(myGroundResvList.size()<=5){
				size = myGroundResvList.size();
			}else{
				size = 5;
			}
			for(int i=0 ;i<size;i++){
				groundResv = myGroundResvList.get(i);
				
				
			
		%>
			<tr>
				<td>
				<a href="#n" class="prdNum">
				<P><%=groundResv.getGround_resv_ydate() %><p>
				<p><%=groundResv.getGround_resv_seq() %><p>
				</a></td>
				<td class="tl">
					<!-- <a href="#n" class="tableThumb_small"><img src="./images/mypage/img_prdBigThumb.jpg"></a> -->
					<a href="#n" class="tableThumb_small"><img src="<%=request.getContextPath()%>/upload/#"></a>
					<div class="prdInfo">
						<a href="#n">
							<p class="c_gray">[<%=groundResv.getGround_name() %>]</p>
							<p class="pt5">고객명 : <Strong><%=groundResv.getGround_resv_name()%></Strong>  ( <%=groundResv.getGround_resv_tel() %> ) </p>
							<p class="pt5">예약일 : <%=groundResv.getGround_resv_sdate() %></p>
							<p class="pt5">예약시간 : <%=groundResv.getGround_resv_time() %></p>
						</a>
					</div>
				</td>
				<td><%=groundResv.getGround_resv_user() %></td>
				<td><%=groundResv.getGround_resv_pet() %></td>
				<td><%=groundResv.getGround_resv_total_price() %>원</td>
				<td>
				<%
				String resvStatus ="";
				switch(groundResv.getGround_resv_auth()){
				case 0: resvStatus="[예약대기]";
						break;
				case 1: resvStatus="[결재대기]";
						break;
				case 2: resvStatus="[결재완료]";
						break;
				}
				%>
					<p><%=resvStatus %></p>
					<a href="#n" class="btn_line_s">상품평작성</a>
				</td>
			</tr>
			
		<%	
			}
		}else{ 
		%>	
			<tr>
				<td colspan="5">최근 1개월 동안 구매하신 내역이 없습니다.</td>
			</tr>
		<%}%>
		</tbody>
	</table>
</div> 