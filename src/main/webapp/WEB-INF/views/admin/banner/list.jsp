<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="middle" class="flex-fill">
  <!-- 
          <div class="page-title shadow-xs">
            <h1 class="h5 pt-2 mb-0 font-weight-normal">
              배너 관리
            </h1>

              <p class="breadcrumb breadcrumb-sublime fs--13 pb-2">
                  배너를 등록, 수정, 삭제하는 페이지입니다.
              </p>
          </div>
         -->
  <!-- Primary -->
  <section class="rounded mb-3">
    <!-- header -->
    <div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom">
      배너 관리 <small class="fs--11 text-muted d-block mt-1">
      배너를 등록, 수정, 삭제하는 페이지입니다.</small>
    </div>
    <!-- /header -->

    <!-- Main -->
    <div class="row gutters-sm">
      <div class="col-12 col-lg-7 col-xl-9 mb-5">
        <!-- Activate List -->
        <div class="portlet-header">
          <div class="float-end">
            <a href="/portfoli/admin/banner/form"
              class="btn btn-sm btn-primary btn-pill px-2 py-1 fs--15 mt--n3">
              + 등록 </a>
          </div>

          <span class="d-block text-muted text-truncate font-weight-medium pt-1">
            게시중인 배너 </span>
        </div>

        <div class="list-group sortable" data-sort-swap="true">
          <c:forEach items="${activatedList}" var="postedBanner">
            <div class="list-group-item">
              <a href="/portfoli/admin/banner/detail?number=${postedBanner.number}">
                <span class="font-weight-medium text-muted mx-2 m-0-xs"> ${postedBanner.title} </span></a>
            </div>
          </c:forEach>
        </div>
        <!-- /Activate List -->

        <!-- NotActivate List -->
        <div class="portlet-header">
          <span
            class="d-block text-muted text-truncate font-weight-medium pt-1">
            숨긴 배너 </span>
        </div>

        <div class="list-group sortable" data-sort-swap="true">
          <c:forEach items="${notActivatedList}" var="notPostedBanner">
            <div class="list-group-item">
              <a href="/portfoli/admin/banner/detail?number=${notPostedBanner.number}">
               <span class="font-weight-medium text-muted mx-2 m-0-xs"> ${notPostedBanner.title} </span></a>
            </div>
          </c:forEach>
        </div>
        <!-- /NotActivate List -->

      </div>
    </div>
  </section>
</div>