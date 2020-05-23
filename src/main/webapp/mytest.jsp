<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="dns-prefetch" href="https://fonts.googleapis.com/">
<link rel="dns-prefetch" href="https://fonts.gstatic.com/">
<link rel="preconnect" href="https://fonts.googleapis.com/">
<link rel="preconnect" href="https://fonts.gstatic.com/">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&amp;display=swap">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link rel="shortcut icon" href="${pageContext.request.getContextPath()}/favicon.ico">
<link rel="manifest" href="${pageContext.request.getContextPath()}/resources/assets/images/manifest/manifest.json">

<link rel="preload" href="${pageContext.request.getContextPath()}/resources/assets/fonts/flaticon/Flaticon.woff2" as="font" type="font/woff2" crossorigin>
<link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/assets/css/core.min.css">
<link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/assets/css/vendor_bundle.min.css">
<script src="${pageContext.request.getContextPath()}/node_modules/jquery/dist/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


</head>
<body>

테스트 ㅇㅇ

<script src="${pageContext.request.getContextPath()}/resources/assets/js/core.min.js"></script>
<!-- toast message is optional -->
<a   href="#" 
  class="btn-toggle btn btn-sm btn-outline-secondary"
  data-toggle-ajax-url-on="app/portfolio/detail?number=39"
  data-toggle-ajax-url-off="app/portfolio/detail?number=40"
  data-toast-success-message="Yay! Clicked me!"
  data-toast-success-position="bottom-center">
  <span class="group-icon">
    <i class="fi fi-star-empty text-muted"></i>
    <i class="fi fi-star-full text-warning"></i>
  </span>
  <span>Click</span>
</a>

<script>
</script>
</body>
</html>