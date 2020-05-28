<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
	errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<title>Portfoli</title>
<meta name="description" content="...">

<meta name="viewport"
	content="width=device-width, maximum-scale=5, initial-scale=1, user-scalable=0">
<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>

<link rel="dns-prefetch" href="https://fonts.googleapis.com/">
<link rel="dns-prefetch" href="https://fonts.gstatic.com/">
<link rel="preconnect" href="https://fonts.googleapis.com/">
<link rel="preconnect" href="https://fonts.gstatic.com/">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="preload"
	href="${pageContext.request.getContextPath()}/resources/assets/fonts/flaticon/Flaticon.woff2"
	as="font" type="font/woff2" crossorigin>

<link rel="stylesheet"
	href="${pageContext.request.getContextPath()}/resources/assets/css/core.min.css">
<link rel="stylesheet"
	href="${pageContext.request.getContextPath()}/resources/assets/css/vendor_bundle.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&amp;display=swap">

<!-- favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.getContextPath()}/favicon.ico">
<link rel="apple-touch-icon"
	href="${pageContext.request.getContextPath()}/resources/demo.files/logo/icon_512x512.png">
<link rel="manifest"
	href="${pageContext.request.getContextPath()}/resources/assets/images/manifest/manifest.json">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<meta name="theme-color" content="#377dff">

</head>

<body class="header-over header-sticky">
	<div id="wrapper">


		<!-- HEADER -->
		<header id="header" class="shadow-xs z-index-1000">

			<div class="container position-relative">
        <nav
          class="navbar navbar-expand-lg navbar-light justify-content-lg-between justify-content-md-inherit">

          <div class="align-items-start">

            <!-- 
                Logo : height: 70px max
              -->
            <a class="navbar-brand" href="/portfoli">
            <img src="${pageContext.request.getContextPath()}/resources/assets/images/logo/logo.png"
              width="150" height="20" alt="...">
            <img src="${pageContext.request.getContextPath()}/resources/assets/images/logo/logo2.png"
              width="150" height="20" alt="...">
            </a>

          </div>


          <!-- Menu -->

          <div class="collapse navbar-collapse justify-content-end" id="navbarMainNav">

            <!-- NAVIGATION -->
            <ul class="navbar-nav fs--14">
              <!-- Menu -->

              <!-- documentation -->
              <c:if test="${loginUser.type=='1' or loginUser.type==null}">
                <li class="nav-item"><a href="/portfoli/app/portfolio/list" id="portfolio"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 30px;" <span>포트폴리오</span></a></li>
                <li class="nav-item"><a
                  href="/portfoli/app/jobposting/list" id="info"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 0px;" <span>채용정보</span></a></li>
                <li class="nav-item"><a href="#" id="recommendInfo"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 0px;" <span>추천채용정보</span></a></li>
                <li class="nav-item"><a href="#" id="ranking"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 30px;" <span>랭킹</span></a></li>
              </c:if>

              <c:if test="${loginUser.type=='2'}">
                <li class="nav-item"><a href="/portfoli/app/portfolio/list" id="portfolio"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 30px;" <span>포트폴리오</span></a></li>
                <li class="nav-item"><a href="/portfoli/app/jobposting/list" id="info"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 0px;" <span>채용정보</span></a></li>
                <li class="nav-item"><a href="#" id="recommendInfoForCom"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 0px;" <span>인재추천정보</span></a></li>
                <li class="nav-item"><a href="#" id="ranking"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 30px;" <span>랭킹</span></a></li>
              </c:if>
              <!-- /NAVIGATION -->

          <!-- 로그인 전 -->
          <c:if test="${empty loginUser}">
            <li class="nav-item"><a
              class="nav-link text-secondary"
              href="/portfoli/app/member/generalJoin"
              style="text-decoration: none; font-weight: bold;">회원가입</a></li>

            <li
              class="list-inline-item ml--6 mr--6 float-start d-none d-lg-inline-block">
              <a target="_blank" href="/portfoli/app/auth/loginForm"
              class="nav-link text-secondary" style="font-weight: bold;">로그인</a>
            </li>
          </c:if>

          <!-- 일반 회원 로그인 후 -->
          <c:if test="${loginUser.type == '1'}">

            <li class="list-inline-item ml--6 mr--6 dropdown"><a href="#"
              id="dropdownMessageOptions"
              class="btn btn-sm rounded-circle btn-light dropdown-toggle mt-3"
              data-toggle="dropdown" aria-expanded="false" aria-haspopup="true">

                <!-- badge --> <span
                class="badge badge-danger shadow-danger-md animate-pulse fs--10 p--3 mt--n3 position-absolute end-0"
                id="count"></span> <span class="group-icon"> <i
                  class="fi fi-envelope-2"></i> <i class="fi fi-close"></i>
              </span>
            </a>

              <div aria-labelledby="dropdownMessageOptions"
                class="dropdown-menu dropdown-menu-clean dropdown-menu-navbar-autopos dropdown-menu-invert dropdown-click-ignore p-0 mt--18 fs--15 w--300">

                <div class="dropdown-divider"></div>
                <div class="max-h-75vh">
                  <c:forEach items="${inbox}" var="recentMessage">
                    <a
                      href="/portfoli/app/message/inboxModal?number=${recentMessage.number}"
                      class="js-ajax-modal clearfix dropdown-item font-weight-medium px-3 border-bottom border-light overflow-hidden shadow-md-hover bg-theme-color-light"
                      data-href="/portfoli/app/message/inboxModal?number=${recentMessage.number}"
                      data-ajax-modal-size="modal-md"
                      data-ajax-modal-centered="true"
                      data-ajax-modal-backdrop="static"> <span
                      class="badge badge-soft badge-warning float-end font-weight-normal mt-1"
                      <c:if test="${not empty recentMessage.receiveDate}"> style="visibility:hidden;"</c:if>>new</span>

                      <!-- image --> <c:if
                        test="${empty recentMessage.member.photoFilePath}">
                        <div
                          class="w--50 h--50 mb-2 mt-1 rounded-circle bg-cover bg-light float-start"
                          style="background-image:url('${pageContext.request.getContextPath()}/resources/assets/images/icons/user80.png')"></div>
                      </c:if> <c:if test="${not empty recentMessage.member.photoFilePath}">
                        <div
                          class="w--50 h--50 mb-2 mt-1 rounded-circle bg-cover bg-light float-start"
                          style="background-image:url('${pageContext.request.getContextPath()}/upload/member/${recentMessage.member.photoFilePath}')"></div>
                      </c:if> <!-- sender --> <strong class="d-block text-truncate">${recentMessage.member.id}</strong>
                      <!-- title -->
                      <p class="fs--14 m-0 text-truncate font-weight-normal">
                        ${recentMessage.title}</p> <!-- date --> <small
                      class="d-block fs--11 text-muted"> <fmt:formatDate
                          var="sendDate" value="${recentMessage.sendDate}"
                          pattern="yyyy.MM.dd HH:mm:ss" /> ${sendDate}
                    </small>
                    </a>
                  </c:forEach>

                  <div class="dropdown-divider mb-0"></div>
                  <a href="/portfoli/app/message/inbox"
                    class="prefix-icon-ignore dropdown-footer dropdown-custom-ignore font-weight-medium pt-3 pb-3">
                    <i class="fi fi-arrow-end fs--11"></i> <span
                    class="d-inline-block pl-2 pr-2">받은 쪽지함으로 이동</span>
                  </a>
                </div>
                </div>
                </li>

                <li class="list-inline-item dropdown-menu-hover mt-3"><a
                  href="#" id="dropdownAccountOptions"
                  class="btn btn-sm btn-light dropdown-toggle btn-pill pl--12 pr--12"
                  data-toggle="dropdown" aria-expanded="false"
                  aria-haspopup="true"> <span class="group-icon m-0">
                      <i class="fi w--15 fi-user-male"></i> <i
                      class="fi w--15 fi-close"></i>
                  </span> <span
                    class="fs--14 d-none d-sm-inline-block font-weight-medium">[일반]&nbsp;&nbsp;${loginUser.name}
                  </span>
                </a>

                  <div aria-labelledby="dropdownAccountOptions"
                    class="prefix-link-icon prefix-icon-dot dropdown-menu dropdown-menu-clean dropdown-menu-navbar-autopos dropdown-menu-invert dropdown-click-ignore p-0 mt--18 fs--15 w--300">

                    <div class="dropdown-header fs--14 py-4">

                      <!-- profile image -->
                      <div
                        class="w--60 h--60 rounded-circle bg-light bg-cover float-start"
                        <c:if test="${empty loginUser.photoFilePath}">
                        style="background-image: url('${pageContext.request.getContextPath()}/resources/assets/images/icons/user80.png')"></div>
                        </c:if>
                        <c:if test="${not empty loginUser.photoFilePath}">
                        style="background-image: url('${pageContext.request.getContextPath()}/upload/member/${loginUser.photoFilePath}')"></div>
                        </c:if>
                        <!-- initials - no image -->
                        <!--
                    <div data-initials=${loginUser.name} data-assign-color="true" class="sow-util-initials bg-light rounded h5 w--60 h--60 d-inline-flex justify-content-center align-items-center rounded-circle float-start">
                      <i class="fi fi-circle-spin fi-spin"></i>
                    </div>
                    -->

                        <!-- user detail -->
                        <span
                          class="d-block font-weight-medium text-truncate fs--16"><a
                          href="/portfoli/app/member/generalMypage"
                          class="text-muted">${loginUser.name}</a> </span> <span
                          class="d-block text-muted font-weight-medium text-truncate">${loginUser.email}</span>

                      </div>

                      <div class="dropdown-divider" style="z-index: 200;"></div>

                      <a href="/portfoli/app/calendar/calendar" target="_blank"
                        class="dropdown-item text-truncate font-weight-medium">
                        <span
                        class="badge badge-success float-end font-weight-normal mt-1">3
                          new</span> 일정 <small class="d-block text-muted">internal
                          messaging system</small>
                      </a> <a href="#!" target="_blank"
                        class="dropdown-item text-truncate font-weight-medium">
                        포트폴리오 <small class="d-block text-muted">montly
                          billing</small>
                      </a> <a href="/portfoli/app/member/generalMypage"
                        class="dropdown-item text-truncate font-weight-medium">
                        마이페이지 <small class="d-block text-muted">profile,
                          password and more...</small>
                      </a>

                      <div class="dropdown-divider mb-0"></div>

                      <a href="/portfoli/app/auth/logout"
                        class="prefix-icon-ignore dropdown-footer dropdown-custom-ignore font-weight-medium pt-3 pb-3">
                        <i class="fi fi-power float-start"></i> Log Out
                      </a>
                    </div>
                    </div>
                    </li>
          </c:if>

          <!-- 기업 회원 로그인 후 -->

          <c:if test="${loginUser.type == '2'}">
            <li class="list-inline-item ml--6 mr--6 dropdown mt-3"><a href="#"
              id="dropdownMessageOptions"
              class="btn btn-sm rounded-circle btn-light dropdown-toggle"
              data-toggle="dropdown" aria-expanded="false" aria-haspopup="true">

                <!-- badge --> <span
                class="badge badge-danger shadow-danger-md animate-pulse fs--10 p--3 mt--n3 position-absolute end-0"
                id="count"></span> <span class="group-icon"> <i
                  class="fi fi-envelope-2"></i> <i class="fi fi-close"></i>
              </span>
            </a>

              <div aria-labelledby="dropdownMessageOptions"
                class="dropdown-menu dropdown-menu-clean dropdown-menu-navbar-autopos dropdown-menu-invert dropdown-click-ignore p-0 mt--18 fs--15 w--300">

                <div class="dropdown-divider"></div>
                <div class="max-h-75vh">
                  <c:forEach items="${inbox}" var="recentMessage">
                    <a
                      href="/portfoli/app/message/inbox/modal?number=${recentMessage.number}"
                      class="js-ajax-modal clearfix dropdown-item font-weight-medium px-3 border-bottom border-light overflow-hidden shadow-md-hover bg-theme-color-light"
                      data-href="/portfoli/app/message/inbox/modal?number=${recentMessage.number}"
                      data-ajax-modal-size="modal-md"
                      data-ajax-modal-centered="true"
                      data-ajax-modal-backdrop="static"> <span
                      class="badge badge-soft badge-warning float-end font-weight-normal mt-1"
                      <c:if test="${not empty recentMessage.receiveDate}"> style="visibility:hidden;"</c:if>>new</span>

                      <!-- image --> <c:if
                        test="${empty recentMessage.member.photoFilePath}">
                        <div
                          class="w--50 h--50 mb-2 mt-1 rounded-circle bg-cover bg-light float-start"
                          style="background-image:url('${pageContext.request.getContextPath()}/resources/assets/images/icons/user80.png')"></div>
                      </c:if> <c:if test="${not empty recentMessage.member.photoFilePath}">
                        <div
                          class="w--50 h--50 mb-2 mt-1 rounded-circle bg-cover bg-light float-start"
                          style="background-image:url('${pageContext.request.getContextPath()}/upload/member/${item.member.photoFilePath}')"></div>
                      </c:if> <!-- sender --> <strong class="d-block text-truncate">${recentMessage.member.id}</strong>
                      <!-- title -->
                      <p class="fs--14 m-0 text-truncate font-weight-normal">
                        ${recentMessage.title}</p> <!-- date --> <small
                      class="d-block fs--11 text-muted"> <fmt:formatDate
                          var="sendDate" value="${recentMessage.sendDate}"
                          pattern="yyyy.MM.dd HH:mm:ss" /> ${sendDate}
                    </small>
                    </a>
                  </c:forEach>

                  <div class="dropdown-divider mb-0"></div>
                  <a href="/portfoli/app/message/inbox"
                    class="prefix-icon-ignore dropdown-footer dropdown-custom-ignore font-weight-medium pt-3 pb-3">
                    <i class="fi fi-arrow-end fs--11"></i> <span
                    class="d-inline-block pl-2 pr-2">받은 쪽지함으로 이동</span>
                  </a>
                </div>

                <li class="list-inline-item ml--6 mr--6 dropdown-menu-hover mt-3"><a
                  href="#" id="dropdownAccountOptions"
                  class="btn btn-sm btn-light dropdown-toggle btn-pill pl--12 pr--12"
                  data-toggle="dropdown" aria-expanded="false"
                  aria-haspopup="true"> <span class="group-icon m-0">
                      <i class="fi w--15 fi-user-male"></i> <i
                      class="fi w--15 fi-close"></i>
                  </span> <span
                    class="fs--14 d-none d-sm-inline-block font-weight-medium">[기업]&nbsp;&nbsp;${loginUser.name}</span>
                </a>


                  <div aria-labelledby="dropdownAccountOptions"
                    class="prefix-link-icon prefix-icon-dot dropdown-menu dropdown-menu-clean dropdown-menu-navbar-autopos dropdown-menu-invert dropdown-click-ignore p-0 mt--18 fs--15 w--300">

                    <div class="dropdown-header fs--14 py-4">

                      <!-- profile image -->
                      <div
                        class="w--60 h--60 rounded-circle bg-light bg-cover float-start"
                        style="background-image: url('${pageContext.request.getContextPath()}/resources/assets/images/icons/user80.png')"></div>

                      <!-- initials - no image -->
                      <!--
                    <div data-initials="John Doe" data-assign-color="true" class="sow-util-initials bg-light rounded h5 w--60 h--60 d-inline-flex justify-content-center align-items-center rounded-circle float-start">
                      <i class="fi fi-circle-spin fi-spin"></i>
                    </div>
                    -->
                      <!-- user detail -->
                      <span class="d-block font-weight-medium text-truncate fs--16"><a
                        href="/portfoli/app/member/companyMypage" class="text-muted">${loginUser.name}</a></span>
                      <span
                        class="d-block text-muted font-weight-medium text-truncate">${loginUser.email}</span>
                    </div>

                    <div class="dropdown-divider"></div>
                    
                    <a href="/portfoli/app/member/companyMypage"
                        class="dropdown-item text-truncate font-weight-medium">
                        마이페이지 <small class="d-block text-muted">profile,
                          password and more...</small>
                      </a>
                    <a href="#!" target="_blank"
                    class="dropdown-item text-truncate font-weight-medium">
                    공고 <small class="d-block text-muted">montly billing</small>
                  </a> <a href="/portfoli/app/payment/introduction"
                    class="dropdown-item text-truncate font-weight-medium">
                    멤버십 <small class="d-block text-muted">계정 업그레이드</small>
                  </a>
                      
                    <div class="dropdown-divider mb-0"></div>
                    <a href="/portfoli/app/auth/logout"
                      class="prefix-icon-ignore dropdown-footer dropdown-custom-ignore font-weight-medium pt-3 pb-3">
                      <i class="fi fi-power float-start"></i> Log Out
                    </a>
                  </div></li>
          </c:if>
          </ul>
          </div>

        </nav>
      </div>
      <!-- /NAVBAR -->

    </header>
    <!-- /HEADER -->

<section class="sow-util-slideshow min-h-75vh d-middle justify-content-start overlay-dark overlay-opacity-4 z-index: 1;" 
        data-sow-slideshow-interval="4000" 
        data-sow-slideshow-fade-delay="5000" 
        data-sow-slideshow="resources/assets/images/best_sigak_portfolio.jpg,
        resources/assets/images/best_front_portfolio.jpg,
        resources/assets/images/best_video_portfolio.jpg">
        <div class="container"> 

          <div class="text-center-md text-center-xs d-middle justify-content-start">
            
            <div class="text-white py-7" data-aos="fade-in" data-aos-delay="0" data-aos-offset="0">

              <!-- main title -->
              <h1 class="h1-xs display-4 mb-0 font-weight-medium">
                2020년 6월 <span class="text-brown-200">Best Portfolio</span>
              </h1>
              
              <!-- slogan -->
              <p class="h2 h5-xs font-weight-normal mb-0 text-brown-100">
                Svelte application
              </p>
              <small>by Joanna Kosinska</small>

            </div>

          </div>

        </div>
        </section>
        
        <!-- <div> 추가!</div> -->
<!-- 
		<div class="col-xs-12" style="padding-bottom: 5px;">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="resources/assets/images/banner1.jpg"
							class="d-block w-100" alt="banner1">
					</div>
					<div class="carousel-item">
						<img src="resources/assets/images/banner2.jpg"
							class="d-block w-100" alt="banner2">
					</div>
					<div class="carousel-item">
						<img src="resources/assets/images/banner3.jpg"
							class="d-block w-100" alt="banner3">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
 -->
		<!--  <div class="row" style="margin: 5px;">
            <div class="col-md-4">
                <h3>백엔드/프론트엔드</h3>
                <hr>
                <div class="list-group">
                    <a href="#" class="list-group-item list-group-item-action">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-2">윤현정의 포트폴리오</h5>
                        <small>2 minutes ago</small>
                      </div>
                      <p class="mb-2">http://kondaeng.com/</p>
                      <button type="button" class="btn-small">java</button>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-2">차상미 포트폴리오</h5>
                        <small class="text-muted">1 hours ago</small>
                      </div>
                      <p class="mb-2">http://joohybedy.com/sangmi</p>
                      <button type="button" class="btn-small">nodejs</button>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-2">Ryanscherf</h5>
                        <small class="text-muted">1 days ago</small>
                      </div>
                      <p class="mb-2">https://ryanscherf.com/</p>
                     <button type="button" class="btn-small">Python</button>
                    </a>
                  </div>
            </div>
            <div class="col-md-4">
                <h3>시각디자인</h3>
                <hr>
                <div class="list-group">
                    <a href="#" class="list-group-item list-group-item-action">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-2">윤현정의 포트폴리오</h5>
                        <small>2 minutes ago</small>
                      </div>
                      <p class="mb-2">http://kondaeng.com/</p>
                      <button type="button" class="btn-small">그래픽디자인</button>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-2">차상미 포트폴리오</h5>
                        <small class="text-muted">1 hours ago</small>
                      </div>
                      <p class="mb-2">http://joohybedy.com/sangmi</p>
                      <button type="button" class="btn-small">포토샵</button>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-2">Ryanscherf</h5>
                        <small class="text-muted">1 days ago</small>
                      </div>
                      <p class="mb-2">https://ryanscherf.com/</p>
                      <button type="button" class="btn-small">레이아웃</button>
                    </a>
                  </div>
            </div>
            <div class="col-md-4">
                <h3>영상디자인</h3>
                <hr>
                <div class="list-group">
                    <a href="#" class="list-group-item list-group-item-action">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-2">윤현정의 포트폴리오</h5>
                        <small>2 minutes ago</small>
                      </div>
                      <p class="mb-2">http://kondaeng.com/</p>
                      <button type="button" class="btn-small">광고디자인</button>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-2">차상미 포트폴리오</h5>
                        <small class="text-muted">1 hours ago</small>
                      </div>
                      <p class="mb-2">http://joohybedy.com/sangmi</p>
                      <button type="button" class="btn-small">CG</button>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-2">Ryanscherf</h5>
                        <small class="text-muted">1 days ago</small>
                      </div>
                      <p class="mb-2">https://ryanscherf.com/</p>
                      <button type="button" class="btn-small">프리미어</button>
                    </a>
                  </div>
            </div>
        </div>
        -->
		<!-- footer -->
		<footer id="footer" class="footer-dark position-relative">
			<div class="container">

				<div class="row">

					<div class="col-12 col-md-6 col-lg-4 text-center-xs p-0 py-5 px-3">

						<!-- logo -->
						<span class="h--70 mt--n20 d-inline-flex align-items-center">
							<img
							src="${pageContext.request.getContextPath()}/resources/assets/images/logo/logo2.png"
							width="70" height="32" alt="...">
						</span>

						<p class="lead" style="font-size: medium;">
							대표자: 1d2f<br> 주소: 서울특별시 서초구 서초동 서초대로74길 33<br> 사업자
							등록번호: 123-45-678910<br> 개인정보보호 책임자: 1d2f
						</p>

						<div class="mt-4">

							<a href="#!"
								class="btn btn-sm btn-facebook transition-hover-top mb-2 rounded-circle"
								rel="noopener" aria-label="facebook page"> <i
								class="fi fi-social-facebook"></i>
							</a> <a href="#!"
								class="btn btn-sm btn-twitter transition-hover-top mb-2 rounded-circle"
								rel="noopener" aria-label="twitter page"> <i
								class="fi fi-social-twitter"></i>
							</a> <a href="#!"
								class="btn btn-sm btn-linkedin transition-hover-top mb-2 rounded-circle"
								rel="noopener" aria-label="linkedin page"> <i
								class="fi fi-social-linkedin"></i>
							</a> <a href="#!"
								class="btn btn-sm btn-youtube transition-hover-top mb-2 rounded-circle"
								rel="noopener" aria-label="youtube page"> <i
								class="fi fi-social-youtube"></i>
							</a>

						</div>

					</div>


					<div class="col-12 col-md-6 col-lg-5 py-5 text-center-xs">

						<h4 class="h5">Support</h4>

						<div class="row">
							<div class="col-12 col-lg-6">

								<ul class="mt-4 mb-0 list-unstyled p-0 block-xs">
									<li><a href="contact-1.html">Contact</a></li>
									<li><a href="about-us-1.html">About Us</a></li>
									<li><a href="page-terms-and-conditions.html">이용약관</a></li>
								</ul>

							</div>

							<div class="col-12 col-lg-6">

								<ul class="mt-4 mb-0 list-unstyled p-0 block-xs">
									<li><a href="/portfoli/app/faq/list">FAQ</a></li>
									<li><a href="/portfoli/app/qna/list">QNA</a></li>
									<li><a href="/portfoli/app/notice/list">고객센터</a></li>
								</ul>

							</div>

						</div>

					</div>




					<div class="col-12 col-md-6 col-lg-3 py-5 text-center-xs">

						<h4 class="h5">Contact</h4>

						<div class="mt-4">

							<ul class="list-unstyled m-0">

								<li class="list-item py-2"><a href="tel:+01-555-5555"
									class="clearfix py-1 h3 mb-0 d-inline-block font-weight-medium text-info">
										<i class="float-start fi fi-phone h4"></i> 1577-1677
								</a></li>

								<li class="list-item py-2"><a
									href="mailto:info@mycomany.com"
									class="clearfix py-1 h5 d-inline-block font-weight-medium text-warning">
										<i class="float-start fi fi-envelope h4 mt--n5"></i>
										portfoli@portfoli.com
								</a></li>

							</ul>

							<!--<p>
                      If you have questions, or you want more information, our team is available for you 24/24.
                    </p>-->

						</div>


					</div>


				</div>

			</div>

			<div class="bg-distinct py-3 clearfix">

				<div class="container clearfix font-weight-light text-center-xs">

					<div class="fs--14 py-2 float-start float-none-xs m-0-xs">
						&copy; Portfoli Inc.</div>

					<ul class="list-inline mb-0 mt-2 float-end float-none-xs m-0-xs">
						<li class="list-inline-item m-0"><img width="38" height="24"
							class="lazy"
							data-src="${pageContext.request.getContextPath()}/resources/assets/images/credit_card/visa.svg"
							src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
							alt="visa credit card icon"></li>

						<li class="list-inline-item m-0"><img width="38" height="24"
							class="lazy"
							data-src="${pageContext.request.getContextPath()}/resources/assets/images/credit_card/mastercard.svg"
							src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
							alt="mastercard credit card icon"></li>

						<li class="list-inline-item m-0"><img width="38" height="24"
							class="lazy"
							data-src="${pageContext.request.getContextPath()}/resources/assets/images/credit_card/discover.svg"
							src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
							alt="discover credit card icon"></li>

						<li class="list-inline-item m-0"><img width="38" height="24"
							class="lazy"
							data-src="${pageContext.request.getContextPath()}/resources/assets/images/credit_card/amazon.svg"
							src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
							alt="amazon credit card icon"></li>

						<li class="list-inline-item m-0"><img width="38" height="24"
							class="lazy"
							data-src="${pageContext.request.getContextPath()}/resources/assets/images/credit_card/paypal.svg"
							src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
							alt="paypal credit card icon"></li>

						<li class="list-inline-item m-0"><img width="38" height="24"
							class="lazy"
							data-src="${pageContext.request.getContextPath()}/resources/assets/images/credit_card/skrill.svg"
							src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
							alt="skrill credit card icon"></li>

						<!-- more vendors on assets/images/credit_card/ -->

					</ul>

				</div>
			</div>

		</footer>
		<!-- /Footer -->


	</div>
	<!-- /#wrapper -->
<script src="${pageContext.request.getContextPath()}/resources/assets/js/core.min.js"></script>
<script>
function sendMessage() {
  console.log('trying socket connection');
  var wsUri = "ws://" + window.location.host
      + "/portfoli/app/message/alert";
  if (wsUri == "ws://localhost:9999/portfoli/app/message/alert") {
    websocket = new WebSocket(wsUri);
  } else {
    wsUri = "ws://121.132.195.172:8080/portfoli/app/message/alert";
    websocket = new WebSocket(wsUri);
  }
  websocket.onopen = function(evt) {
    console.log('connection opened');
    onOpen(evt);
  };
  websocket.onmessage = function(evt) {
    console.log("received message : " + evt.data);
    onMessage(evt);
  };
  websocket.onerror = function(evt) {
    console.log('error : ' + err);
    onError(evt);
  };
  websocket.onclose = function(evt) {
    console.log("WebSocket is closed now.");
  };
}
function onOpen(evt) {
  websocket.send("${loginUser.number}");
}
function onMessage(evt) {
  $('#count').append(evt.data);
}
function onError(evt) {
}
$(document).ready(function() {
  sendMessage();
});
</script>
</body>
</html>