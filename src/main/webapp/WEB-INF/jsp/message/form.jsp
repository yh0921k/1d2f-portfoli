<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
	errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../header.jsp" />

<!-- portlet -->
<div class="portlet">

	<!-- portlet : header -->
	<div class="portlet-header border-bottom">

		<div class="container">
			<span class="d-block text-truncate font-weight-medium py-2">
				쪽지 보내기</span>
		</div>

	</div>
	<!-- /portlet : header -->

	<form action='add' method='post' enctype='multipart/form-data'>
		<!-- portlet : body -->
		<div class="portlet-body">

			<div class="container">
<input name='senderNumber' type='hidden' value='${sender.number}'>
<input name='receiverNumber' type='hidden' value='${receiver.number}'>
<input name="senderDelete" type='hidden' value='0'>
<input name="receiverDelete" type='hidden' value='0'>
				<div class="form-label-group mb-3 w-50">
				 <input type="text" value="${sender.id}" readOnly class="form-control"> <label
						for="message_subject">보내는 사람</label>
				</div>
				<div class="form-label-group mb-3 w-50">
					<input type="text" value="${receiver.id}" readOnly
						class="form-control"> <label for="message_subject">받는
						사람</label>
				</div>
				<div class="form-label-group mb-3 mt-3">
					<input name="title" type="text" class="form-control">
					<label for="message_subject">제목</label>
				</div>
      <textarea name='content'
        class="medium-editor bg-white border rounded p-3 w-100 min-h-300"
        data-placeholder="내용을 입력해주세요." data-lng-save="Save"
        data-lng-clear="Clear" data-lng-link="Paste or type a link"
        data-btn-picker="true" data-btn-bold="true" data-btn-italic="true"
        data-btn-underline="true" data-btn-link="true" data-btn-h1="false"
        data-btn-h2="false" data-btn-h3="true" data-btn-h4="true"
        data-btn-h5="true" data-btn-h6="true" data-btn-unordered="true"
        data-btn-ordered="true"></textarea>

				<small class="text-muted">* 사진 파일 최대 3개까지 전송 가능합니다. (각 최대 3MB)</small>

<!-- 1. MULTIPLE FILE UPLOAD -->

      <div class="input-group">
        <div class="custom-file custom-file-secondary">

          <!--

                          Params for multiple files
                              data-file-ext="jpg, png, gif, mp3"                      file extendion allowed
                              data-file-max-size-kb-per-file="100"                      size per file in Kb
                              data-file-max-size-kb-total="300"                       size of total files
                              data-file-max-total-files="3"                         maximum files allowed to upload
                              data-file-ext-err-msg="Allowed:"                        file extension error message (default: "Allowed:" )
                              data-file-exist-err-msg="File already exists:"                file already exists message (default: "File already exists:")
                              data-file-size-err-item-msg="File too large!"                 file too large error message (default: "File too large!")
                              data-file-size-err-total-msg="Total allowed size exceeded!"         files total size allowed message (default: "Total allowed size exceeded!")
                              data-file-size-err-max-msg="Maximum allowed files:"             no of files error (default: "Maximum allowed files:")
                              data-file-toast-position="bottom-center"                  toastr error position
                              data-file-preview-container=".js-file-input-preview-single-container"   container preview (id or class)
                              data-file-preview-img-height="120"                      image preview height in pixels (default: 120)
                              data-file-preview-show-info="true"                      true = display image name and size in Kb (default: false)
                              data-file-btn-clear="a.js-file-upload-clear"                clear button (id or class)

                          Optional - customize preview item container:
                            data-file-preview-class="shadow-md m-2 rounded"               (default: "shadow-md m-2 rounded")
                        -->
          <input name="messageFiles" multiple="" type="file"
            data-file-ext="jpg, png, gif, bmp" data-file-max-size-kb-per-file="3000"
            data-file-max-size-kb-total="9000" data-file-max-total-files="3"
            data-file-ext-err-msg="허용되는 파일 확장자"
            data-file-exist-err-msg="이미 등록된 파일입니다."
            data-file-size-err-item-msg="최대 파일 크기를 초과했습니다."
            data-file-size-err-total-msg="최대 파일 크기를 초과했습니다."
            data-file-size-err-max-msg="최대 전송 가능 개수:"
            data-file-toast-position="bottom-center"
            data-file-preview-container=".js-file-input-preview-multiple-container"
            data-file-preview-img-height="120"
            data-file-preview-show-info="true"
            data-file-preview-class="shadow-md m-2 rounded float-start"
            data-file-btn-clear="a.js-file-upload-clear"
            class="custom-file-input" id="inputGroupFile01">
            <label class="custom-file-label" for="inputGroupFile01">파일 첨부하기</label>

        </div>
      </div>

      <div
        class="js-file-input-preview-multiple-container ml--n6 mr--n6 clearfix hide-empty">
        <!-- preview container -->
      </div>

      <!-- clear files button
           hidden by default -->
      <div class="mt-1">
        <a href="#" class="hide js-file-upload-clear btn btn-light btn-sm">
          Clear Files </a>
      </div>
    </div>

				<div class="clearfix container my-5">

					<button type="submit" class="btn btn-sm btn-primary btn-pill">
						<i class="fi fi-check"></i> 보내기
					</button>
	</form>
</div>

<jsp:include page="../footer.jsp" />