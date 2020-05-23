<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>

<aside id="aside-main"
  class="aside-start bg-gradient-dark font-weight-light aside-hide-xs d-flex flex-column h-auto">

  <!-- Logo -->
  <div class="d-none d-sm-block">
    <div class="clearfix d-flex justify-content-between">

      <a id="contentsHome" class="w-100 align-self-center navbar-brand p-3"
        href="/portfoli/admin/auth/index">
        <img src="${pageContext.request.getContextPath()}/resources/assets/images/logo/adminlogo.png"
        width="220" height="40" alt="...">
      </a>

    </div>
  </div>
  <!-- /LOGO -->

  <div class="aside-wrapper scrollable-vertical scrollable-styled-light align-self-baseline h-100 w-100">
    <nav class="nav-deep nav-deep-dark nav-deep-hover fs--15 pb-5">
      <ul style="height: 25px"></ul>
      <ul class="nav flex-column">
        <li class="nav-item active">
          <a class="nav-link" href="#"> <i class="fi fi-user-male"></i>
            회원 관리
          </a>

        <li class="nav-item">
          <a class="nav-link" href="/portfoli/admin/qna/list"> <i class="fab fa-quora"></i>
            Q&A 관리
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="/portfoli/admin/report/list"> <i class="fi fi-support"></i>
            신고 처리
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="#"> <i class="fas fa-coins"></i>
            결제 관리
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="/portfoli/admin/banner/list"> <i class="fi fi-image"></i>
            배너 관리
          </a>
        </li>

        <li class="nav-title mt-5">
          <h6 class="fs--15 mb-1 text-white font-weight-normal">
            로그 및 통계
          </h6>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="/portfoli/admin/log/contentsLog"> <i class="nav-icon fi fi-folder-full"></i>
            Log
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link js-ajax" href="#"> <i class="nav-icon fi fi-graph"></i>
            통계
          </a>
        </li>

        <li class="nav-title mt-5">
          <h6 class="fs--15 mb-1 text-white font-weight-normal">
            Settings
          </h6>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="#"> <i class="nav-icon fi fi-shape-star"></i>
          <!-- <span class="badge opacity-2 font-weight-light float-end fs--11 mt-1">1</span> -->
            설정
          </a>
        </li>
      </ul>
    </nav>

  </div>
</aside>