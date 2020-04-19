<%@page import="cd.com.a.model.shopParam"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./../../../include/header.jsp"%>


 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link href="./css/calstyle2.css" rel="stylesheet">
<style>

</style>
<%
/* List<shopParam> list = (List<shopParam>)request.getAttribute("getDesigner");

for(int i = 0; i<list.size(); i++){
	shopParam dto = list.get(i);
	if(dto.getDesign_seq() == 1){
	String str = dto.getDesign_time();
	
	String [] time = str.split("/");
	for(int j = 0; j < time.length; j++){
	String dtime = time[j];
	
	
	System.out.println(dtime);
	}
}
} */
%>

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <div class="container container_subWrap" id="fixNextTag">
  
  <div>
  <form>
  <span>Date: <input type="text" id="datepicker"></span>
  <c:forEach items="${shopList }" var="sd" varStatus="sp">
  <c:if test="${sp.count == 1 }">
  <span>${sd.shop_small_price }</span>
  <span>${sd.shop_medium_price }</span>
  <span>${sd.shop_large_price }</span>
  </c:if>
<%--   <p id="dname"  onclick="getTime(${sd.design_seq })">${sd.design_name }</p> --%>
   </c:forEach>
   
   
  <c:forEach items="">
<%--   <p id="desgin_time">${sd.design_time }</p> --%>
  </c:forEach>
<%--   <input type="button" name="resvTime" value="${sd.design_time }"> --%>
 
  
  </form>
  </div>
  
  
  
  
  </div>
  
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  });

<%-- 	function getTime(seq){
		
		$("#desgin_time").show();
		<% 
		
		%>
	}); --%>
  
  </script>












<%@ include file="./../../../include/footer.jsp"%>