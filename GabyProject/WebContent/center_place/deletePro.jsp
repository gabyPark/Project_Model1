<%@page import="com.member.Board.BoardBean"%>
<%@page import="com.member.Board.BoardDAO_place"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WebContent / center / deletePro.jsp</title>
</head>
<body>

<h1>WebContent / center / deletePro.jsp</h1>

	<%
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
	
		// 전달된 정보 저장 (pageNum, num, pass)
		// => BoardBean 객체에 저장
		String pageNum = request.getParameter("pageNum");
		
		BoardBean bb = new BoardBean();
	     bb.setNum(Integer.parseInt(request.getParameter("num")));
	     bb.setPass(request.getParameter("pass"));
	     
		/*
		String pass = request.getParameter("pass");
		bb.setPass(pass);
		는 위의 코드와 같다 (한 줄로 작성)
		*/
		
		System.out.println("pro (삭제 할 번호, 비밀번호): "+bb.toString());
		
		// BoardDAO 객체 생성
		BoardDAO_place bdao = new BoardDAO_place();
		// deleteBoard(bb) - 글 삭제 메서드
		int check = bdao.deleteBoard(bb); 
		
		// 처리 결과에 따른 페이지 이동
		
     if(check == 1){
    	 %>
    	  <script type="text/javascript">
    	    alert("글 삭제 완료!");
    	    location.href="boardList.jsp?pageNum=<%=pageNum%>";
    	  </script>    	 
    	 <%    	 
     }else if(check == 0){
    	 %>
    	  <script type="text/javascript">
    	    alert("글 삭제 오류 : 비밀번호 오류!");
    	    history.back();
    	  </script>    
    	 <%
     }else { // check == -1
    	 %>
	   	  <script type="text/javascript">
	   	    alert("글 삭제 오류 : 게시글 오류!");
	   	    history.back();
	   	  </script>    
	   	 <%
     }
		%>
		

</body>
</html> 