<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container-fluid" style="padding: 50px 0px;">

	<div class="row">
		<!--------------------------------------- nav bar ----------------------------------------------->
		<jsp:include page="../member/sidebar.jsp"/>
		<!--------------------------------------------- /nav bar ------------------------------------------------>

		<div class="container" style="width: 55%;">
			<h1>채용공고등록</h1>
			<form action='add' id="form1" method='post'
				enctype='multipart/form-data'>

				<p>
					<span class="text-gray-900">제목 : </span> <input required id="title"
						type="text" placeholder="제목을 적어주세요"
						class="form-label-group form-control-clean col-md-11 mt--5"
						name="title">
				</p>
				<!--------------------------------------------- 컨텐츠 ------------------------------------------------>

				<!---------------------------------------------내용------------------------------------------------->
				<textarea id="content" name='content' rows='10' cols='40'
					class="markdown-editor" autocomplete="off"
					data-toolbar='["bold", "italic", "strikethrough", "|", "heading-1", "heading-2", "heading-3", "|", "image", "link", "|", "unordered-list", "ordered-list", "quote", "|", "guide", "|", "preview"]'
					data-status='["autosave", "lines", "words", "cursor"]'
					data-autofocus="true" data-autosave="true"
					data-autosave-delay="1000"
					data-autosaved-ignore-if-content-present="true"
					data-min-height="500px" data-spellcheck="false"
					data-prompt-urls="true" data-lng-placeholder="내용은 필수입력항목입니다."
					data-lng-prompt-url="Type your URL:"></textarea>
				<!--------------------------------------------/내용------------------------------------------------->
				<!-----------------------------------------이미지---------------------------------------------------->
				<br>
				<div class="input-group">
					<div class="custom-file custom-file-primary">
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
							class="custom-file-label" for="jobPostingFiles">이미지 파일을
							선택하세요 * </label>
					</div>
				</div>

				<div class="js-file-input-preview-single-container2 ml--n6 mr--n6">
					<!-- preview container -->
				</div>

				<div class="mt-1">
					<a href="#" class="hide js-file-upload-clear2 btn btn-light btn-sm">
						이미지 삭제 </a>
				</div>
				<!----------------------------------------/이미지---------------------------------------------------->

				<!-------------------------------------------- /컨텐츠 ------------------------------------------------>
				<br> <br>
				<!---------------------------------------- [지원자격]------------------------------------------------>
				<br>
				<h3>지원자격</h3>
				<br> <br>
				<h5>기술</h5>
				<!--------------------------------------------분야-------------------------------------------------->
				<div class="input-group mb-3 ml-1">
					<select
						class="bs-select form-label-group form-control-clean col-md-5 mt--5"
						id="inputGroupSelect06" name="field.number">
						<c:forEach items="${fields}" var="field">
							<option value="${field.number}">${field.name}</option>
						</c:forEach>
					</select>
				</div>
				<!-------------------------------------------/분야-------------------------------------------------->
				<!--------------------------------------------기술-------------------------------------------------->
				<div class="input-group mb-3 ml-1">
					<select
						class="bs-select form-label-group form-control-clean col-md-5 mt--5"
						id="inputGroupSelect07" name="skill.number">
						<c:forEach items="${skills}" var="skill">
							<option value="${skill.number}">${skill.name}</option>
						</c:forEach>
					</select>
				</div>
				<!-------------------------------------------/기술-------------------------------------------------->
				<!----------------------------------------------자격증----------------------------------------------->
				<div class="input-group mb-3 ml-1">
					<select
						class="bs-select form-label-group form-control-clean col-md-5 mt--5"
						id="inputGroupSelect04" name="certificate.certificateNumber">
						<c:forEach items="${certificates}" var="certificate">
							<option value="${certificate.certificateNumber}">${certificate.name}</option>
						</c:forEach>
					</select>
				</div>
				<!---------------------------------------------/자격증----------------------------------------------->
				<br>
				<h5>학력 및 전공</h5>
				<!-----------------------------------------------학력----------------------------------------------->
				<div class="input-group mb-3 ml-1">
					<select
						class="bs-select form-label-group form-control-clean col-md-5 mt--5"
						id="inputGroupSelect03" name="finalEducation.educationNumber">
						<c:forEach items="${finalEducations}" var="finalEducation">
							<option value="${finalEducation.educationNumber}">${finalEducation.category}</option>
						</c:forEach>
					</select>
				</div>
				<!----------------------------------------------/학력----------------------------------------------->
				<!---------------------------------------------전공------------------------------------------------->
				<div class="input-group mb-3 ml-1">
					<select
						class="bs-select form-label-group form-control-clean col-md-5 mt--5"
						id="inputGroupSelect05" name="major.majorNumber">
						<c:forEach items="${majors}" var="major">
							<option value="${major.majorNumber}">${major.name}</option>
						</c:forEach>
					</select>
				</div>
				<!--------------------------------------------/전공------------------------------------------------->

				<!---------------------------------------- [/지원자격]----------------------------------------------->
				<br> <br>

				<h3>근무조건</h3>
				<br>
				<!-------------------------------------------[근무조건]---------------------------------------------->

				<!--------------------------------------------고용형태----------------------------------------------->
				<div class="input-group mb-3 ml-1">
					<select
						class="bs-select form-label-group form-control-clean col-md-5 mt--5"
						id="inputGroupSelect01" name="employmentStatus.number">
						<c:forEach items="${employmentStatus}" var="employmentStatus">
							<option value="${employmentStatus.number}">${employmentStatus.name}</option>
						</c:forEach>
					</select>
				</div>
				<!-------------------------------------------/고용형태----------------------------------------------->
				<!-----------------------------------------------지역----------------------------------------------->
				<div class="input-group mb-3 ml-1">
					<select
						class="bs-select form-label-group form-control-clean col-md-5 mt--5"
						id="inputGroupSelect02" name="district.districtNumber">
						<c:forEach items="${districts}" var="district">
							<option value="${district.districtNumber}">${district.name}</option>
						</c:forEach>
					</select>
				</div>
				<!----------------------------------------------/지역----------------------------------------------->

				<!-------------------------------------------[/근무조건]---------------------------------------------->

				<!--------------------------------------------경력-------------------------------------------------->
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
				<!-------------------------------------------/경력-------------------------------------------------->
				<!--------------------------------------------직무-------------------------------------------------->
				<div class="col-sm-13">
					직무* <input placeholder="직무" autocomplete="off" id="job" name='job'
						type='text' class="form-control" /> <label for="job"></label>
				</div>
				<!-------------------------------------------/직무-------------------------------------------------->
				<br>
				<!------------------------------------------기업정보------------------------------------------------->
				<h3>기업정보</h3>
				<br>
				<!-------------------------------------------전화번호------------------------------------------------->
				<label for="select_options2">* 연락처는 필수 입력사항입니다.</label>
				<div class="col-md-5 mt--5">
					<input id="tel" placeholder="010-xxxx-xxxx" autocomplete="off"
						class="form-control" name='tel' type='text'>

				</div>
				<!--------------------------------------------/전화번호----------------------------------------------->

				<!-----------------------------------------/기업정보------------------------------------------------->
				<br>
				<h3>공고기간</h3>

				<!-------------------------------------------시작일-------------------------------------------------->
				<div style="float: left; width: 48%; margin-right: 40px;">
					<br> 시작일* <input id="startDated" autocomplete="off"
						type='text' name='startDated' class="form-control datepicker"
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
				<!------------------------------------------/시작일-------------------------------------------------->
				<!------------------------------------------마감일--------------------------------------------------->
				<div style="float: left; width: 48%;">
					<br> 마감일* <input id="endDated" autocomplete="off" type='text'
						name='endDated' class="form-control datepicker"
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
				<!-----------------------------------------/마감일--------------------------------------------------->

				<div align="right" class="container-fluid">
					<button id="btn1"
						class="btn btn-outline-secondary btn-pill btn-sm mt-3">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
"use strict"

document.querySelector("#form1").onsubmit = () => {	
	
	var title = document.querySelector("#title");
	if (title.value == "") {
		title.focus();
		Swal.fire({
			  title: '제목은 필수 입력 항목입니다.',
			  icon: 'error',
			  confirmButtonText: '확인'
			})
		return false;
	}
	
	var regExp = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g; //핸드폰번호 유효성검사	
	
	var tel = document.querySelector("#tel");
	  if (!regExp.test(tel)) {
	    content.focus();
	    Swal.fire({
	          title: '입력형식이 올바르지 않습니다.',
	          icon: 'error',
	          confirmButtonText: '확인'
	        })
	        return false;
	      }
	
	var content = document.querySelector("#content");
	if (content.value == "") {
		content.focus();
		Swal.fire({
	        title: '내용은 필수 입력 항목입니다.',
	        icon: 'error',
	        confirmButtonText: '확인'
	      })
	      return false;
	    }
	
	var minimumCareer = document.querySelector("#minimumCareer");
	  if (minimumCareer.value == "") {
	    Swal.fire({
	            title: '최소경력은 필수 입력 항목입니다.',
	            icon: 'error',
	            confirmButtonText: '확인'
	          })
	      return false;
	    }
	  
	  var job = document.querySelector("#job");
	  if (job.value == "") {
	    Swal.fire({
	            title: '직무는 필수 입력 항목입니다.',
	            icon: 'error',
	            confirmButtonText: '확인'
	          })
	        return false;
	      }

	var startDated = document.querySelector("#startDated");
	if (startDated.value == "") {
		Swal.fire({
            title: '시작일은 필수 입력 항목입니다.',
            icon: 'error',
            confirmButtonText: '확인'
          })
	      return false;
	    }
	
	var endDated = document.querySelector("#endDated");
	if (endDated.value == "") {
		Swal.fire({
            title: '마감일은 필수 입력 항목입니다.',
            icon: 'error',
            confirmButtonText: '확인'
          })
	      return false;
	    }

	var jobPostingFiles = document.querySelector("#jobPostingFiles");
	if (jobPostingFiles.value == "") {
		Swal.fire({
            title: '최소 한장 이상의 사진을 등록해주세요.',
            icon: 'error',
            confirmButtonText: '확인'
          })
	        return false;
	      }	
	
	}
	
  var tag1 = document.getElementById("btn1");
  tag1.onclick = function() {
	  Swal.fire({
			  title: '공고가 등록되었습니다.',			  
			  icon: 'success'
	  })
  };

</script>
