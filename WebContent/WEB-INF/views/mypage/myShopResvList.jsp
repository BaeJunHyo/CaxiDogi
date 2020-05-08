<%@page import="cd.com.a.model.shopShowResvParam"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
List<shopShowResvParam> myShopResvList = (List<shopShowResvParam>)request.getAttribute("myShopResvList");
%>
<div class="cusSec_tableWrap tw_wFull">
	<h3>
		<span class="t_sbj">최근 미용 예약내역</span>
		<span class="c_gray">(최근 예약 5건 / 1개월 내)</span>
		<a href="showShopResv.do" class="btn_dark_s fr">더보기</a>
	</h3>
	<table class="basic_tableStyle">
		<colgroup>
			<col width="115px">
			<col width="*">
			<col width="115px">
			<col width="115px">
			<col width="115px">
		</colgroup>
		<thead>
			<tr>
				<th>예약일/예약번호</th>
 				<th>예약정보</th>
				<th>견종</th>
				<th>예약금액</th>
				<th>진행상태</th>
			</tr>
		</thead>
		<tbody>
		<%
		if(myShopResvList !=null && myShopResvList.size()!=0){
			shopShowResvParam shopResv = null;
			int size = 0;
			if(myShopResvList.size()<=5){
				size = myShopResvList.size();
			}else{
				size = 5;
			}
			for(int i=0 ;i<size;i++){
				shopResv = myShopResvList.get(i);
				System.out.println("shop1234="+shopResv.toString());
				
			
		%>
			<tr>
				<td>
				<a href="#n" class="prdNum">
				<P><%=shopResv.getShop_resv_day() %><p>
				<p><%=shopResv.getShop_resv_seq() %><p>
				</a></td>
				<td class="tl" >
					<!-- <a href="#n" class="tableThumb_small"><img src="./images/mypage/img_prdBigThumb.jpg"></a> -->
					<a href="#n" class="tableThumb_small"><img src="<%=request.getContextPath()%>/images/shopImg/<%=shopResv.getShop_photo()%>"></a>
					<div class="prdInfo">
						<a href="shopResvAf.do?shop_resv_seq=<%=shopResv.getShop_resv_seq() %>">
							<p class="c_gray">[<%=shopResv.getShop_name() %>-<%=shopResv.getDesign_name() %>]</p>
							<p class="pt5">고객명 : <Strong><%=shopResv.getShop_resv_name()%></Strong>  ( <%=shopResv.getShop_resv_tel() %> ) </p>
							<p class="pt5">예약일 : <%=shopResv.getShop_resv_rday() %></p>
							<p class="pt5">예약시간 : <%=shopResv.getShop_resv_time() %></p>
							</a>
					</div>
				</td>
				
				
				<%
				String dogSize ="";
				switch(shopResv.getShop_resv_size()){
				case 0: dogSize="[소형견]";
						break;
				case 1: dogSize="[중형견]";
						break;
				case 2: dogSize="[대형견]";
						break;
				}
				%>
				<td><%=dogSize%></td>
				<td><%=shopResv.getShop_resv_price() %>원</td>
				<td>
				<%
				String resvStatus ="";
				switch(shopResv.getShop_resv_auth()){
				case 0: resvStatus="[예약]";
						break;
				case 1: resvStatus="[취소]";
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