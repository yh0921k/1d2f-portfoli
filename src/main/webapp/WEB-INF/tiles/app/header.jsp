<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- HEADER -->
<header id="header" class="shadow-xs z-index-1000">
  <div class="container position-relative">
    <nav
      class="navbar navbar-expand-lg navbar-light justify-content-lg-between justify-content-md-inherit">
      <div class="align-items-start">

        <!-- 
                Logo : height: 70px max
              -->
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

          <!-- documentation -->
          <c:if test="${loginUser.type=='1' or loginUser.type==null}">
            <li class="nav-item"><a href="/portfoli/app/portfolio/listWithBanner"
              id="portfolio"
              class="nav-link dropdown-toggle nav-link-caret-hide"
              style="width: 150px; margin-left: 30px;" <span>포트폴리오</span></a></li>
            <li class="nav-item"><a href="/portfoli/app/jobposting/list"
              id="info" class="nav-link dropdown-toggle nav-link-caret-hide"
              style="width: 150px; margin-left: 0px;" <span>채용정보</span></a></li>
            <li class="nav-item"><a href="#" id="recommendInfo"
              class="nav-link dropdown-toggle nav-link-caret-hide"
              style="width: 150px; margin-left: 0px;" <span>추천채용정보</span></a></li>
            <li class="nav-item"><a href="#" id="ranking"
              class="nav-link dropdown-toggle nav-link-caret-hide"
              style="width: 150px; margin-left: 30px;" <span>랭킹</span></a></li>
          </c:if>

          <c:if test="${loginUser.type=='2'}">
            <li class="nav-item"><a href="/portfoli/app/portfolio/listWithBanner" id="portfolio"
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
            <li class="nav-item"><a class="nav-link text-secondary"
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
              </div></li>

            <li class="list-inline-item dropdown-menu-hover mt-3">
            <a href="#" id="dropdownAccountOptions"
              class="btn btn-sm btn-light dropdown-toggle btn-pill pl--12 pr--12"
              data-toggle="dropdown" aria-expanded="false" aria-haspopup="true">
                <span class="group-icon m-0"> <i
                  class="fi w--15 fi-user-male"></i> <i class="fi w--15 fi-close"></i>
              </span> <span class="fs--14 d-none d-sm-inline-block font-weight-medium">[일반]&nbsp;&nbsp;${loginUser.name}
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
                    <span class="d-block font-weight-medium text-truncate fs--16"><a
                      href="/portfoli/app/member/generalMypage" class="text-muted">${loginUser.name}</a>
                    </span> <span
                      class="d-block text-muted font-weight-medium text-truncate">${loginUser.email}</span>

                  </div>

                  <div class="dropdown-divider" style="z-index: 200;"></div>

                      <a href="/portfoli/app/member/generalMypage" class="dropdown-item text-truncate font-weight-medium"> 마이페이지 
                      <small class="d-block text-muted">profile, password and more...</small>
                      </a>
                      
                      <a href="#!" target="_blank" class="dropdown-item text-truncate font-weight-medium"> 내 포트폴리오 
                      <small class="d-block text-muted">portfolio</small>
                      </a> 
                      
                      <a href="/portfoli/app/calendar/calendar" target="_blank" class="dropdown-item text-truncate font-weight-medium">
                        <span class="badge badge-success float-end font-weight-normal mt-1">3 new</span> 일정 
                        <small class="d-block text-muted">calendar</small>
                      </a> 

                  <div class="dropdown-divider mb-0"></div>

                  <a href="/portfoli/app/auth/logout"
                    class="prefix-icon-ignore dropdown-footer dropdown-custom-ignore font-weight-medium pt-3 pb-3">
                    <i class="fi fi-power float-start"></i> Log Out
                  </a>
                </div>
              </div></li>
          </c:if>

          <!-- 기업 회원 로그인 후 -->

          <c:if test="${loginUser.type == '2'}">
            <li class="list-inline-item ml--6 mr--6 dropdown mt-3"><a
              href="#" id="dropdownMessageOptions"
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

                <li
                  class="list-inline-item ml--6 mr--6 dropdown-menu-hover mt-3"><a
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