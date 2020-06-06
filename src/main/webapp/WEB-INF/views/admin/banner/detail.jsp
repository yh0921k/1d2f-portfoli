<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="middle" class="flex-fill">
  <section class="rounded mb-3">
    <div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom">
      <strong>배너 관리</strong>
    </div>

      <div>
        <!-- detail form -->
        <div class="table-responsive" style="overflow: visible;">

          <table class="table">
            <tr >
              <th scope="row">기업</th>
              <td>
                <table class="table table-bordered table-hover table-striped col-sm-12">
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
              <span class="d-block text-muted text-truncate font-weight-medium pt-1 mt-2 mb-2 col-sm-12">${banner.title}</span>
              </td>
            </tr>
            <tr>
              <th scope="row">배너이미지</th>
              <td>
              <label
                class="rounded text-center position-relative d-block cursor-pointer border border-secondary border-dashed w--600 h--120">
                  <img width="600" height="120" src="${pageContext.servletContext.contextPath}/upload/banner/${banner.filePath}"
                  alt="배너">
              </label>
              </td>
            </tr>
            <tr>
              <th scope="row">링크 URL</th>
              <td><a class="link-muted mt-2 mb-2 col-sm-12" href="${banner.url}">${banner.url}</a></td>
            </tr>
            <tr>
              <th scope="row">게시 기간</th>
              <td> <span class="d-block text-muted text-truncate col-sm-12">
              ${fn:substring(banner.startDate, 0, 16)} ~ ${fn:substring(banner.endDate, 0, 16)} </span>
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