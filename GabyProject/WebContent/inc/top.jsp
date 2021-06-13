<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header>
<%
	if (session.getAttribute("id") == null){
%>
<div id="login"><a href="../member/login.jsp">login</a>
<% 
	} else {
%>
<div id="login"><a href="../member/logout.jsp">logout</a>
<%
	}
%>
<a href="../member/join.jsp">join</a>
<a href="../mail/mailForm.jsp">mail</a>
</div>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><a href="../member/main.jsp">
<img src="../images/logo_paw.png" width="200" height="62" alt="Fun Web">
</a></div>
<!-- onclick="location.href='../member/main.jsp'"  -->
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../index.jsp">HOME</a></li>
	<li><a href="../mypage/mypage.jsp">MY PAGE</a></li>
	<li><a href="../center/boardList.jsp">COMMUNITY</a></li>
	<li><a href="../center/gallary.jsp">GALLARY</a></li>
</ul>
</nav>
</header>