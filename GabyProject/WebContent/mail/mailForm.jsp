<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Doggy :: Mail</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">


<style>
	table{
		width : 450px;
		margin : auto;
	}
	h1{
		text-align: center;
	}
	td{
		border : 1px dotted gray;
	}
</style>
</head>


<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../member/join.jsp">회원 가입</a></li>
<li><a href="../member/deleteForm.jsp">회원 탈퇴</a></li>
<li><a href="">문의 사항</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->


<body>
<article>
<h1><font color="pink">Mail</font></h1>
<form action="mailSend.jsp" method="post">
<fieldset>
<legend>문의 사항</legend>
<table>
	<tr><td>메일 발신인 : </td><td><input type="text" name="sender"></td></tr>
	<tr><td>메일 수신인: </td><td><input type="text" name="receiver"></td></tr>
	<tr><td>메일 제목 : </td><td><input type="text" name="subject"></td></tr>
	<tr>
		<td>메일 내용 : </td>
		<td><textarea name="content" cols=40 rows=20></textarea></td>
	</tr>
	<tr><td align=center colspan=2><input type="submit" value="보내기"></td></tr>
</table>
</fieldset>


</form>
</article>


<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>


</body>
</html>
