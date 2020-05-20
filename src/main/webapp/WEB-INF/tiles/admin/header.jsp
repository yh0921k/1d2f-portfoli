<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>

<header id="header" class="bg-dark">
  <!-- NAVBAR -->
  <div class="container-fluid position-relative">
    <nav class="navbar navbar-expand-lg navbar-light justify-content-lg-between justify-content-md-inherit h--70">
      <div class="align-items-start">
        <a href="#"
          class="btn-sidebar-toggle h-100 d-inline-block d-lg-none justify-content-center align-items-center p-2">
          <span class="group-icon">
          <i> <svg width="25" viewBox="0 0 20 20">
            <path d="M 19.9876 1.998 L -0.0108 1.998 L -0.0108 -0.0019 L 19.9876 -0.0019 L 19.9876 1.998 Z"></path>
            <path d="M 19.9876 7.9979 L -0.0108 7.9979 L -0.0108 5.9979 L 19.9876 5.9979 L 19.9876 7.9979 Z"></path>
            <path d="M 19.9876 13.9977 L -0.0108 13.9977 L -0.0108 11.9978 L 19.9876 11.9978 L 19.9876 13.9977 Z"></path>
            <path d="M 19.9876 19.9976 L -0.0108 19.9976 L -0.0108 17.9976 L 19.9876 17.9976 L 19.9876 19.9976 Z"></path>
              </svg> </i>
          <i> <svg width="25" viewBox="0 0 47.971 47.971">
          <path d="M28.228,23.986L47.092,5.122c1.172-1.171,1.172-3.071,0-4.242c-1.172-1.172-3.07-1.172-4.242,0L23.986,19.744L5.121,0.88c-1.172-1.172-3.07-1.172-4.242,0c-1.172,1.171-1.172,3.071,0,4.242l18.865,18.864L0.879,42.85c-1.172,1.171-1.172,3.071,0,4.242C1.465,47.677,2.233,47.97,3,47.97s1.535-0.293,2.121-0.879l18.865-18.864L42.85,47.091c0.586,0.586,1.354,0.879,2.121,0.879s1.535-0.293,2.121-0.879c1.172-1.171,1.172-3.071,0-4.242L28.228,23.986z" />
              </svg> </i>
           </span> </a>
        <a class="navbar-brand d-inline-block d-lg-none" href="#">
        <img src="${pageContext.request.getContextPath()}/resources/assets/images/logo/adminlogo.png"
          width="110" height="60" alt="...">
        </a>
      </div>

      <!-- OPTIONS -->
      <ul class="list-inline list-unstyled mb-0 d-flex align-items-end">
        <!-- account -->
        <li class="list-inline-item ml--6 mr--6 dropdown"> <span id="sessionExpire" role="alert"
          style="margin-right: 50px; color: #dddddd">세션 만료 : ${expire}초 남음</span>
          <a href="/portfoli/admin/adminAuth/loginForm" id="dropdownAccountOptions" class="btn btn-sm btn-dark btn-pill pl--12 pr--12">
          <span class="group-icon m-0"> <i class="fi w--15 fi-power"></i>
          </span> <span class="fs--14 d-none d-sm-inline-block font-weight-medium">Log out</span>
        </a> </li>
      </ul>
      <!-- /OPTIONS -->
    </nav>

    <!-- TOP NAVIGATION TOGGLER -->
    <button
      class="navbar-toggler shadow-xs h-auto w-auto m-0 btn btn-sm bg-white rounded-circle
      position-absolute end-0 mt-1 mb-1 ml-2 mr-2 z-index-2 d-none d-inline-block d-lg-none"
      type="button" data-toggle="collapse" data-target="#navbarMainNav"
      aria-controls="navbarMainNav" aria-expanded="false"
      aria-label="Toggle navigation">
      <i class="fi fi-bars"></i>
    </button>
    <!-- /TOP NAVIGATION TOGGLER -->
  </div>
</header>