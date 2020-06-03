<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid" style="padding: 50px 0px;">

	<div class="row">
	<!--------------------------------------- nav bar ----------------------------------------------->
    <jsp:include page="../member/sidebar.jsp"/>
    <!--------------------------------------------- /nav bar ------------------------------------------------>

		<c:if test="${not empty jobPosting}">

			<div class="container" style="width: 55%;">
				<h4>채용정보 변경</h4>
				<form action='update' method='post' enctype='multipart/form-data'>
					<input name='jobPostingNumber' type='hidden'
						value='${jobPosting.jobPostingNumber}'><br>

					<p>
						<span class="text-gray-900">제목 : </span> <input required
							id="title" type="text" value='${jobPosting.title}'
							class="form-label-group form-control-clean col-md-11 mt--5"
							name="title">
					</p>

					<!--------------------------------------------- 컨텐츠 ------------------------------------------------>

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
								class="custom-file-label" for="jobPostingFiles">파일을
								선택하세요</label>

						</div>
					</div>

					<div class="js-file-input-preview-single-container2 ml--n6 mr--n6">
						<!-- preview container -->
					</div>

					<div class="mt-1">
						<a href="#"
							class="hide js-file-upload-clear2 btn btn-light btn-sm"> 이미지
							삭제 </a>
					</div>
					<!--------------------------------------/이미지------------------------------------------------------>

					<!-------------------------------------------- /컨텐츠 ------------------------------------------------>
					<br> <br>
					<!---------------------------------------- [지원자격]------------------------------------------------>
					<br>
					<h3>지원자격</h3>
					<br> <br>
					<h5>기술</h5>
					<!-------------------------------------------분야--------------------------------------------------->
					<div class="input-group mb-3 ml-1">
						<select
							class="bs-select form-label-group form-control-clean col-md-5 mt--5"
							id="inputGroupSelect06" name="field.number">
							<c:forEach items="${fields}" var="field">
								<c:if test="${jobPosting.field.name == field.name}">
									<option value="${field.number}" selected="selected">${field.name}</option>
								</c:if>
								<c:if test="${jobPosting.field.name != field.name}">
									<option value="${field.number}">${field.name}</option>
								</c:if>
							</c:forEach>
						</select>
						</div>
						<!-------------------------------------------/분야-------------------------------------------------->
						<!-------------------------------------------기술--------------------------------------------------->
						<div class="input-group mb-3 ml-1">
							<select
								class="bs-select form-label-group form-control-clean col-md-5 mt--5"
								id="inputGroupSelect07" name="skill.number">
								<c:forEach items="${skills}" var="skill">
									<c:if test="${jobPosting.skill.name == skill.name}">
										<option value="${skill.number}" selected="selected">${skill.name}</option>
									</c:if>
									<c:if test="${jobPosting.skill.name != skill.name}">
										<option value="${skill.number}">${skill.name}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<!-------------------------------------------/기술-------------------------------------------------->
						<!-------------------------------------------자격증-------------------------------------------------->
						<div class="input-group mb-3 ml-1">
							<select
								class="bs-select form-label-group form-control-clean col-md-5 mt--5"
								id="inputGroupSelect04" name="certificate.certificateNumber">
								<c:forEach items="${certificates}" var="certificate">
									<c:if test="${jobPosting.certificate.name == certificate.name}">
										<option value="${certificate.certificateNumber}"
											selected="selected">${certificate.name}</option>
									</c:if>
									<c:if test="${jobPosting.certificate.name != certificate.name}">
										<option value="${certificate.certificateNumber}"
											selected="selected">${certificate.name}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<!------------------------------------------/자격증-------------------------------------------------->
						<br>
						<h5>학력 및 전공</h5>
						<!-----------------------------------------------학력----------------------------------------------->
						<div class="input-group mb-3 ml-1">
							<select
								class="bs-select form-label-group form-control-clean col-md-5 mt--5"
								id="inputGroupSelect03" name="finalEducation.educationNumber">
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
						</div>
						<!-------------------------------------------/학력-------------------------------------------------->
						<!-----------------------------------------전공----------------------------------------------------->
						<div class="input-group mb-3 ml-1">
							<select
								class="bs-select form-label-group form-control-clean col-md-5 mt--5"
								id="inputGroupSelect05" name="major.majorNumber">
								<c:forEach items="${majors}" var="major">
									<c:if test="${jobPosting.major.name == major.name}">
										<option value="${major.majorNumber}" selected="selected">${major.name}</option>
									</c:if>
									<c:if test="${jobPosting.major.name != major.name}">
										<option value="${major.majorNumber}" selected="selected">${major.name}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<!-----------------------------------------/전공---------------------------------------------------->

						<!---------------------------------------- [/지원자격]----------------------------------------------->
						<br>
						<br>

						<h3>근무조건</h3>
						<br>
						<!-------------------------------------------[근무조건]---------------------------------------------->

						<!-------------------------------------------고용형태------------------------------------------------>
						<div class="input-group mb-3 ml-1">
							<select
								class="bs-select form-label-group form-control-clean col-md-5 mt--5"
								id="inputGroupSelect01" name="employmentStatus.number">
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
						<!-------------------------------------------/고용형태----------------------------------------------->
						<!-------------------------------------------지역--------------------------------------------------->
						<div class="input-group mb-3 ml-1">
							<select
								class="bs-select form-label-group form-control-clean col-md-5 mt--5"
								id="inputGroupSelect02" name="district.districtNumber">
								<c:forEach items="${districts}" var="district">
									<c:if test="${jobPosting.district.name == district.name}">
										<option value="${district.districtNumber}" selected="selected">${district.name}</option>
									</c:if>
									<c:if test="${jobPosting.district.name != district.name}">
										<option value="${district.districtNumber}">${district.name}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<!-------------------------------------------/지역-------------------------------------------------->

						<!-------------------------------------------[/근무조건]---------------------------------------------->

						<!-----------------------------------------경력----------------------------------------------------->
						<div class="form-label-group mb-3 ml-1">
							<select id="minimumCareer"
								class="bs-select form-label-group form-control-clean col-md-5 mt--5"
								name='minimumCareer'>
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
						</div>
						<!-----------------------------------------/경력----------------------------------------------------->
					

					<!-----------------------------------------직무----------------------------------------------------->
					<div class="col-sm-13">
						<input placeholder="직무" id="job" name='job' type='text'
							class="form-control" value='${jobPosting.job}' /> <label
							for="job"></label>
					</div>
					<!-----------------------------------------/직무---------------------------------------------------->
					<br>
					<!------------------------------------------기업정보------------------------------------------------->
					<h3>기업정보</h3>
					<br>
					<!--------------------------------------------전화번호----------------------------------------------->
					<label for="select_options2">* 연락처는 필수 입력사항입니다.</label>
					<div class="col-md-5 mt--5">
						<input name='tel' placeholder="010-xxxx-xxxx" class="form-control"
							type='text' value='${jobPosting.tel}'><br>
					</div>
					<!-------------------------------------------/전화번호----------------------------------------------->

					<!-----------------------------------------/기업정보------------------------------------------------->
					<br>
					<h3>공고기간</h3>

					<!----------------------------------------시작일----------------------------------------------------->
					<div style="float: left; width: 48%; margin-right: 40px;">
						<br> 시작일* <input id="startDated" autocomplete="off"
							placeholder="시작일" type='text' name='startDated'
							class="form-control datepicker" value='${jobPosting.startDated}'
							data-today-highlight="true" data-layout-rounded="false"
							data-title="시작일" data-show-weeks="true"
							data-today-highlight="true" data-today-btn="true"
							data-clear-btn="false" data-autoclose="true"
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
					</div>
					<!---------------------------------------/시작일----------------------------------------------------->
					<!---------------------------------------마감일------------------------------------------------------>
					<div style="float: left; width: 48%;">
						<br> 마감일* <input id="endDated" autocomplete="off"
							placeholder="마감일" type='text' name='endDated'
							class="form-control datepicker" value='${jobPosting.endDated}'
							data-today-highlight="true" data-layout-rounded="false"
							data-title="마감일" data-show-weeks="true"
							data-today-highlight="true" data-today-btn="true"
							data-clear-btn="false" data-autoclose="true"
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
					</div>
					<!--------------------------------------/마감일------------------------------------------------------>

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

	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script>
	var cBtn = document.getElementById("cBtn");

	cBtn.onclick = function() {
		Swal.fire({
			title : '변경되었습니다.',
			icon : 'success',

			confirmButtonText : '확인'
		})
	};
</script>
