<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Doggy :: Notice</title>
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

<!-- 게시판 -->
<article>
<h1><font color="purple">Be my mate !</font></h1>

<!-- form 태그 시작 -->
<form action="writePro.jsp" method="post">

<table id="notice">
	<tr>
		<th class="tno" colspan="5">게시판</th>
    </tr>

 <tr>
 	<td class="left">글쓴이</td>
    <td>
	  <input type="text" name="name">
	</td>
 </tr>    
 <tr>
 	<td class="left">비밀번호</td>
    <td>
	  <input type="password" name="pass">
	</td>
 </tr>    
 <tr>
 	<td class="left">제목</td>
    <td>
	  <input type="text" name="subject">
	</td>
 </tr>    
 <tr>
 	<td class="left">내용</td>
    <td>
	  <textarea rows="10" cols="50" name="content" placeholder="공지사항 게시판"></textarea>
	</td>
 </tr>    
</table>

	<div id="table_search">
		<input type="submit" value="글쓰기" class="btn">	
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