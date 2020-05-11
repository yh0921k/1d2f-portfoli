<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<title>Portfoli</title>
<meta name="description" content="...">

<meta name="viewport"
	content="width=device-width, maximum-scale=5, initial-scale=1, user-scalable=0">
<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>
<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->

<!-- up to 10% speed up for external res -->
<link rel="dns-prefetch" href="https://fonts.googleapis.com/">
<link rel="dns-prefetch" href="https://fonts.gstatic.com/">
<link rel="preconnect" href="https://fonts.googleapis.com/">
<link rel="preconnect" href="https://fonts.gstatic.com/">
<!-- preloading icon font is helping to speed up a little bit -->
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
<meta name="theme-color" content="#377dff">

</head>

<body class="header-sticky">

	<div id="wrapper">


		<!-- HEADER -->
		<header id="header" class="shadow-xs bg-gradient-dark">

			<!-- TOP BAR -->
			<div id="top_bar" class="bg-gradient-dark fs--14">
				<!-- optional if body.header-sticky is present: add .js-ignore class to ignore autohide and stay visible all the time -->
				<div class="container">

					<div class="text-nowrap">
						<!-- change with .scrollable-horizontal to horizontally scroll, if -only- no dropdown is present -->
						<div class="d-flex justify-content-between">

							<div class="d-inline-block float-start">
								<ul class="list-inline m-0">

									<!-- LANGUAGE -->
									<li class="dropdown list-inline-item m-0"><a
										id="topDDLanguage" href="#!" class="py-2 d-inline-block"
										data-toggle="dropdown" aria-expanded="false"
										aria-haspopup="true"> <i class="flag flag-us"></i> <span
											class="fs--14 text-white pl-2 pr-2">ENGLISH</span>
									</a>

										<div aria-labelledby="topDDLanguage"
											class="dropdown-menu dropdown-menu-hover text-uppercase fs--13 px-1 pt-1 pb-0 m-0 max-h-50vh scrollable-vertical">
											<a href="#!"
												class="active dropdown-item text-muted text-truncate line-height-1 rounded p--12 mb-1">
												<i class="flag flag-us"></i> ENGLISH
											</a> <a href="#!"
												class="dropdown-item text-muted text-truncate line-height-1 rounded p--12 mb-1">
												<i class="flag flag-de"></i> GERMAN
											</a> <a href="#!"
												class="dropdown-item text-muted text-truncate line-height-1 rounded p--12 mb-1">
												<i class="flag flag-fr"></i> FRANCAISE
											</a>
										</div></li>
									<!-- /LANGUAGE -->


									<!-- CURRENCY -->
									<li class="dropdown list-inline-item m-0"><span
										class="text-white">/</span> <!-- optional separator --> <a
										id="topDDCurrency" href="#" class="py-2 d-inline-block"
										data-toggle="dropdown" aria-expanded="false"> <span
											class="fs--14 text-white pl-2 pr-2">USD</span>
									</a>

										<div aria-labelledby="topDDCurrency"
											class="dropdown-menu dropdown-menu-hover text-uppercase text-center fs--13 px-1 pt-1 pb-0 m-0 max-h-50vh w-auto scrollable-vertical">
											<a href="#!"
												class="active dropdown-item text-muted text-truncate line-height-1 rounded pt--12 pb--12 mb-1">
												USD </a> <a href="#!"
												class="dropdown-item text-muted text-truncate line-height-1 rounded pt--12 pb--12 mb-1">
												EUR </a> <a href="#!"
												class="dropdown-item text-muted text-truncate line-height-1 rounded pt--12 pb--12 mb-1">
												GBP </a>
										</div></li>
									<!-- /CURRENCY -->

								</ul>
							</div>

						</div>
					</div>

				</div>
			</div>
			<!-- /TOP BAR -->



			<!-- NAVBAR -->
			<div class="container position-relative">


				<!-- 

            [SOW] SEARCH SUGGEST PLUGIN
            ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++
            PLEASE READ DOCUMENTATION
            documentation/plugins-sow-search-suggest.html
            ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++

          -->
				<form action="search-result-2.html" method="GET"
					data-autosuggest="on" data-mode="json" data-json-max-results='10'
					data-json-related-title='Explore Smarty'
					data-json-related-item-icon='fi fi-star-empty'
					data-json-suggest-title='Suggestions for you'
					data-json-suggest-noresult='No results for'
					data-json-suggest-item-icon='fi fi-search'
					data-json-suggest-min-score='5' data-json-highlight-term='true'
					data-contentType='application/json; charset=utf-8'
					data-dataType='json' data-container="#sow-search-container"
					data-input-min-length="2" data-input-delay="250"
					data-related-keywords=""
					data-related-url="_ajax/search_suggest_related.json"
					data-suggest-url="_ajax/search_suggest_input.json"
					data-related-action="related_get" data-suggest-action="suggest_get"
					class="js-ajax-search sow-search sow-search-over hide d-inline-flex">
					<div class="sow-search-input w-100">

						<div
							class="input-group-over d-flex align-items-center w-100 h-100 rounded shadow-md">

							<input placeholder="what are you looking today?"
								aria-label="what are you looking today?" name="s" type="text"
								class="form-control-sow-search form-control form-control-lg shadow-xs"
								value="" autocomplete="off"> <span
								class="sow-search-buttons"> <!-- search button -->
								<button aria-label="Global Search" type="submit"
									class="btn bg-transparent shadow-none m-0 px-2 py-1 text-muted">
									<i class="fi fi-search fs--20"></i>
								</button> <!-- close : mobile only (d-inline-block d-lg-none) --> <a
								href="javascript:;"
								class="btn-sow-search-toggler btn btn-light shadow-none m-0 px-2 py-1 d-inline-block d-lg-none">
									<i class="fi fi-close fs--20"></i>
							</a>

							</span>

						</div>

					</div>

					<!-- search suggestion container -->
					<div class="sow-search-container w-100 p-0 hide shadow-md"
						id="sow-search-container">
						<div class="sow-search-container-wrapper">

							<!-- main search container -->
							<div class="sow-search-loader p-3 text-center hide">
								<i class="fi fi-circle-spin fi-spin text-muted fs--30"></i>
							</div>

							<!-- 
                  AJAX CONTENT CONTAINER 
                  SHOULD ALWAYS BE AS IT IS : NO COMMENTS OR EVEN SPACES!
                -->
							<div class="sow-search-content rounded w-100 scrollable-vertical"></div>

						</div>
					</div>
					<!-- /search suggestion container -->

					<!-- 

              overlay combinations:
                overlay-dark opacity-* [1-9]
                overlay-light opacity-* [1-9]

            -->
					<div class="sow-search-backdrop overlay-dark opacity-3 hide"></div>

				</form>
				<!-- /SEARCH -->





				<nav
					class="navbar navbar-expand-lg navbar-dark text-white justify-content-lg-between justify-content-md-inherit">

					<div class="align-items-start">

						<!-- 
                Logo : height: 70px max
              -->
						<a class="navbar-brand" href="/portfoli"> <img
							src="${pageContext.request.getContextPath()}/resources/assets/images/logo/logo.png"
							width="110" height="32" alt="...">
						</a>

					</div>


					<!-- Menu -->

					<div class="collapse navbar-collapse navbar-animate-fadein"
						id="navbarMainNav">

						<!-- NAVIGATION -->
						<ul class="navbar-nav">
							<!-- Menu -->

							<!-- documentation -->
							<c:if test="${loginUser.type=='1' or loginUser.type==null}">
								<li class="nav-item"><a href="/portfoli/app/portfolio/list" id="portfolio"
									class="nav-link dropdown-toggle nav-link-caret-hide"
									style="width: 150px; margin-left: 30px;" <span>포트폴리오</span></a></li>
								<li class="nav-item"><a href="#" id="info"
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
								<li class="nav-item"><a href="#" id="portfolio"
									class="nav-link dropdown-toggle nav-link-caret-hide"
									style="width: 150px; margin-left: 30px;" <span>포트폴리오</span></a></li>
								<li class="nav-item"><a href="#" id="info"
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
					</div>


					<li class="list-inline-item mx-1 dropdown"><a href="#"
						aria-label="website search"
						class="btn-sow-search-toggler btn btn-sm rounded-circle btn-secondary">
							<i class="fi fi-search"></i>
					</a></li>

					<!-- 로그인 전 -->

					<c:if test="${empty loginUser}">
						<li class="list-inline-item"><a
							class="nav-link text-secondary"
							href="/portfoli/app/member/generalJoin"
							style="text-decoration: none; font-weight: bold;">회원가입</a></li>

						<li
							class="list-inline-item ml--6 mr--6 float-start d-none d-lg-inline-block">
							<a target="_blank" href="/portfoli/app/auth/loginForm"
							class="btn btn-sm btn-warning shadow-none m-0">로그인</a>
						</li>
					</c:if>

					<!-- 일반 회원 로그인 후 -->
					<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
					<script type="text/javascript">
    function sendMessage() {
      console.log('trying socket connection');
      var wsUri = "ws://" + window.location.host + "/portfoli/app/message/alert";
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
					<c:if test="${loginUser.type == '1'}">

						<li class="list-inline-item ml--6 mr--6 dropdown"><a href="#"
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

								<li class="list-inline-item ml--6 mr--6 dropdown-menu-hover"><a
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
												style="background-image: url('../../html_frontend/demo.files/images/icons/user80.png')"></div>

											<!-- initials - no image -->
											<!--
                    <div data-initials=${loginUser.name} data-assign-color="true" class="sow-util-initials bg-light rounded h5 w--60 h--60 d-inline-flex justify-content-center align-items-center rounded-circle float-start">
                      <i class="fi fi-circle-spin fi-spin"></i>
                    </div>
                    -->

											<!-- user detail -->
											<span class="d-block font-weight-medium text-truncate fs--16"><a
												href="/portfoli/app/member/generalMypage" class="text-muted">${loginUser.name}</a>

											</span> <span
												class="d-block text-muted font-weight-medium text-truncate">${loginUser.email}</span>

										</div>

										<div class="dropdown-divider" style="z-index: 200;"></div>

										<a href="#!" target="_blank"
											class="dropdown-item text-truncate font-weight-medium"> <span
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
										</a> <a href="#!"
											class="dropdown-item text-truncate font-weight-medium">
											멤버쉽 <small class="d-block text-muted">계정 업그레이드</small>
										</a>

										<div class="dropdown-divider mb-0"></div>

										<a href="/portfoli/app/auth/logout"
											class="prefix-icon-ignore dropdown-footer dropdown-custom-ignore font-weight-medium pt-3 pb-3">
											<i class="fi fi-power float-start"></i> Log Out
										</a>
									</div></li>
					</c:if>

					<!-- 기업 회원 로그인 후 -->

					<c:if test="${loginUser.type == '2'}">
						<li class="list-inline-item ml--6 mr--6 dropdown"><a href="#"
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
								<div class="max-h-50vh">
									<c:forEach items="${recentMessages}" var="item">
										<a href="#!"
											class="clearfix dropdown-item font-weight-medium px-3 border-bottom border-light overflow-hidden shadow-md-hover bg-theme-color-light">
											<span
											class="badge badge-success float-end font-weight-normal mt-1"
											<c:if test="${not empty item.receiveDate}"> style="visibility:hidden;"</c:if>>new</span>

											<!-- image --> <c:if
												test="${empty item.member.photoFilePath}">
												<div
													class="w--50 h--50 mb-2 mt-1 rounded-circle bg-cover bg-light float-start"
													style="background-image:url('${pageContext.request.getContextPath()}/resources/assets/images/icons/user80.png')"></div>
											</c:if> <c:if test="${not empty item.member.photoFilePath}">
												<div
													class="w--50 h--50 mb-2 mt-1 rounded-circle bg-cover bg-light float-start"
													style="background-image:url('${pageContext.request.getContextPath()}/upload/member/${item.member.photoFilePath}')"></div>
											</c:if> <!-- sender --> <strong class="d-block text-truncate">${item.member.id}</strong>
											<p class="fs--14 m-0 text-truncate font-weight-normal">${item.title}</p>
											<!-- date --> <small class="d-block fs--11 text-muted">
												<fmt:formatDate var="sendDate" value="${item.sendDate}"
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

								<li class="list-inline-item ml--6 mr--6 dropdown-menu-hover"><a
									href="#" id="dropdownAccountOptions"
									class="btn btn-sm btn-light dropdown-toggle btn-pill pl--12 pr--12"
									data-toggle="dropdown" aria-expanded="false"
									aria-haspopup="true"> <span class="group-icon m-0">
											<i class="fi w--15 fi-user-male"></i> <i
											class="fi w--15 fi-close"></i>
									</span> <span
										class="fs--14 d-none d-sm-inline-block font-weight-medium">[기업]&nbsp;&nbsp;${loginUser.name}</span>
								</a> <!--
                  
       
                    <div aria-labelledby="dropdownAccountOptions"
                      class="prefix-link-icon prefix-icon-dot dropdown-menu dropdown-menu-clean dropdown-menu-navbar-autopos dropdown-menu-invert dropdown-click-ignore p-0 mt--18 fs--15 w--300">

                      <div class="dropdown-header fs--14 py-4">

                        <!-- profile image -->
									<div
										class="w--60 h--60 rounded-circle bg-light bg-cover float-start"
										style="background-image: url('../../html_frontend/demo.files/images/icons/user80.png')"></div>

									<!-- initials - no image --> <!--
                    <div data-initials="John Doe" data-assign-color="true" class="sow-util-initials bg-light rounded h5 w--60 h--60 d-inline-flex justify-content-center align-items-center rounded-circle float-start">
                      <i class="fi fi-circle-spin fi-spin"></i>
                    </div>
                    --> <!-- user detail --> <span
									class="d-block font-weight-medium text-truncate fs--16"><a
										href="/portfoli/app/member/companyMypage" class="text-muted">${loginUser.name}</a></span>
									<span
									class="d-block text-muted font-weight-medium text-truncate">${loginUser.email}</span>
							</div>

							<div class="dropdown-divider"></div> <a href="#!" target="_blank"
							class="dropdown-item text-truncate font-weight-medium"> Notes
								<small class="d-block text-muted">personal encypted
									notes</small>
						</a> <a href="#!" target="_blank"
							class="dropdown-item text-truncate font-weight-medium"> <span
								class="badge badge-success float-end font-weight-normal mt-1">3
									new</span> Messages <small class="d-block text-muted">internal
									messaging system</small>
						</a> <a href="#!" target="_blank"
							class="dropdown-item text-truncate font-weight-medium"> <span
								class="badge badge-danger float-end font-weight-normal mt-1">1
									unpaid</span> Invoices <small class="d-block text-muted">montly
									billing</small>
						</a> <a href="#!"
							class="dropdown-item text-truncate font-weight-medium">
								Account Settings <small class="d-block text-muted">profile,
									password and more...</small>
						</a> <a href="#!"
							class="dropdown-item text-truncate font-weight-medium">
								Upgrade <small class="d-block text-muted">upgrade your
									account</small>
						</a>

							<div class="dropdown-divider mb-0"></div> <a
							href="/portfoli/app/auth/logout"
							class="prefix-icon-ignore dropdown-footer dropdown-custom-ignore font-weight-medium pt-3 pb-3">
								<i class="fi fi-power float-start"></i> Log Out
						</a>
			</div>
			</li>
			</c:if>


			</ul>
			<!-- /OPTIONS -->



			</nav>
	</div>
	<!-- /NAVBAR -->

	</header>
	<!-- /HEADER -->