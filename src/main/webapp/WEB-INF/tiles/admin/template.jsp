<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Portfoli Admin</title>
<link rel="dns-prefetch" href="https://fonts.googleapis.com/">
<link rel="dns-prefetch" href="https://fonts.gstatic.com/">
<link rel="preconnect" href="https://fonts.googleapis.com/">
<link rel="preconnect" href="https://fonts.gstatic.com/">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&amp;display=swap">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link rel="shortcut icon" href="${pageContext.request.getContextPath()}/favicon.ico">
<link rel="manifest" href="${pageContext.request.getContextPath()}/resources/assets/images/manifest/manifest.json">

<link rel="preload" href="${pageContext.request.getContextPath()}/resources/assets/fonts/flaticon/Flaticon.woff2" as="font" type="font/woff2" crossorigin>
<link rel="stylesheet" href="<tiles:getAsString name='css.core.min'/>">
<link rel="stylesheet" href="<tiles:getAsString name='css.vendor_bundle.min'/>">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>
<body class="layout-admin aside-sticky header-sticky">
<script src="<tiles:getAsString name='js.core.min'/>"></script>

<div id="wrapper" class="d-flex align-items-stretch flex-column">
<tiles:insertAttribute name="header"/>
<div id="wrapper_content" class="d-flex flex-fill">
<tiles:insertAttribute name="menu"/>
<tiles:insertAttribute name="body"/>
</div>
<tiles:insertAttribute name="footer"/>
</div>

<script>
var expireTime = ${expire};
  $(document).ready(function() {
     setInterval(function() {
        $("#sessionExpire").html("세션 만료 : " + --expireTime + "초 남음");

          if(expireTime == 0) {
            window.location.href="../";
          }
    }, 1000);
  });
</script>
</body>
</html>