<%@page import="cd.com.a.model.memberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%
List<memberDto> sellerAccessList = (List<memberDto>)request.getAttribute("sellerAccessList");
System.out.println(sellerAccessList.size());
%>
<div>
	<button type="button" id="btn_accessPass">승인</button>
	<button type="button" id="btn_accessReturn">반려</button>
	<table border="1">
		<col width="250px">
		<col width="150px">
		<col width="70px">
		<col width="100px">
		<col width="300px">
		<col width="20px">
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
			<td><%=(String)sellerList.getAddress().split("/")[1] %></td>
			<td>
				<input type="button" value="승인">
				<input type="button" value="반려">
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

<script>
// 체크 박스 전체 선택
$(document).ready(function(){
	$("#chk_All").click(function(){
		 if($("#chk_All").prop("checked")){
			 $("input[name=chk_box]").prop("checked",true);
		 }else{
			 $("input[name=chk_box]").prop("checked",false);
		 }
	});
});//ready end
</script>

<script>
	 // 체크박스 승인
$("#btn_accessPass").click(function(){
	var passList = new Array();
	   $('input[name="chk_box"]:checked').each(function(index, item){
		   passList.push($(item).val());
	   });
	alert(passList);
  	if(confirm("정말로 승인 하시겠습니까?")){
		   $.ajax({
				type : "POST",
				url : "sellerAccessPass.do",
				data : {"passList":passList},
				datatype : "text",
		  		success : function(data) {
		  			 if(data==="success"){
		       		 alert("성공적으로 승인 되었습니다.");
					 location.reload();
			  		 }
		        },
		    	error : function(xhr,status,error) {
		    		// Ajax error
		    		alert("승인에 실패 했습니다.");
		    	}
				});// ajax end
  	}// if end
}); //click end

// 체크박스 반려
$("#btn_accessReturn").click(function(){
	var failList = new Array();
	   $('input[name="chk_box"]:checked').each(function(index, item){
		   failList.push($(item).val());
	   });
	alert(failList);
  	if(confirm("정말로 반려 하시겠습니까?")){
		   $.ajax({
				type : "POST",
				url : "sellerAccessFail.do",
				data : {"failList":failList},
				datatype : "text",
		  		success : function(data) {
		  			 if(data==="success"){
		       		 alert("성공적으로 반려 되었습니다.");
					 location.reload();
			  		 }
		        },
		    	error : function(xhr,status,error) {
		    		// Ajax error
		    		alert("반려에 실패 했습니다.");
		    	}
				});// ajax end
  	}// if end
}); //click end
</script>
