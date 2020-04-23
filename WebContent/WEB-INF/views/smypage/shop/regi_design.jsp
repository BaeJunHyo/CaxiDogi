<%@page import="cd.com.a.model.shopDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../../../../include/header.jsp" %>
<%@ include file="./../../../../include/left_frm_seller.jsp" %>

<%
	shopDto shop = (shopDto)request.getAttribute("shop");
	String time[] = shop.getShop_time().split("~");
	String startTime[] = time[0].trim().split(":");
	String endTime[] = time[1].trim().split(":");
%>
	<div class="cusSec_right">

		<div class="cusSec_tableWrap tw_wFull">
			<h3>
				<span class="t_sbj">디자이너등록</span>
			</h3>
		<div class ="company_regi"  style = "margin-top : 10px;">
			<input type ="hidden" id = "shop_seq" name="shop_seq" value="${shop.shop_seq }">
			<label style = "width:100px;">디자이너명</label>
			<input  type="text" id = "design_name" name = "design_name" placeholder="디자이너명을 입력해주세요" size = "500">
		</div>
		<div class ="company_regi"  style = "margin-top : 10px;">
			<label style = "width:100px;">디자이너 추가금</label>
			<input type="text" id = "design_price" name = "design_price" placeholder="디자이너 추가금을 입력해주세요" size = "500">
		</div>

		<div class ="time" style = "margin-top : 10px;">
			<label style = "width:100px;">영업시간</label>
			<ul id = "timetable">
				<li>
					<select name="hour">
						<% for (int i =Integer.parseInt(startTime[0]); i<=Integer.parseInt(endTime[0])-2; i++){ %>
						<option><%=(i<10)? "0"+i: i %></option>
						<%} %>
					</select>시 
					<select name = "min">
						<%for(int i=0; i<=59; i++){ %>
							<option><%=(i<10)? "0"+i: i %></option>
						<%} %>
					</select>분
					&nbsp;
					<button type ="button" class ="btn_line_s plus" >+</button>
				</li>
			</ul>
		</div>
		<div style ="margin-top:10px; " align ="center">
			<input class = "btn_line_m" type ="button" id = "designAddBtn" value = "등록">		
			
			<input class ="btn_line_m" type ="button" onclick = "location.href='sellerShopList.do'" value = "취소">		
			
		</div>
	</div>
</div>
</div>

<script type="text/javascript">
	$(document).on("click",".plus", function(){
			var sTime = <%=Integer.parseInt(startTime[0])%>;
			var eTime = <%=Integer.parseInt(endTime[0])-2%>;
			
			var appendHtml ="<li style='margin-top:5px;'>";
				appendHtml += "<select name='hour'>";
				
				for(i = sTime; i <= eTime; i++){
					if(i<10){
						appendHtml += "<option>0" + i + "</option>";
					}else{
						appendHtml += "<option>" + i + "</option>";	
					}
				}
				appendHtml += "</select>시&nbsp;"; 
				//분 생성
				appendHtml += "<select name = 'min'>";
				for(i= 0; i < 60; i++){
					if(i<10){
						appendHtml += "<option>0" + i + "</option>";
					}else{
						appendHtml += "<option>" + i + "</option>";	
					}
				}
				appendHtml += "</select>분&nbsp;&nbsp;&nbsp;";
				appendHtml += "<button type ='button' class ='btn_line_s plus'>+</button></li>";
			$("#timetable").append(appendHtml);
		});


	$("#designAddBtn").on("click", function(){
		if($("#design_name").val() ==''){
			alert("디자이너명을 입력해 주세요");
			$("#design_name").focus();
		} else {
			var hourList = new Array();
			var minList = new Array();
			var timetable = "";
			$("select[name='hour'] :selected").each(function(index, item){
				hourList.push($(item).text());	
			});
			$("select[name='min'] :selected").each(function(index, item){
				minList.push($(item).text());	
			});
			
			for(i = 0; i < hourList.length;i++){
				if(i != hourList.length-1){
					timetable += hourList[i]+":"+minList[i] +"/";
				} else {
					timetable += hourList[i]+":"+minList[i];
				}
			}

			var formData = {
					"shop_seq": $("#shop_seq").val(),
					"design_price" : $("#design_price").val()==""?0:$("#design_price").val(),
					"design_name" : $("#design_name").val(),
					"design_time" : timetable
			}
			  $.ajax({
		          url:"./shopDesignAddAf.do",
		          type:'post',
		          data: formData,
		          success: function (data){
		             Swal.fire({
		            	  icon: 'success',
		            	  title: '디자이너 등록에 성공하셨습니다.',
		            	  showConfirmButton: true
		            	}).then(function(){
		        	  window.location="sellerShopList.do?mem_seq="+$("#shop_seq").val();});
		          },
		          error: function (e){
		             alert("통신실패");
		     	}
			});
		} 
	}); 
	
</script>
<%@ include file="./../../../../include/footer.jsp" %>