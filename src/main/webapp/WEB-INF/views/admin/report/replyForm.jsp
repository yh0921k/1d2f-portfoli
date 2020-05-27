<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="middle" class="flex-fill">
  <section class="rounded mb-3 ">
    <div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom">
      <strong> 신고 처리 </strong>
      <small class="fs--11 text-muted d-block mt-1">
               처리 내역을 작성해주세요. </small>
    </div>

        <form class="js-ajax"
          action="/portfoli/admin/report/reply" method="post"
          enctype="multipart/form-data" data-modal-autoclose-on-success="true"
          data-modal-autoclose-on-success-delay="200"
          data-ajax-update-url="false" data-ajax-show-loading-icon="true"
          data-success-toast-text="<i class='fi fi-check float-start'></i> 답변이 등록되었습니다."
          data-error-toast-text="<i class='fi fi-circle-spin fi-spin float-start'></i> 빈 칸을 모두 작성해주세요."
          data-error-toast-delay="3000" data-error-toast-position="bottom-center"
          data-error-scroll-ignore="true" data-ajax-callback-function="replyCallback">
      <input type='hidden' name='reporterNumber' value='${report.reporterNumber}'>
      <input type='hidden' name='ref' value='${report.ref}'>
      <input type='hidden' name='reStep' value='${report.reStep}'>
      <div class="col-12">
        <div class="table-responsive">
          <table class="table table-align-middle border-bottom mb-3">
            <tr>
              <th scope="row"> 신고자 </th>
              <td>${report.member.id}</td>
            </tr>
            <tr>
              <th scope="row"> 제목 </th>
              <td><input required name='title' type='text' class="form-control"
              value='RE : "${report.title}"에 대한 처리 답변입니다.'></td>
            </tr>
          </table>
            <textarea required name='content'
                    class="js-form-advanced-char-count-up form-control min-h-300 scrollable-vertical
        h--200 border p--15 rounded"
        data-output-target=".js-form-advanced-char-total2" maxlength="300"
        placeholder="내용을 입력해주세요." data-lng-save="Save"
        data-lng-clear="Clear" data-lng-link="Paste or type a link"
        data-btn-picker="true" data-btn-bold="true" data-btn-italic="true"
        data-btn-underline="true" data-btn-link="true" data-btn-h1="false"
        data-btn-h2="false" data-btn-h3="true" data-btn-h4="true"
        data-btn-h5="true" data-btn-h6="true" data-btn-unordered="true"
        data-btn-ordered="true"></textarea>
              <div class="col-12">
        <div class="table-responsive">
          <table class="table table-align-middle border-bottom mb-3">
                    <tr>
              <th scope="row"> 처리 유형 </th>
              <td>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" value="1" id="customRadioInline1" name="handleCategory"
                      class="custom-control-input" checked> <label
                      class="custom-control-label" for="customRadioInline1">게시글 삭제</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" value="2" id="customRadioInline2" name="handleCategory"
                      class="custom-control-input"> <label
                      class="custom-control-label" for="customRadioInline2">1개월 정지</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" value="3" id="customRadioInline3" name="handleCategory"
                      class="custom-control-input"> <label
                      class="custom-control-label" for="customRadioInline3">3개월 정지</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" value="4" id="customRadioInline4" name="handleCategory"
                      class="custom-control-input"> <label
                      class="custom-control-label" for="customRadioInline4">회원 추방</label>
                  </div>
              </td>
            </tr>
                      </table>
          <div class="text-center">
            <button type="submit"
              class="btn btn-sm btn-outline-primary btn-pill">
              등록
            </button>
            <button type="button"
              class="btn btn-sm btn-outline-secondary btn-pill"
              onClick='location.href="/portfoli/admin/report/detail?number=${report.number}"'>
              뒤로
            </button>
          </div>
        </div>
      </div>
    </form>
  </section>
</div>

<script>
function replyCallback() {
  location.href = "/portfoli/admin/report/list";
}
</script>