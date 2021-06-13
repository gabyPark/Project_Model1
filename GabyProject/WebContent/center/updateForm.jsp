<%@page import="com.member.Board.BoardBean"%>
<%@page import="com.member.Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Doggy :: 게시글 수정</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
 <jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
 <jsp:include page="../inc/left.jsp"></jsp:include>
<!-- 왼쪽메뉴 -->

<%
	// 파라미터값 num, pageNum 저장
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	// DB 이동 후 num에 해당하는 정보를 가져오기
	// -> 화면에 출력(글쓴이, 제목, 내용)
 	BoardDAO bdao = new BoardDAO();
	BoardBean bb = bdao.getBoard(num);


%>


<!-- 게시판 -->
<article>
<h1>게시글 수정하기</h1>

<!-- form 태그 시작 -->
<form action="updatePro.jsp?pageNum=<%=pageNum %>" method="post">

<table id="notice">	
	<input type="hidden" name="num" value="<%=bb.getNum() %>">
	<tr>
		<th class="tno" colspan="5">게시물 수정</th>
    </tr>
 <tr>
 	<td class="left">글쓴이</td>
    <td>
	  <input type="text" name="name" value="<%=bb.getName() %>">
	</td>
 </tr>    
 <tr>
 	<td class="left">비밀번호</td>
    <td>
	  <input type="password" name="pass" placeholder="비밀번호를 입력하세요">
	</td>
 </tr>    
 <tr>
 	<td class="left">제목</td>
    <td>
	  <input type="text" name="subject" value="<%=bb.getSubject() %>">
	</td>
 </tr>    
 <tr>
 	<td class="left">내용</td>
    <td>
	  <textarea rows="10" cols="50" name="content"><%=bb.getContent() %></textarea>
	</td>
 </tr>    
</table>

	<div id="table_search">
		<input type="submit" value="수정하기" class="btn"
			onclick="location.href=''">	
	</div>
	
	</form>
<!-- form 태그 끝 -->	
	<div class="clear"></div>
	<div id="page_control">
	</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
 <jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>