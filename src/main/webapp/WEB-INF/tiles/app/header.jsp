<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- HEADER -->
<header id="header" class="shadow-xs z-index-1000">
  <div class="container position-relative">
    <nav
      class="navbar navbar-expand-lg navbar-light justify-content-lg-between justify-content-md-inherit">
      <div class="align-items-start">

        <a class="navbar-brand" href="/portfoli"> <img
          src="${pageContext.request.getContextPath()}/resources/assets/images/logo/logo.png"
          width="150" height="20" alt="..."> <img
          src="${pageContext.request.getContextPath()}/resources/assets/images/logo/logo2.png"
          width="150" height="20" alt="...">
        </a>

      </div>

      <!-- Menu -->

      <div class="collapse navbar-collapse justify-content-end"
        id="navbarMainNav">

        <!-- NAVIGATION -->
        <ul class="navbar-nav fs--14">
          <!-- Menu -->

          <div class="collapse navbar-collapse justify-content-end" id="navbarMainNav">

            <!-- NAVIGATION -->
            <ul class="navbar-nav fs--14">
              <!-- Menu -->

              <!-- documentation -->
              <c:if test="${loginUser.type=='1' or loginUser.type==null}">
                <li class="nav-item"><a href="/portfoli/app/portfolio/listWithBanner" id="portfolio"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 30px;"> <span style="font-size: 1.1rem;">포트폴리오</span></a></li>
                <li class="nav-item"><a
                  href="/portfoli/app/jobposting/list" id="info"
                  class="nav-link dropdown-toggle nav-link-caret-hide jobposting"
                  style="width: 150px; margin-left: 0px;"> <span style="font-size: 1.1rem;">채용정보</span></a></li>
                <li class="nav-item"><a 
                  href="/portfoli/app/recommendEmployer/list" id="recommendInfo"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 0px;"> <span style="font-size: 1.1rem;">추천채용정보</span></a></li>
                <li class="nav-item"><a href="/portfoli/app/rank/list " id="ranking"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 30px;"> <span style="font-size: 1.1rem;">랭킹</span></a></li>
              </c:if>

              <c:if test="${loginUser.type=='2'}">
                <li class="nav-item"><a href="/portfoli/app/portfolio/listWithBanner" id="portfolio"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 30px;"> <span style="font-size: 1.1rem;">포트폴리오</span></a></li>
                <li class="nav-item"><a href="/portfoli/app/jobposting/list" id="info"
                  class="nav-link dropdown-toggle nav-link-caret-hide jobposting"
                  style="width: 150px; margin-left: 0px;"> <span style="font-size: 1.1rem;">채용정보</span></a></li>
                <li class="nav-item"><a href="/portfoli/app/recommendEmployee/recommend" id="recommendInfoForCom"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 0px;"> <span style="font-size: 1.1rem;">인재추천정보</span></a></li>
                <li class="nav-item"><a href="/portfoli/app/rank/list" id="ranking"
                  class="nav-link dropdown-toggle nav-link-caret-hide"
                  style="width: 150px; margin-left: 30px;"> <span style="font-size: 1.1rem;">랭킹</span></a></li>
              </c:if>
              <!-- /NAVIGATION --> 

          <!-- 로그인 전 -->
          <c:if test="${empty loginUser}">
            <li class="nav-item"><a
              class="nav-link text-secondary"
              href="/portfoli/app/member/generalJoin"
              style="text-decoration: none; font-size: 1.1rem;">회원가입</a></li>

            <li
              class="list-inline-item ml--6 mr--6 float-start d-none d-lg-inline-block">
              <a target="_blank" href="/portfoli/app/auth/loginForm"
              class="nav-link text-secondary" style="font-size: 1.1rem;">로그인</a>
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
                      data-ajax-modal-backdrop=""> <span
                      class="badge badge-soft badge-warning float-end font-weight-normal mt-1"
                      <c:if test="${not empty recentMessage.receiveDate}"> style="visibility:hidden;"</c:if>>new</span>

                      <!-- image -->
                      <c:choose>
                      <c:when
                        test="${empty recentMessage.member.photoFilePath}">
                        <div
                          class="w--50 h--50 mb-2 mt-1 rounded-circle bg-cover bg-light float-start"
                          style="background-image:url('${pageContext.request.getContextPath()}/resources/assets/images/icons/user80.png')"></div>
                      </c:when> 
                      <c:when test="${not empty recentMessage.member.photoFilePath}">
                        <div
                          class="w--50 h--50 mb-2 mt-1 rounded-circle bg-cover bg-light float-start"
                          style="background-image:url('${pageContext.request.getContextPath()}/upload/member/${recentMessage.member.photoFilePath}')"></div>
                      </c:when></c:choose> <!-- sender --> <strong class="d-block text-truncate">${recentMessage.member.id}</strong>
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
                  aria-haspopup="true"> 
                  
                  <span
                class="badge badge-danger shadow-danger-md animate-pulse fs--10 p--3 mt--n3 position-absolute end-0"
                id="showAlarm"></span>
                  
                  <span class="group-icon m-0">
                      <i class="fi w--15 fi-user-male"></i> <i
                      class="fi w--15 fi-close"></i>
                  </span> 
                  <span  
                    class="fs--14 d-none d-sm-inline-block font-weight-medium">[일반]&nbsp;&nbsp;${loginUser.name}
                  </span>
                </a>

                  <div aria-labelledby="dropdownAccountOptions"
                    class="prefix-link-icon prefix-icon-dot dropdown-menu dropdown-menu-clean dropdown-menu-navbar-autopos dropdown-menu-invert dropdown-click-ignore p-0 mt--18 fs--15 w--300">

                    <div class="dropdown-header fs--14 py-4">

                      <!-- profile image -->
                      <c:set var="photo" value="${loginUser.photoFilePath}"/>
                      <c:choose>
                        <c:when test="${empty photo}">
                      <div
                        class="w--60 h--60 rounded-circle bg-light bg-cover float-start"
                        style="background-image: url('${pageContext.request.getContextPath()}/resources/assets/images/icons/user80.png')"></div>
                        </c:when>
                          <c:when test="${fn:startsWith(photo, 'https://avatars3.githubusercontent.com/')}">
                            <div class="w--60 h--60 rounded-circle bg-cover bg-light float-start"
                          style="background-image:url('${photo}')"></div>
                          </c:when>
                        <c:when test="${not empty photo}">
                          <div class="w--60 h--60 rounded-circle bg-cover bg-light float-start"
                        style="background-image: url('${pageContext.request.getContextPath()}/upload/member/${photo}')"></div>
                        </c:when>
                        </c:choose>
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

                      <a href="/portfoli/app/member/generalMypage" class="dropdown-item text-truncate font-weight-medium"> 마이페이지 
                      <small class="d-block text-muted">profile, password and more...</small>
                      </a>
                      
                      <a href="/portfoli/app/portfolio/mylist" class="dropdown-item text-truncate font-weight-medium"> 내 포트폴리오 
                      <small class="d-block text-muted">my portfolio</small>
                      </a> 
                      
                      <a href="/portfoli/app/calendar/calendar" class="dropdown-item text-truncate font-weight-medium">
                        <span id="alarm" class="badge badge-success float-end font-weight-normal mt-1"></span> 일정 
                        <small class="d-block text-muted">calendar</small>
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
                      data-ajax-modal-backdrop=""> <span
                      class="badge badge-soft badge-warning float-end font-weight-normal mt-1"
                      <c:if test="${not empty recentMessage.receiveDate}"> style="visibility:hidden;"</c:if>>new</span>

                      <!-- image --> <c:if test="${empty recentMessage.member.photoFilePath}">
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
                        <c:if test="${empty loginUser.photoFilePath}">
                        style="background-image: url('${pageContext.request.getContextPath()}/resources/assets/images/icons/user80.png')"></div>
                        </c:if>
                        <c:if test="${not empty loginUser.photoFilePath}">
                        style="background-image: url('${pageContext.request.getContextPath()}/upload/member/${loginUser.photoFilePath}')"></div>
                        </c:if>

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
                    <a href="/portfoli/app/jobposting/mylist" target="_blank"
                    class="dropdown-item text-truncate font-weight-medium">
                    채용 공고 관리 <small class="d-block text-muted">job posting management</small>
                  </a> <a href="/portfoli/app/payment/introduction"
                    class="dropdown-item text-truncate font-weight-medium">
                    채용 상품 안내 <small class="d-block text-muted">recruitment product information</small>
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

<%-- 상단 앵커 추가 --%>
<a class="scroll" href='#header' style="border: 1px solid black;text-align: center;width: 47px;height: 51px;position:fixed;z-index: 100;bottom:10px;right:10px;cursor: pointer;background-color: #dee6e1;font-weight: bolder;display: table;">
	<div style="top: 10px;position: relative;">
		<i class="fi-arrow-up fi"></i>
	</div>
</a>
<script>

$(document).ready(function() {
	
	// 상단 앵커 기능 구현 (w/ scroll 효과)
  $(".scroll").click(function(event){
      event.preventDefault();
      $('html,body').animate({scrollTop:$(this.hash).offset().top}, 600);
  });
	
// url 링크에 따라 상단 nav바에 text-shadow 효과 주기
	var queryString = window.location.pathname;
	console.log(queryString);
	var cssTarget;
	if(queryString.indexOf('/portfoli/app/portfolio/listWithBanner') > -1
			|| queryString.indexOf('/portfoli/app/portfolio/searchAll') > -1
			|| queryString.indexOf('/portfoli/app/portfolio/list') > -1) {
		cssTarget = $('#portfolio > span');
	} else if(queryString.indexOf('/portfoli/app/jobposting/list') > -1 
			|| queryString.indexOf('/portfoli/app/jobposting/detail') > -1 
			|| queryString.indexOf('/portfoli/app/jobposting/search') > -1) {
		cssTarget = $('.jobposting > span');
	} else if(queryString.indexOf('/portfoli/app/recommendEmployer/list') > -1) {
		cssTarget = $('#recommendInfo > span');
	} else if(queryString.indexOf('/portfoli/app/recommendEmployee/recommend') > -1) {
		cssTarget = $('#recommendInfoForCom > span');
	} else if(queryString.indexOf('/portfoli/app/rank/list') > -1){
		cssTarget = $('#ranking > span');
	}
	cssTarget.css('font-size','1.1rem').css('font-weight','bold').css('text-shadow','2px 2px 19px #8ec1a1').css('color','#85ad94');
});
</script>