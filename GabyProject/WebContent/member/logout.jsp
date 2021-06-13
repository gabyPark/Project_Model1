<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello Doggy :: Logout</title>
</head>
<body>

	<% 		
		session.invalidate();
		System.out.println("logout.jsp 페이지 실행! 세션 초기화 완료");
	%>
	
	<script type="text/javascript">
		alert("로그아웃!")
		location.href="main.jsp";
	</script>


</body>
</html>