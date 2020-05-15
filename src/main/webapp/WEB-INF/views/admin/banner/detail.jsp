<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
  <section class="rounded mb-3">
    <div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom">
      배너 상세보기 <small class="fs--11 text-muted d-block mt-1">
      등록한 배너의 정보입니다.</small>
    </div>

    <div class="row gutters-sm">
      <div class="col-12 col-lg-7 col-xl-9 mb-5">
        <!-- detail form -->
        <div class="table-responsive" style="overflow: visible;">

          <table class="table table-sm">
            <tr>
              <th scope="row">기업</th>
              <td>
                <table class="table table-bordered table-hover table-striped">
                  <tr>
                    <td>${company.name}</td>
                    <td>${company.tel}</td>
                    <td>${company.representative}</td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <th scope="row">배너이미지</th>
              <td><label
                class="rounded text-center position-relative d-block cursor-pointer border border-secondary border-dashed">
                  <span
                  class="z-index-2 js-file-input-showcase-container d-block absolute-full z-index-1 hide-empty">
                    <!-- image container -->
                </span>

                  <div class="absolute-full">
                    <div class="d-table">
                      <div class="d-table-cell align-middle text-center"></div>
                    </div>
                  </div>
                  <img class="w--600 h--120"
                  src="${pageContext.servletContext.contextPath}/upload/banner/${banner.filePath}"
                  alt="배너">
              </label>
              </td>
            </tr>
            <tr>
              <th scope="row">링크 URL</th>
              <td><a class="link-muted" href="${banner.url}">${banner.url}</a></td>
            </tr>
            <tr>
              <th scope="row">게시 기간</th>
              <td><fmt:formatDate var="startDate"
                  value="${banner.startDate}" pattern="yyyy.MM.dd HH:mm" /> <fmt:formatDate
                  var="endDate" value="${banner.startDate}"
                  pattern="yyyy.MM.dd HH:mm" /> ${startDate} ~ ${endDate} <!-- <div class="form-label-group">
                    <input autocomplete="off" type="text"
                      class="form-control form-control-sm rangepicker"
                      data-single-datepicker="true" data-timepicker="true"
                      data-timepicker-24h="true"
                      data-disable-auto-update-input="false"
                      data-date-format="YYYY/MM/DD HH:mm"
                      data-quick-locale='{
      "lang_apply"  : "Apply",
      "lang_cancel" : "Cancel",
      "lang_months"  : ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
      "lang_weekdays" : ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
    }'
                      placeholder="시작일" name="startDate" id="startDate"> <label
                      for="startDate">시작일</label>
                  </div>
                  <div class="form-label-group">
                    <a href="#"
                      class="btn btn-rangepicker-clear position-absolute end-0 top-0 z-index-2 fi fi-close"></a>
                    <input required autocomplete="off" type="text"
                      class="form-control rangepicker"
                      data-single-datepicker="true" data-timepicker="true"
                      data-timepicker-24h="true"
                      data-disable-auto-update-input="true"
                      data-date-format="YYYY/MM/DD HH:mm"
                      data-quick-locale='{
      "lang_apply"  : "Apply",
      "lang_cancel" : "Cancel",
      "lang_months"  : ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
      "lang_weekdays" : ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
    }'
                      placeholder="마감일" name="endDate" id="endDate"> <label
                      for="endDate">마감일</label> <a href="#"
                      class="btn btn-rangepicker-clear position-absolute end-0 top-0 z-index-2 fi fi-close"></a>
                  </div></td> -->
            </tr>
          </table>
        </div>
        <div class="text-center">
          <button type="button"
            class="btn btn-sm btn-success btn-soft btn-pill mb-1">
            <i class="fi fi-check"></i>수정
          </button>
          <button type="button"
            class="btn btn-sm btn-light btn-soft btn-pill mb-1"
            onClick='location.href="/portfoli/admin/banner/list"'>뒤로</button>
        </div>

      </div>
    </div>
  </section>
</div>