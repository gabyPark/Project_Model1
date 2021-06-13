<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WebContent/fileupload/filedown.jsp</title>
</head>
<body>

<h1>WebContent/fileupload/filedown.jsp</h1>

<%
	// 다운올드 할 파일의 이름 저장(파라미터)
	String filename = request.getParameter("filename"); // 나중에 수정해서 사용할 부분
	System.out.println("다운로드 할 파일명 : "+filename);

	// 파일이 업로드 된 폴더명
	String savePath = "upload"; // 나중에 수정해서 사용할 부분

	// 다운로드 경로 계산
	// 프로젝트 정보 저장
	ServletContext context = getServletContext();
	
	// 프로젝트에 업로드 폴더의 실제 경로
	// savePath 라는 이름을 가진 실제 경로에서 내 프로젝트(파일)을 가져오겠다.
	String sDownloadPath = context.getRealPath(savePath);
	System.out.println("sDownloadPath : "+sDownloadPath);
	
	// 다운로드 할 파일의 전체 경로를 저장
	String sFilePath = sDownloadPath + "\\"+filename;
	System.out.println("sFilePath : "+sFilePath);
	
	// 파일 다운로드 - 파일 출력 
	
	// 파일을 한번에 저장하는 배열(버퍼)
	// 자바시간에 배운 입출력 어쩌구
	byte[] b = new byte[4096];
	
	// 파일 입력스트림 객체 생성
	// 인풋스트림 생성자는 파일을 주거나, 파일의 경로 둘 중 하나. 
//	FileInputStream fis = new FileInputStream(File f);
//	FileInputStream fis = new FileInputStream(String path);
	FileInputStream fis = new FileInputStream(sFilePath);
	
	
	// MIME 타입을 확인 및 설정
	String sMimeType = getServletContext().getMimeType(sFilePath);
	System.out.println("sMimeType >> "+sMimeType);
	
	//﻿ MIME 타입 : 클라이언트에 전송된 문서의 다양성을 알려주기 위한 메커니즘(기술)
	// 웹 환경에서는 파일의 확장자는 의미가 없음. 각 문서와 MIME 타입을 정확하게 전송하는 것이 서버의 역할 중 하나
	// 정보를 브라우저가 리소스를 받아서 가장 먼저 해야할 일을 알려줌.
	
	// MIME 타입이 없는 경우를 대비해, 기본값 지정
	if(sMimeType == null){
		sMimeType = "application/octet-stream";
		// application/octet-stream : 이진 타입 파일의 기본값
		// => "잘 알려지지 않은 이진 파일", 브라우저에서 자동 실행 X, 실행여부 확인하기도 함
	}

		// 내가 응답할 페이지의 MIME 타입을 지정
		response.setContentType(sMimeType);
		
		// 사용자의 브라우저를 구분(IE인지 크롬인지 판단)
		String agent = request.getHeader("User-Agent");
		System.out.println("agent : "+agent);
		
		boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1);
		
		if(ieBrowser){ // true : 인터넷 익스플로러
			filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
			// IE 일 경우 한글 파일이 깨짐
			// IE 일 경우 공백문자 : "+" -> 공백문자 "%20" 변경
			
		} else {
			
			filename = new String(filename.getBytes("UTF-8"),"iso-8859-1");
			// IE 아닌 경우 한글파일 깨짐 처리
		}
		
		
		// 다운로드 파일 출력
		response.setHeader("Content-Disposition", "attachment; filename="+filename);
		// => 브라우저에서 사용할 수 있는 파일(해석가능한 파일)도 다운로드 형태로 변경하기 위함
		// 텍스트, 이미지는 브라우저가 해석가능해서 브라우저로 바로 보여줌, 근데 압축파일은 못읽으니 다운로드 시켜버림
		
		// png 파일을 보려면 이 두줄을 주석처리 해야함.
//		out.close();
//		out = pageContext.pushBody();
		
		ServletOutputStream out2 = response.getOutputStream();
		
		int numRead;
		while((numRead = fis.read(b,0,b.length)) != -1){   // -1 파일의 끝 (EOF, ctrl+z)
			out2.write(b,0,numRead);
		}
		out2.flush();
		out2.close();
		fis.close();
		// 인풋스트림이 리소스를 많이 잡아먹기때문에 닫아주는거 잊지말기!
		
		
%>

</body>
</html>