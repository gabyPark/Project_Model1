<%@page import="com.diary.DiaryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WebContent / center / reWritePro.jsp</title>
</head>
<body>

<h1>WebContent / center / reWritePro.jsp</h1>

	<%
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
	
		// 전달정보 저장
		// pageNum
		String pageNum = request.getParameter("pageNum");
		
		// num, re_ref, re_lev, re_seq, name, pass, subject, content
		// => 액션태그 사용 BoardBean 에 저장
		%>
		
		<jsp:useBean id="bb" class="com.diary.DiaryBean" />
		<jsp:setProperty property="*" name="bb" />
		
		<%
		System.out.println("pro (답글) : "+bb);
		
		// BoardDAO 객체 생성 -> reInsertBoard(bb);
		DiaryDAO bdao = new DiaryDAO();
		bdao.reInsertBoard(bb); 
		
		// 페이지 이동
		response.sendRedirect("diaryList.jsp?pageNum="+pageNum);
		
		%>

</body>
</html>