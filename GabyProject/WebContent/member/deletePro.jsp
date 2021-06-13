<%@page import="java.io.PrintWriter"%>
<%@page import="javax.websocket.SendResult"%>
<%@page import="com.member.MemberDAO"%>
<%@page import="com.member.MemberBean"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>deletePro.jsp</title>
</head>
<body>

<h1>deletePro.jsp</h1>

	<%
	
	request.setCharacterEncoding("UTF-8");
	PrintWriter writer = response.getWriter();
	
	// 로그인 세션 제어
	String id = (String)session.getAttribute("id");
	if(id == null){
		
		writer.println("<script>");
		writer.println("alert('로그인 후 사용 가능합니다!')");
		writer.println("location.href='login.jsp'");
		writer.println("</script>");
						 
		writer.flush();
		writer.close();
		
	} 
	
	// 삭제 할 계정 정보를 받아서 처리
	String pw = request.getParameter("pw");
	
	// DAO 객체 생성 -> deleteMember(id, pw); 메소드 생성
	MemberDAO mdao = new MemberDAO();
	int check = mdao.deleteMember(id, pw); 
	
	// 처리 결과를 저장해서 페이지 이동
	// 삭제 완료 1, 비밀번호 오류2, 비회원-1
	if (check == 1){

		// 로그인 정보를 삭제 해줘야함 !!!!!!!!!!!!!!
		session.invalidate();
		response.sendRedirect("deleteProPro.jsp");

	} else {
		%>
 		<script type="text/javascript">
		   alert("아이디 혹은 비밀번호 오류!");
		   history.back();
		</script> 
		<%		
	}
		%> 


</body>
</html>