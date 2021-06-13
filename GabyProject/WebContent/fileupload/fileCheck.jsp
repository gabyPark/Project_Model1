<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WebContent/fileupload/fileCheck.jsp</title>
</head>
<body>

<h1>WebContent/fileupload/fileCheck.jsp</h1>

<%
	request.setCharacterEncoding("UTF-8");

	//
	String name = request.getParameter("name");
	String msg = request.getParameter("msg");
	String filename = request.getParameter("filename");
	String oFileName = request.getParameter("oFileName");

%>


<h2> 파일 업로드 확인 & 다운로드 </h2>

<h3>이름 : <%=name %> </h3>
<h3>메세지 : <%=msg %></h3>
<h3>파일명:
	 <a href="filedown.jsp?filename=<%=filename %>"><%=filename %></a>
</h3>
<h3>파일명(upload):
	 <a href="../upload/<%=filename %>"><%=filename %></a>
</h3>
<h3>원본 파일명 : <%=oFileName %></h3>

<img src="<%=filename %>" />
<img src="../<%=filename %>" />
<img src="<%=oFileName %>" />
<img src="../<%=oFileName %>" />


</body>
</html>