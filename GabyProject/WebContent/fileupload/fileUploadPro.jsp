<%@page import="com.member.fileDAO"%>
<%@page import="java.io.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WebContent/fileupload/fileUploadPro.jsp</title>
</head>
<body>

<h1>WebContent/fileupload/fileUploadPro.jsp</h1>

	
<%

	String uploadPath = request.getRealPath("/upload");

	System.out.println("업로드 경로 : "+uploadPath);
	
	// 업로드 파일크기 지정
	int fileSize = 10 * 1024 * 1024; // 10MB
	
	// 파일 업로드 -> 파일업로드 객체 생성
	MultipartRequest multi 
		= new MultipartRequest(
			request,  // 페이지 요청 정보 
			uploadPath, // 업로드 폴더
			fileSize, // 업로드 파일의 크기
			"UTF-8", // 인코딩
			new DefaultFileRenamePolicy()
			// 중복된 파일 이름을 처리하는 객체
			);
	
	// 해당 객체가 생성된 후 파일이 해당 경로에 업로드 되어있음.
	// 객체가 생성됨 = 파일 업로드 완료
	
	System.out.println("파일 업로드 완료!");

	// 이전 페이지에서 전달해준 정보를 출력
	// (사용자, 메세지, 파일)
	
	String name = multi.getParameter("name");
	String msg = multi.getParameter("msg");
//	String filename = multi.getParameter("filename");
	// 업로드 시 파일의 정보는 파라미터X
	String filename = multi.getFilesystemName("filename");
	String oFileName = multi.getOriginalFileName("filename");
	
	fileDAO fdao = new fileDAO();
	fdao.upload(filename,oFileName); 
	
	out.write("파일명 : "+filename+"<br>");
	out.write("실제 파일명 : "+oFileName+"<br>");
	
	String fullpath = uploadPath+"\\"+filename;
%> 


<h3>사용자 : <%=name %></h3>
<h3>메세지 : <%=msg %></h3>
<h3>파일 : <%=filename %></h3>
<h3>원본 파일명 : <%=oFileName %></h3>


파일명 <img src="../upload/<%=filename %>" width=300 height=300 />

파일명 <img src="../upload/<%=oFileName %>" width=300 height=300 />

파일명 <a href="../upload/<%=filename %>"><%=filename %></a>


	
	<form action="fileCheck.jsp" method="post">
	
	<!-- 업로드한 파일 정보 확인 -->
	  <input type="hidden" name="name" value="<%=name %>">
	  <input type="hidden" name="msg" value="<%=msg %>">
	  <input type="hidden" name="filename" value="<%=filename %>">
	  <input type="hidden" name="oFileName" value="<%=oFileName %>">

	 
	  <input type="submit" value="확인 페이지 이동">
	</form>



</body>
</html>