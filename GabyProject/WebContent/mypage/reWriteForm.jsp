<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reWriteForm</title>
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
<div id="sub_img"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
 <jsp:include page="../inc/mypageLeft.jsp"></jsp:include>
<!-- 왼쪽메뉴 -->

<%
	// 전달된 정보 저장하기
	// pageNum
	String pageNum = request.getParameter("pageNum");
	// num, re_ref, re_lev, re_seq
	int num = Integer.parseInt(request.getParameter("num"));
	int re_ref = Integer.parseInt(request.getParameter("re_ref"));
	int re_lev = Integer.parseInt(request.getParameter("re_lev"));
	int re_seq = Integer.parseInt(request.getParameter("re_seq"));

%>

<!-- 게시판 -->
<article>
<h1>게시판 답글 쓰기</h1>

<!-- form 태그 시작 -->
<form action="reWritePro.jsp?pageNum=<%=pageNum %>" method="post">
  <input type="hidden" name="num" value="<%=num%>">
  <input type="hidden" name="re_ref" value="<%=re_ref%>">
  <input type="hidden" name="re_lev" value="<%=re_lev%>">
  <input type="hidden" name="re_seq" value="<%=re_seq%>">

<table id="notice" bgcolor="skyblue">
	<tr>
		<th class="tno" colspan="5">답글 작성</th>
    </tr>
 <tr>
 	<td><b>글쓴이</b></td>
    <td>
	  <input type="text" name="name">
	</td>
 </tr>    
 <tr>
 	<td><b>비밀번호</b></td>
    <td>
	  <input type="password" name="pass">
	</td>
 </tr>    
 <tr>
 	<td><b>제목</b></td>
    <td>
	  <input type="text" name="subject" value="[답글] ">
	</td>
 </tr>    
 <tr>
 	<td><b>내용</b></td>
    <td>
	  <textarea rows="10" cols="50" name="content"></textarea>
	</td>
 </tr>    
</table>

	<div id="table_search">
		<input type="submit" value="답글쓰기" class="btn">	
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