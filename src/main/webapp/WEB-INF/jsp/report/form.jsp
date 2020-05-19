<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form novalidate class="bs-validate js-ajax"
  action="/portfoli/app/report/add" method="post"
  enctype="multipart/form-data" data-modal-autoclose-on-success="true"
  data-modal-autoclose-on-success-delay="200"
  data-ajax-update-url="false" data-ajax-show-loading-icon="true"
  data-success-toast-text="<i class='fi fi-check float-start'></i>
  신고가 완료되었습니다. <br> 고객센터에서 내역을 확인하실 수 있습니다."
  data-error-toast-text="<i class='fi fi-circle-spin fi-spin float-start'></i> 빈 칸을 모두 작성해주세요."
  data-error-toast-delay="3000" data-error-toast-position="bottom-center"
  data-error-scroll-ignore="true" data-ajax-callback-function="">

  <!-- <input type="hidden" name="action" value="send_message"> -->

  <!-- Header -->
  <div class="modal-header">
    <h5 class="modal-title" id="exampleModalLabelMd">
      <i class="fi fi-envelope-2 text-muted"></i> <span
        class="d-inline-block pl-2 pr-2"> 신고하기 </span>
    </h5>

    <button type="button" class="close" data-dismiss="modal"
      aria-label="Close">
      <span class="fi fi-close fs--18" aria-hidden="true"></span>
    </button>
  </div>

  <!-- Content -->
  <div class="modal-body p--30">
    <input name='reporterNumber' type='hidden' value='${loginUser.number}'>
    <input name='targetNumber' type='hidden' value='${target.number}'>
    <input name='viewCount' type='hidden' value='0'>
    <div class="form-label-group mb-3 mt-3">
      <input type="text" value="${target.id}" readOnly
        class="form-control"> <label for="report_id"> 신고 대상 </label>
    </div>
    
    <div class="form-label-group mb-3 mt-3">
      <select class="form-control mb-3" name="reportCategory.number">
        <c:forEach items="${categories}" var="category">
        <option value="${category.number}">${category.category}</option>
        </c:forEach>
      </select>
        <label for="report_category"> 신고 유형 </label>
    </div>

    <div class="form-label-group mb-3 mt-3">
      <input required placeholder="제목" name="title" type="text" class="form-control">
      <label for="report_title"> 제목 </label>
    </div>

    <!-- Report : Body -->
    <div class="position-relative">
      <span
        class="js-form-advanced-limit-info badge badge-warning hide animate-bouncein position-absolute absolute-top m--2">
        최대 300자까지 작성할 수 있습니다. </span>
      <textarea required name="content"
        class="js-form-advanced-char-count-up form-control w-100 min-h-200
        h--200 border scrollable-vertical p--15 rounded"
        data-output-target=".js-form-advanced-char-total2" maxlength="300"
        placeholder="내용을 입력해주세요." data-lng-save="Save"
        data-lng-clear="Clear" data-lng-link="Paste or type a link"
        data-btn-picker="true" data-btn-bold="true" data-btn-italic="true"
        data-btn-underline="true" data-btn-link="true" data-btn-h1="false"
        data-btn-h2="false" data-btn-h3="true" data-btn-h4="true"
        data-btn-h5="true" data-btn-h6="true" data-btn-unordered="true"
        data-btn-ordered="true"></textarea>
      <div class="fs--12 text-muted text-align-end mt--3">
        글자 수: <span class="js-form-advanced-char-total2">0</span> / 300
      </div>
    </div>

    <!-- Report : Attachments -->
    <div class="bg-light border border-dashed rounded p--15 clearfix">
      <div class="clearfix">

        <!-- remove button -->
        <a href="#"
          class="js-file-input-btn-multiple-list-static-remove hide btn btn-sm btn-secondary float-end mb-2">
          <i class="fi fi-close"></i> 초기화
        </a>

        <!-- upload button -->
        <label
          class="btn btn-primary btn-sm cursor-pointer position-relative m-0 float-start">
          <input name="files[]" multiple="multiple" type="file"
          data-file-ext="jpg, png, gif, bmp"
          data-file-max-size-kb-per-file="4096"
          data-file-max-size-kb-total="8192" data-file-max-total-files="2"
          data-file-ext-err-msg="허용되는 파일 확장자: "
          data-file-exist-err-msg="이미 등록된 파일입니다."
          data-file-size-err-item-msg="최대 파일 크기를 초과했습니다."
          data-file-size-err-total-msg="최대 파일 크기를 초과했습니다."
          data-file-size-err-max-msg="최대 전송 가능 개수:"
          data-file-toast-position="bottom-center"
          data-file-preview-container=".js-file-input-container-multiple-list-static"
          data-file-preview-img-height="50"
          data-file-btn-clear="a.js-file-input-btn-multiple-list-static-remove"
          data-file-preview-show-info="true"
          data-file-preview-list-type="list"
          data-file-preview-class="bg-white mb-1 p--2 rounded border overflow-hidden"
          class="custom-file-input absolute-full"> <span
          class="group-icon"> <i class="fi fi-arrow-upload"></i> <i
            class="fi fi-circle-spin fi-spin"></i>
        </span> <span> 이미지 첨부하기 </span>
        </label>
      </div>

      <!-- preview container -->
      <div
        class="js-file-input-container-multiple-list-static position-relative hide-empty mt-3">
        <!-- container -->
      </div>
    </div>
    <small class="d-block text-muted mb-3 mt-1">최대 4MB의 이미지 파일만 전송 가능합니다.</small>
    <!-- /Report : Attachments -->
  </div>

  <!-- Footer -->
  <div class="modal-footer">
    <button type="submit" class="btn btn-sm btn-pill btn-primary btn-soft">
      <i class="fi fi-check"></i> 등록
    </button>
    <button type="button" class="btn btn-sm btn-pill btn-light"
      data-dismiss="modal">
      <i class="fi fi-close"></i> 취소
    </button>
  </div>
</form>

<script>
function addCallback() {
  location.href = "./";
}

console.log(${loginUser.number});
console.log(${target.number});
console.log($("select[name=reportCategory.number]").val());


</script>