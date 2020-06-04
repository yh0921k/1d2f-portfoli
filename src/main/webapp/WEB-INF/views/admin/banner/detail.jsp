<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="middle" class="flex-fill">
  <section class="rounded mb-3">
    <div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom">
      <strong>배너 관리</strong>
    </div>

      <div class="col-sm-12">
        <!-- detail form -->
        <div class="table-responsive" style="overflow: visible;">

          <table class="table">
            <tr >
              <th scope="row">기업</th>
              <td>
                <table class="table table-bordered table-hover table-striped">
                  <tr>
                    <td width="50">${company.name}</td>
                    <td width="30">${company.tel}</td>
                    <td width="20">${company.representative}</td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <th scope="row">제목</th>
              <td>
              <span class="d-block text-muted text-truncate font-weight-medium pt-1 mt-2 mb-2">${banner.title}</span>
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
              <td><a class="link-muted mt-2 mb-2" href="${banner.url}">${banner.url}</a></td>
            </tr>
            <tr>
              <th scope="row">게시 기간</th>
              <td> <span class="d-block text-muted text-truncate">
              ${fn:substring(banner.startDate, 0, 16)} ~ ${fn:substring(banner.endDate, 0, 16)} </span>
                  <!-- <div class="form-label-group">
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
                  </div> -->
                  </td>
            </tr>
          </table>
        </div>
        <div class="text-center">
          <button type="button"
            class="btn btn-sm btn-outline-success btn-pill mb-1"
            onClick='location.href="/portfoli/admin/banner/updateForm?number=${banner.number}"'>
            <i class="fi fi-check"></i> 수정
          </button>
          <button type="button"
            class="btn btn-sm btn-outline-danger btn-pill mb-1"
            onClick='location.href="/portfoli/admin/banner/delete?number=${banner.number}"'>
            <i class="fi fi-thrash"></i> 삭제
          </button>
        <div class="d-inline-block" style="float: right;">
          <button type="button"
            class="btn btn-sm btn-outline-secondary btn-pill mb-1"
            onClick='location.href="/portfoli/admin/banner/list"'>
            <i class="fi fi-arrow-left"></i> 뒤로
          </button>
        </div>
        </div>

      </div>
  </section>
</div>