<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	// 프로필사진 업로드 서버의 지정위치에 프로필사진 저장되도록 처리
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	

	
	String root = pageContext.getServletContext().getRealPath("/"); /* 여기서 / 는 왜해주는거지 */
	
	/* String path = root + "pds" + File.separator + "saveData"; */
	String path = root + "img";
	
	File dir = new File(path);
	if(!dir.exists())
		dir.mkdirs();
	
	String encType  = "UTF-8";
	int maxFileSize = 5*1024*1024; 
	
	
	try
	{
		MultipartRequest req = null;
		req = new MultipartRequest(request, path, maxFileSize, encType, new DefaultFileRenamePolicy());
		
		
		String fileName = req.getFilesystemName("file"); // 저장되는 파일 이름
		File file = req.getFile("file");
		
/* 		String author = req.getParameter("author");
		request.setAttribute("author",author); */
		String uniqueId = req.getParameter("uniqueId");
		request.setAttribute("uniqueId", uniqueId);
		request.setAttribute("fileName", fileName);
		request.getRequestDispatcher("profileinput.action").forward(request, response);
		
		
	}catch(Exception e)
	{
		System.out.println(e.toString());
		
	}
	
%>
