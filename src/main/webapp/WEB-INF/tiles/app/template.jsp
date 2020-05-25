<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Portfoli</title>
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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body class="header-sticky">
<script src="${pageContext.request.getContextPath()}/resources/assets/js/core.min.js"></script>
	<div id="wrapper">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="body" />
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>