<%@page import="com.member.MemberBean"%>
<%@page import="com.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello Doggy :: ID Check</title>
</head>
<body>


	<%
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		
		MemberDAO mdao = new MemberDAO();
		boolean result = false;

		
		System.out.println("로그인 체크값 : "+result);
		// 로그인 성공 - [1]
		// 비밀번호 오류 - [0]
		// 아이디가 없는 경우 - [-]		
				
		if(id == null || id.equals("")){ 
			id = "";
		} else {  // check == -1
			result = mdao.usedID(id);
		}
				
		// 결과에 따른 페이지 이동			
	%>
	
	
	<script type="text/javascript">
		function setId(){
			opener.document.fr.idDupChk.value = "t";
			opener.document.fr.id.value="<%=id %>";
			self.close();
		}
	</script>
	
	<form name="fr" action="">
		<input type="text" name="id" value="<%=id %>" />
		<input type="submit" value="검색">
	</form>
	
	<%
		if(id.equals("")){ 
			
		} else if (result == false){
			%>
			<a href="" onclick="setId()">사용가능한 아이디입니다</a>
			<% 
			} else {
	%> 중복된 아이디입니다 <%
			}
	%>
	

</body>
</html>