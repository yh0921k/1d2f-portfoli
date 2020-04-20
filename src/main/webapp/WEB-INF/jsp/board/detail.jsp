<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

  <div id="wrapper">


    <!-- light logo -->
    <a aria-label="go back" href="../../index.html"
      class="position-absolute top-0 start-0 my-2 mx-4 z-index-3 h--70 d-inline-flex align-items-center">
      <img src="../../resources/assets/images/logo/logo.png" width="110"
      height="32" alt="...">
    </a>


    <div class="d-lg-flex text-white min-h-100vh"
      style="background: linear-gradient(180deg, #42404e 0, #1b1e29);">

      <div class="col-12 col-lg-5 d-lg-flex">
        <div class="w-100 align-self-center">


          <div class="py-7">
            <h1
              class="d-inline-block text-align-end text-center-md text-center-xs display-4 h2-xs w-100 max-w-300 w-100-md w-100-xs">
              Board <span class="display-3 h1-xs d-block font-weight-medium">
                                세부정보 </span>
            </h1>
          </div>
        </div>
      </div>



      <div class="col-12 col-lg-7 d-lg-flex">
        <div class="w-100 align-self-center text-center-md text-center-xl py-2">



    <form action="updateForm" method="post">
<c:if test="${not empty requestScope.board}">
<table>
  <tr>
	<td style="color:white">번호:</td>
	<td> <input type="text" readonly name="number" value="${board.number}"></input></td>
	</tr>
  <tr>
  <td style="color:white">제목:</td>
  <td> <input type="text" name="title" value="${board.title}"></input></td>
  </tr>
  <tr>
  <td style="color:white"> 내용:</td>
  <td> <input type="text" name="content" value="${board.content}"></input></td>
  </tr>
  <tr>
	<td style="color:white">등록일:</td>
	<td> <input type="text" readonly name="registeredDate" value="${board.registeredDate}"></input></td>
  </tr>
  <tr>
  <td style="color:white"> 조회수:</td>
  <td><input type="text" name="viewCount" value="${board.viewCount}"></input></td>
  </tr>
  <tr>
  <td style="color:white"> 첨부파일:</td>
  <td><input type="text" name="attachment" value="${board.attachment}"></input></td>
  </tr>
</c:if>
<c:if test="${empty requestScope.board}">
<table>
  <tr><td>해당 게시물이 없습니다.</td></tr>
</c:if>
	
	<tr>
	<td>
		<a href='delete?number=${board.number}'>삭제</a> ..
    <button>변경</button>
    </form> ..
    <a href='list'>게시글 목록으로 돌아가기</a>
  </td>
  </tr>
</table>



    </div>
  </div>
  <!-- /#wrapper -->
  <script src="../../resources/assets/js/core.min.js"></script>
</body>
</html>