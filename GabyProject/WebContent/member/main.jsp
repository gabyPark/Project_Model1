<%@page import="com.member.Board.BoardDAO"%>
<%@page import="com.member.Board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Doggy :: Main</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
 <jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="../images/main_img.jpg"
 width="971" height="282"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
 
<div id="hosting"><a href="../center/boardList.jsp">
<h3>공지사항</h3></a>
<p>
<a href="../center/boardContent.jsp?num=<%=3 %>&pageNum=<%=1 %>">자주 묻는 질문 정리</a><br><br>
<a href="../center/boardContent.jsp?num=<%=2 %>&pageNum=<%=1 %>">[공지] 게시글 작성 방법 안내</a><br><br>
<a href="../center/boardContent.jsp?num=<%=1 %>&pageNum=<%=1 %>">[공지] 홈페이지 이용 안내</a><br><br>
</p>
</div>

<div id="security"><a href="../center_mate/boardList.jsp">
<h3>나의 메이트 찾기</h3></a>
<p>
<a href="../center_mate/boardContent.jsp?num=<%=5 %>&pageNum=<%=1 %>">[답글] 저희 꼬숨이랑 친구해요!</a><br><br>
<a href="../center_mate/boardContent.jsp?num=<%=4 %>&pageNum=<%=1 %>">상남동 사는 친구 없나요?</a><br><br>
<a href="../center_mate/boardContent.jsp?num=<%=3 %>&pageNum=<%=1 %>">활발한 웰시코기에요</a><br><br>
<a href="../center_mate/boardContent.jsp?num=<%=2 %>&pageNum=<%=1 %>">[답글] 같이 놀아요~</a><br><br>
</p>
</div>

<div id="payment"><a href="../center/lostNfound.jsp">
<h3>분실 반려동물</h3></a>
<p>현재 분실 신고된 건이 없습니다.<br>
  <br>
  <br>
  <br>
  <br>
  <br></p>
</div>

</div>

<div class="clear"></div>
<div id="sec_news">
<h3><span class="orange">Chat with Users</span></h3>
<dl>
<dt>　　　　　　　　　　Chat with users</dt>
<dd>현재 접속중인 유저와 채팅 할 수 있습니다.<br>
욕설/타인 비방 시 차단 될 수 있으니 네티켓을 지키는 사용자가 됩시다.</dd>
</dl>
<iframe src="chat.html" width="430" height="220"></iframe>
</div>
<div id="news_notice">
<h3 class="brown">　　Gallary</h3>
<table>
<tr><td class="contxt"><a href="#">현재 서비스 준비중입니다</a></td>
    <td>2021.02.09</td></tr>
</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>