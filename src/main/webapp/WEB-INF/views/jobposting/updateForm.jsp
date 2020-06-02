<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:if test="${not empty jobPosting}">

	<div class="container">
		<h4>채용정보 변경</h4>
		<form action='update' method='post' enctype='multipart/form-data'>

			<input name='jobPostingNumber' type='hidden'
				value='${jobPosting.jobPostingNumber}'><br>
			<!---------------------------------------------제목------------------------------------------------->
			<div class="col-sm-13">
				제목* <input name='title' placeholder="제목" class="form-control"
					type='text' value='${jobPosting.title}'><br>
			</div>
			<!--------------------------------------------/제목------------------------------------------------->
			<!--------------------------------------------전화번호----------------------------------------------->
			<div class="col-sm-13">
				전화번호* <input name='tel' placeholder="전화번호" class="form-control"
					type='text' value='${jobPosting.tel}'><br>
			</div>
			<!-------------------------------------------/전화번호----------------------------------------------->

			<!-------------------------------------------고용형태------------------------------------------------>
			<div class="input-group mb-3 ml-1">
				<select class="custom-select" id="inputGroupSelect01"
					name="employmentStatus.number">
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
				<div class="input-group-append">
					<label class="input-group-text label label-outline-secondary"
						for="inputGroupSelect01">고용형태</label>
				</div>
			</div>
			<!-------------------------------------------/고용형태----------------------------------------------->
			<!-------------------------------------------분야--------------------------------------------------->
			<div class="input-group mb-3 ml-1">
        <select class="custom-select" id="inputGroupSelect06"
          name="field.number">
          <c:forEach items="${fields}" var="field">
            <c:if
              test="${jobPosting.field.name == field.name}">
              <option value="${field.number}" selected="selected">${field.name}</option>
            </c:if>
            <c:if
              test="${jobPosting.field.name != field.name}">
              <option value="${field.number}">${field.name}</option>
            </c:if>
          </c:forEach>
        </select>
        <div class="input-group-append">
          <label class="input-group-text label label-outline-secondary"
            for="inputGroupSelect06">분야</label>
        </div>
      </div>
			<!-------------------------------------------/분야-------------------------------------------------->
			<!-------------------------------------------지역--------------------------------------------------->
			
			<div class="input-group mb-3 ml-1">
				<select class="custom-select" id="inputGroupSelect02"
					name="district.districtNumber">
					<c:forEach items="${districts}" var="district">
						<c:if test="${jobPosting.district.name == district.name}">
							<option value="${district.districtNumber}" selected="selected">${district.name}</option>
						</c:if>
						<c:if test="${jobPosting.district.name != district.name}">
							<option value="${district.districtNumber}">${district.name}</option>
						</c:if>
					</c:forEach>
				</select>
				<div class="input-group-append">
					<label class="input-group-text label label-outline-secondary"
						for="inputGroupSelect02">지역</label>
				</div>
			</div>
			<!-------------------------------------------/지역-------------------------------------------------->
			<!-----------------------------------------------학력----------------------------------------------->
			 <div class="input-group mb-3 ml-1">
            <select class="custom-select" id="inputGroupSelect03"
              name="finalEducation.educationNumber">
             <c:forEach items="${finalEducations}" var="finalEducation">
            <c:if
              test="${jobPosting.finalEducation.category == finalEducation.category}">
              <option value="${finalEducation.educationNumber}"
                selected="selected">${finalEducation.category}</option>
            </c:if>
            <c:if
              test="${jobPosting.finalEducation.category != finalEducation.category}">
              <option value="${finalEducation.educationNumber}">${finalEducation.category}</option>
            </c:if>
          </c:forEach>
            </select>
            <div class="input-group-append">
              <label class="input-group-text label label-outline-secondary" for="inputGroupSelect03" >최소학력</label>
            </div>
          </div>
			<!-------------------------------------------/학력-------------------------------------------------->
			<!-------------------------------------------자격증-------------------------------------------------->
			 <div class="input-group mb-3 ml-1">
            <select class="custom-select" id="inputGroupSelect04"
              name="certificate.certificateNumber">
             <c:forEach items="${certificates}" var="certificate">
            <c:if test="${jobPosting.certificate.name == certificate.name}">
              <option value="${certificate.certificateNumber}"
                selected="selected">${certificate.name}</option>
            </c:if>
            <c:if
              test="${jobPosting.certificate.name != certificate.name}">
              <option value="${certificate.certificateNumber}"
                selected="selected">${certificate.name}</option>
            </c:if>
          </c:forEach>
            </select>
            <div class="input-group-append">
              <label class="input-group-text label label-outline-secondary" for="inputGroupSelect04" >자격증</label>
            </div>
          </div>
			<!------------------------------------------/자격증-------------------------------------------------->
			<!-----------------------------------------전공----------------------------------------------------->
			 <div class="input-group mb-3 ml-1">
            <select class="custom-select" id="inputGroupSelect05"
              name="major.majorNumber">
             <c:forEach items="${majors}" var="major">
            <c:if test="${jobPosting.major.name == major.name}">
              <option value="${major.majorNumber}"
                selected="selected">${major.name}</option>
            </c:if>
            <c:if test="${jobPosting.major.name != major.name}">
            <option value="${major.majorNumber}"
                selected="selected">${major.name}</option>
            </c:if>
          </c:forEach>
            </select>
            <div class="input-group-append">
              <label class="input-group-text label label-outline-secondary" for="inputGroupSelect05" >요구전공</label>
            </div>
          </div>
			<!-----------------------------------------/전공---------------------------------------------------->
			<!-----------------------------------------내용----------------------------------------------------->
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

			<!-----------------------------------------/내용---------------------------------------------------->
			<!-----------------------------------------경력----------------------------------------------------->			
			<div class="form-label-group mb-3">
  <select id="minimumCareer" class="form-control" name='minimumCareer'>
    <option value="무관">무관</option>
    <option value="신입">신입</option>
    <option value="신입, 경력">신입, 경력</option>
    <option value="경력(1년 이상)">경력(1년 이상)</option>
    <option value="경력(2년 이상)">경력(2년 이상)</option>
    <option value="경력(3년 이상)">경력(3년 이상)</option>
    <option value="경력(5년 이상)">경력(5년 이상)</option>
    <option value="경력(7년 이상)">경력(7년 이상)</option>
    <option value="경력(10년 이상)">경력(10년 이상)</option>
    <option value="신입, 경력(1년 이상)">신입, 경력(1년 이상)</option>
    <option value="신입, 경력(2년 이상)">신입, 경력(2년 이상)</option>
    <option value="신입, 경력(3년 이상)">신입, 경력(3년 이상)</option>
    <option value="신입, 경력(5년 이상)">신입, 경력(5년 이상)</option>
    <option value="신입, 경력(7년 이상)">신입, 경력(7년 이상)</option>
    <option value="신입, 경력(10년 이상)">신입, 경력(10년 이상)</option>
  </select>
  <label for="select_options2">* 경력 구분을 선택하지 않으면 기본값은 '무관'입니다.</label>
</div>
			<!-----------------------------------------/경력----------------------------------------------------->
			<!-----------------------------------------직무----------------------------------------------------->
			<div class="col-sm-13">
				직무* <input placeholder="직무" id="job" name='job' type='text'
					class="form-control" value='${jobPosting.job}' /> <label for="job"></label>
			</div>
			<!-----------------------------------------/직무---------------------------------------------------->
			<!----------------------------------------시작일----------------------------------------------------->
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
			<!---------------------------------------/시작일----------------------------------------------------->
			<!---------------------------------------마감일------------------------------------------------------>
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
			<!--------------------------------------/마감일------------------------------------------------------>
			<!---------------------------------------이미지------------------------------------------------------>
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
			<!--------------------------------------/이미지------------------------------------------------------>
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
