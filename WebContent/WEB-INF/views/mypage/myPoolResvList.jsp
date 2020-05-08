<%@page import="cd.com.a.model.poolResvParam"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
List<poolResvParam> myPoolResvList = (List<poolResvParam>)request.getAttribute("myPoolResvList");
%>

<div class="cusSec_tableWrap tw_wFull">
	<h3>
		<span class="t_sbj">최근 수영장 예약내역</span>
		<span class="c_gray">(최근 예약 5건 / 1개월 내)</span>
		
		<!-- 더보기 Link 넣을것 -->
		<a href="poolResvList.do" class="btn_dark_s fr">더보기</a>
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
		if(myPoolResvList !=null && myPoolResvList.size()!=0){
			poolResvParam poolResv = null;
			int size = 0;
			if(myPoolResvList.size()<=5){
				size = myPoolResvList.size();
			}else{
				size = 5;
			}
			for(int i=0 ;i<size;i++){
				poolResv = myPoolResvList.get(i);
				
			
		%>
			<tr>
				<td>
				<a href="#n" class="prdNum">
				<P><%=poolResv.getPool_resv_ydate() %><p>
				<p><%=poolResv.getPool_resv_seq() %><p>
				</a></td>
				<td class="tl">
					<!-- <a href="#n" class="tableThumb_small"><img src="./images/mypage/img_prdBigThumb.jpg"></a> -->
					<a href="poolDetail.do?pool_seq=<%=poolResv.getPool_seq() %>" class="tableThumb_small"><img src="<%=request.getContextPath()%>/images/poolImg/<%=poolResv.getPool_photo()%>"></a>
					<div class="prdInfo">
						<a href="pool_reservation.do?pool_resv_seq=<%=poolResv.getPool_resv_seq() %>">
							<p class="c_gray">[<%=poolResv.getPool_name() %>]</p>
							<p class="pt5">고객명 : <Strong><%=poolResv.getPool_resv_name()%></Strong>  ( <%=poolResv.getPool_resv_tel() %> ) </p>
							<p class="pt5">예약일 : <%=poolResv.getPool_resv_sdate() %></p>
							<p class="pt5">예약시간 : <%=poolResv.getPool_resv_time() %></p>
						</a>
					</div>
				</td>
				<td><%=poolResv.getPool_resv_user() %></td>
				<td><%=poolResv.getPool_resv_pet() %></td>
				<td><%=poolResv.getPool_resv_total_price() %>원</td>
				<td>
				<%
				String resvStatus ="";
				switch(poolResv.getPool_resv_auth()){
				case 0: resvStatus="[예약대기]";
						break;
				case 1: resvStatus="[결제대기]";
						break;
				case 2: resvStatus="[예약완료]";
						break;
				case 3: resvStatus="[취소]";
						break;
				case 7: resvStatus="[이용완료]";
						break;
				}
				%>
					<p><%=resvStatus %></p>
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