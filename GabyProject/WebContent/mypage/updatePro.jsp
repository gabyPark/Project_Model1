<%@page import="com.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello Doggy :: My Page</title>
</head>
<body>

	<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");
	
	// 로그인 세션 제어
	String id = (String)session.getAttribute("id");
	
	if(id == null){
		System.out.println("정보 수정 -> 로그인 페이지");
		response.sendRedirect("loginForm.jsp");
	}
	
	%>
	
	<jsp:useBean id="updateMember" class="com.member.MemberBean" />
	<jsp:setProperty property="*" name="updateMember" />
	
	<%
	System.out.println("수정할 정보"+updateMember); 
	
	// 수정할 정보를 가지고 DB객체(DAO)로 이동
	MemberDAO mdao = new MemberDAO();
	
	// 정보 수정 메소드 구현 - updateMember(수정할 정보);
	int check = mdao.updateMember(updateMember); 
	
	System.out.println("pro : 수정 결과 => "+check);
	
	// 처리 결과에 따른 페이지 이동
	// 수정 완료 => 1
	// 비밀번호 오류 => 0
	// 아이디가 없는 경우 => -1
	
	if(check == 1){
		%>
		<script type="text/javascript">
		   alert("정보 수정 완료!");
		   location.href="mypage.jsp";
		</script>
		<%
	} else if (check == 0){
		%>
		<script type="text/javascript">
		   alert("비밀번호 오류!");
		   history.back();
		</script>
		<%		
	} else {   // check == -1
		%>
		<script type="text/javascript">
		   alert("비회원입니다!");
		   history.back();
		</script>
		<%	
	}
	
	%>
	
	
</body>
</html>