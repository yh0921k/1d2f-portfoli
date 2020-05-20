<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../header.jsp" />


<c:if test="${not empty jobPosting}">

	<div class="container">
		<h4>채용정보 변경</h4>
		<form action='update' method='post' enctype='multipart/form-data'>

			<input name='jobPostingNumber' type='hidden'
				value='${jobPosting.jobPostingNumber}'><br>

			<div class="col-sm-13">
				제목* <input name='title' placeholder="제목" class="form-control"
					type='text' value='${jobPosting.title}'><br>
			</div>

			<div class="row">
				<span class="text-gray-900 mt--12 mr--5" style="margin-left: 30px;">고용형태
					: </span> <select id="select_options2" name="employmentStatus.number"
					class="form-control form-control-sm col-md-3">
					<c:forEach items="${employmentStatus}" var="employmentStatus">
						<c:if
							test="${jobPosting.employmentStatus.name == employmentStatus.name}">
							<option value="${employmentStatus.number}" selected="selected">${employmentStatus.name}</option>
						</c:if>
						<c:if
							test="${jobPosting.employmentStatus.name != employmentStatus.name}">
							<option value="${employmentStatus.number}">${employmentStatus.name}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>

  <div class="row">
      <span class="text-gray-900 mt--12 mr--5" style="margin-left: 30px;">자격증
        : </span> <select id="select_options2" name="certificate.certificateNumber"
        class="form-control form-control-sm col-md-3">
        <c:forEach items="${certificates}" var="certificate">
          <option value="${certificate.certificateNumber}">${certificate.name}</option>
        </c:forEach>
      </select>
    </div>
<!--  
			<div class="col-sm-13">
				자격증 * <input id='certificateNumber' type='number'
					name='certificateNumber' placeholder="자격증번호" class="form-control">
			</div>
			<br>
-->
			<textarea id="content" name='content' rows='10' cols='40'
				class="markdown-editor"
				data-toolbar='["bold", "italic", "strikethrough", "|", "heading-1", "heading-2", "heading-3", "|", "image", "link", "|", "unordered-list", "ordered-list", "quote", "|", "guide", "|", "preview"]'
				data-status='["autosave", "lines", "words", "cursor"]'
				data-autofocus="true" data-autosave="true"
				data-autosave-delay="1000"
				data-autosaved-ignore-if-content-present="true"
				data-min-height="500px" data-spellcheck="false"
				data-prompt-urls="true" data-lng-placeholder="내용은 필수입력항목입니다."
				data-lng-prompt-url="Type your URL:">${jobPosting.content}</textarea>


			<div class="col-sm-13">
				최소경력* <input id="minimumCareer" placeholder="최소경력(숫자만 입력가능)"
					name='minimumCareer' type='number' class="form-control"
					value='${jobPosting.minimumCareer}'><br>
			</div>

			<div class="col-sm-13">
				직무* <input placeholder="직무" id="job" name='job' type='text'
					class="form-control" value='${jobPosting.job}' /> <label for="job"></label>
			</div>

			<br> 시작일* <input id="startDated" autocomplete="off"
				placeholder="시작일" type='text' name='startDated'
				class="form-control datepicker" value='${jobPosting.startDated}'
				data-today-highlight="true" data-layout-rounded="false"
				data-title="시작일" data-show-weeks="true" data-today-highlight="true"
				data-today-btn="true" data-clear-btn="false" data-autoclose="true"
				data-date-start="today" data-format="YYYY-MM-DD"
				data-quick-locale='{
      "days": ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
      "daysShort": ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
      "daysMin": ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
      "months": ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
      "monthsShort": ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
      "today": "Today",
      "clear": "Clear",
      "titleFormat": "MM yyyy"}'>

			<br> 마감일* <input id="endDated" autocomplete="off"
				placeholder="마감일" type='text' name='endDated'
				class="form-control datepicker" value='${jobPosting.endDated}'
				data-today-highlight="true" data-layout-rounded="false"
				data-title="마감일" data-show-weeks="true" data-today-highlight="true"
				data-today-btn="true" data-clear-btn="false" data-autoclose="true"
				data-date-start="today" data-format="YYYY-MM-DD"
				data-quick-locale='{
   "days": ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
   "daysShort": ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
   "daysMin": ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
   "months": ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
   "monthsShort": ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
   "today": "Today",
   "clear": "Clear",
   "titleFormat": "MM yyyy"}'>

			<br> 이미지 첨부*
			<div class="input-group">
				<div class="custom-file custom-file-btn-pill">
					<input id="jobPostingFiles" name='jobPostingFiles' type="file"
						data-file-ext="jpg, png, gif, mp3"
						data-file-max-size-kb-per-file="30000"
						data-file-ext-err-msg="Allowed:"
						data-file-size-err-item-msg="File too large!"
						data-file-size-err-total-msg="Total allowed size exceeded!"
						data-file-toast-position="bottom-center"
						data-file-preview-container=".js-file-input-preview-single-container2"
						data-file-preview-img-height="auto"
						data-file-preview-show-info="false"
						data-file-btn-clear="a.js-file-upload-clear2"
						class="custom-file-input"> <label
						class="custom-file-label" for="jobPostingFiles">파일을 선택하세요</label>

				</div>
			</div>


			<div class="js-file-input-preview-single-container2 ml--n6 mr--n6">
				<!-- preview container -->
			</div>


			<div class="mt-1">
				<a href="#" class="hide js-file-upload-clear2 btn btn-light btn-sm">
					이미지 삭제 </a>
			</div>

			<br>
			<p style="text-align: right">
				<button id="cBtn" class="btn btn-outline-dark btn-pill mb-1">변경</button>
			</p>
	</div>
	</form>
</c:if>

<c:if test="${empty jobPosting}">
	<p>해당 게시글이 없습니다.</p>
</c:if>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script>
var cBtn = document.getElementById("cBtn");

cBtn.onclick = function() {
	Swal.fire({
        title: '변경되었습니다.',
        icon: 'success',
         
        confirmButtonText: '확인'
      })
};


</script>

<jsp:include page="../footer.jsp" />
