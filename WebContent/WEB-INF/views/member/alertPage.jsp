<%@page import="cd.com.a.model.memberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
String login = (String)request.getAttribute("login");
String regi = (String)request.getAttribute("regi");
String update = (String)request.getAttribute("update");
String msg = (String)request.getAttribute("msg");
memberDto loginUser = (memberDto)request.getSession().getAttribute("loginUser");
String sns = "";


// 로그인시 API구분 변수
// 로그인 MSG
if(login != null){
	if(login.equals("true")){
		if(loginUser!=null){
			if(loginUser.getUser_api() == 1){
				 sns ="카카오계정";
			}else if(loginUser.getUser_api() == 2){
				 sns ="네이버계정";
			}else if(loginUser.getUser_api() == 3){
				 sns ="구글계정";
			}else{
				 sns ="일반계정";
			}
		}
%>
<script>
	alert("[<%=sns%>] 으로 \n 정상 로그인 되었습니다.");
	// 자체회원은 메인
</script>
		<%
		if(loginUser.getUser_api() == 0){
		%>
		<script>
			location.href="main.do";
		</script>
		<%		
	// sns 마이페이지 회원정보이동
		}else{
			if(loginUser.getUser_name()==null || 
				loginUser.getNick_name()==null ||
				(loginUser.getAddress().replaceAll(" ", "")).replaceAll("/", "") ==null ||
				loginUser.getPhone()==null ||
				loginUser.getBirthday()==null ){
			%>
			<script>
				alert("원활한 이용을 위해 \n 미입력된 정보를 기입해주세요^^")
				location.href="snsFirstLogin.do";
			</script>
			<%
			}else{
			%>
			<script>
				location.href="main.do";
			</script>
			<%
			} 
		}
	}else{
%>
<script>
	alert("잘못된 로그인 입니다. \n 다시 로그인 해주세요.");
	location.href="loginView.do";
</script>
<%
	}
}


// 자체 회원가입 MSG
if(regi != null){
	if(regi.equals("true")){
%>
<script>
	if(confirm("정상적으로 회원가입되었습니다 \n 지금 바로 로그인 하시겠습니까?")){
		location.href="loginView.do";
	}else{
		location.href="main.do";
	}
</script>
<%
	}else{
%>
<script>
	alert("회원가입에 실패하였습니다");
	location.href="newAccount.do";
</script>
<%
	}
}

// 회원정보 업데이트 MSG
if(update != null){
	if(update.equals("true")){
		if(loginUser.getUser_api()==0){
%>
		<script>
			alert("정상적으로 적용되었습니다.")
			location.href="memberDetail.do";
		</script>
<%
		}else{
%>
		<script>
			alert("정상적으로 적용되었습니다.")
			location.href="main.do";
		</script>
<%
		}
	}else{
%>
<script>
	alert("회원정보 업데이트 간 문제 발생")
	location.href="mypageMove.do";
</script>	
<%	
	}
}

// 그외 MSG
if(msg != null){
%>
<script>
	alert("<%=msg%>");
	location.href="main.do";
</script>
<%
}
%>				