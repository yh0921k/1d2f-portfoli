<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<title>Portfoli</title>
<meta name="description" content="...">

<meta name="viewport"
  content="width=device-width, maximum-scale=5, initial-scale=1, user-scalable=0">
<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>

<!-- up to 10% speed up for external res -->
<link rel="dns-prefetch" href="https://fonts.googleapis.com/">
<link rel="dns-prefetch" href="https://fonts.gstatic.com/">
<link rel="preconnect" href="https://fonts.googleapis.com/">
<link rel="preconnect" href="https://fonts.gstatic.com/">
<!-- preloading icon font is helping to speed up a little bit -->
<link rel="preload"
  href="../../resources/assets/fonts/flaticon/Flaticon.woff2" as="font"
  type="font/woff2" crossorigin>

<link rel="stylesheet" href="../../resources/assets/css/core.min.css">
<link rel="stylesheet"
  href="../../resources/assets/css/vendor_bundle.min.css">
<link rel="stylesheet"
  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&amp;display=swap">

<!-- favicon -->
<link rel="shortcut icon" href="../../favicon.ico">
<link rel="apple-touch-icon" href="demo.files/logo/icon_512x512.png">

<link rel="manifest"
  href="../../resources/assets/images/manifest/manifest.json">
<meta name="theme-color" content="#377dff">

</head>
<body>



	<h1>게시글 세부정보</h1>
	
	<c:if test="${not empty requestScope.board}">
	번호: <input type="text" value="${board.number}"></input><br> 
  제목: <input type="text" value="${board.title}"></input><br>
  내용: <input type="text" value="${board.content}"></input><br>
	등록일: <input type="text" value="${board.registeredDate}"></input><br> 
  조회수: <input type="text" value="${board.viewCount}"></input><br>
  첨부파일:<input type="text" value="${board.attachment}"></input><br>
	</c:if>
	<c:if test="${empty requestScope.board}">
	<p>해당 게시물이 없습니다.</p>
	</c:if>
	
	<div>
		<a href='delete?no=${board.number}'>삭제</a> ..
    <a href='updateForm?no=${board.number}'>변경</a> ..
    <a href='list'>게시글 목록으로 돌아가기</a>
	</div>



  <script src="../../resources/assets/js/core.min.js"></script>

</body>
</html>