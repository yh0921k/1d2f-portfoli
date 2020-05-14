<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Portfoli</title>
    <meta name="description" content="...">

        <meta name="viewport" content="width=device-width, maximum-scale=5, initial-scale=1, user-scalable=0">
        <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->

        <!-- up to 10% speed up for external res -->
        <link rel="dns-prefetch" href="https://fonts.googleapis.com/">
        <link rel="dns-prefetch" href="https://fonts.gstatic.com/">
        <link rel="preconnect" href="https://fonts.googleapis.com/">
        <link rel="preconnect" href="https://fonts.gstatic.com/">
        <!-- preloading icon font is helping to speed up a little bit -->
        <link rel="preload" href="${pageContext.request.getContextPath()}/resources/assets/fonts/flaticon/Flaticon.woff2" as="font" type="font/woff2" crossorigin>

        <!-- non block rendering : page speed : js = polyfill for old browsers missing `preload` -->
        <link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/assets/css/core.min.css">
        <link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/assets/css/vendor_bundle.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&amp;display=swap">

    <!-- favicon -->
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="apple-touch-icon" href="demo.files/logo/icon_512x512.png">

    <link rel="manifest" href="${pageContext.request.getContextPath()}/resources/assets/images/manifest/manifest.json">
    <meta name="theme-color" content="#377dff">

  </head>

<!--

    Layout Admin
      .layout-admin   (required)

      .aside-sticky           - sidebar : fixed and push header
      .header-sticky          - header : always visible on top (acting as old .header-focus)


    ****************************************************************************************************

      NOTES

        1.  LOGO TO REPLACE
            - logo_light.svg  : sidebar
            - logo_dark.svg   : header navbar

    ****************************************************************************************************
  -->
  <body class="layout-admin aside-sticky header-sticky">

    <div id="wrapper" class="d-flex align-items-stretch flex-column">
      <!-- 
        HEADER 
        
        .header-match-aside-primary
      -->
      <header id="header" class="bg-dark">
		<jsp:include page="header.jsp"/>
      </header>
      
      <div id="wrapper_content" class="d-flex flex-fill">    
      	<jsp:include page="sidebar.jsp"/>
      	<div id="wrapper-contents-page" style="width:100%">
       		<jsp:include page="contentsHome.jsp"/>
       	</div>   
      </div>
    </div><!-- /#wrapper -->

	<footer id="footer" class="bg-gradient-dark text-white">
		<jsp:include page="footer.jsp"/>
	</footer>
	
    <script src="${pageContext.request.getContextPath()}/resources/assets/js/core.min.js"></script>

    <div id="page_js_files">specific page javascript files here</div>
    <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
    <script>
    	var expireTime = ${expire};
	    $(document).ready(function() { 
	      setInterval(function() {
	        $("#sessionExpire").html("세션 만료 : " + --expireTime + "초 남음");
	        
	        if(expireTime == 0) {
	        	window.location.href="loginForm";
	        }
	        
	      }, 1000);
	    });
	    $(document).ready(function() {
        	$("#aside-main a").click(function() {		
        	    expireTime = ${expire};
        		var xhr = new XMLHttpRequest();
        	    xhr.onreadystatechange = () => {
        	        if (xhr.readyState == 4) {
        	            if (xhr.status == 200) {
        	            	document.querySelector("#wrapper-contents-page").innerHTML = xhr.responseText;
        	            }
        	        }
        	    };
        	    xhr.open("GET", this.id, true);
        	    xhr.send();
        	});
        });
    </script>
    <script>
    $(document).ready(function() { 
      $("#keyword").keyup(function() { 
          var k = $(this).val(); 
          console.log(k);
          $("#logTable > tbody > tr").hide(); // tr 태그 전부 숨김

          var temp = $("#logTable > tbody > tr > td:nth-child(n):contains('" + k + "')"); 
          $(temp).css("color","red");
          console.log(typeof(temp));
          console.log(temp);
          if(k=="") {
            $(temp).css("color","black");
          }
          $(temp).parent().show();
      });
    });
    </script>
  </body>
</html>