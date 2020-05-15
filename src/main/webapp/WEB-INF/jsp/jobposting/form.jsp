<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp" />


<div class="container">
	<h1>채용공고등록</h1>
	<form action='add' id="form1" method='post' enctype='multipart/form-data'>
		
		
		<div class="col-sm-13">
		<label for="title">제목 *</label>
		  <input id="title" placeholder="제목" autocomplete="off" class="form-control" name='title'
				type='text'><br>
		</div>

	<!-- 	
		<div class="col-sm-13">
		내용*	<textarea id="content" placeholder="내용" class="form-control"
				name='content' rows='10' cols='60'></textarea>
		</div>  
		-->
		
		<textarea id="content" name='content' rows='10' cols='40'  class="markdown-editor" 
		autocomplete="off"
  data-toolbar='["bold", "italic", "strikethrough", "|", "heading-1", "heading-2", "heading-3", "|", "image", "link", "|", "unordered-list", "ordered-list", "quote", "|", "guide", "|", "preview"]'
  data-status='["autosave", "lines", "words", "cursor"]' 

  data-autofocus="true" 
  data-autosave="true" 
  data-autosave-delay="1000" 
  data-autosaved-ignore-if-content-present="true" 

  data-min-height="500px" 
  data-spellcheck="false" 
  data-prompt-urls="true" 

  data-lng-placeholder="내용은 필수입력항목입니다." 
  data-lng-prompt-url="Type your URL:" 
></textarea>

    <br>

		<div class="col-sm-13">
		최소경력* <input id="minimumCareer" autocomplete="off" placeholder="최소경력(숫자만 입력가능)"
				name='minimumCareer' type='number' class="form-control"><br>
		</div>

		<div class="col-sm-13">
		직무* 	<input placeholder="직무" autocomplete="off" id="job" name='job' type='text'
				class="form-control" /> <label for="job"></label>
		</div>
	<br>	
	
	시작일* <input id="startDat ed" autocomplete="off" type='text' name='startDated'
	  class="form-control datepicker" 
	  data-today-highlight="true" 
	  data-layout-rounded="false" 
	  data-title="시작일" 
	  data-show-weeks="true" 
	  data-today-highlight="true" 
	  data-today-btn="true" 
	  data-clear-btn="false" 
	  data-autoclose="true" 
	  data-date-start="today" 
	  data-format="YYYY-MM-DD"
	  data-quick-locale='{
	    "days": ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
	    "daysShort": ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
	    "daysMin": ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
	    "months": ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
	    "monthsShort": ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
	    "today": "Today",
	    "clear": "Clear",
	    "titleFormat": "MM yyyy"}'>
  <br>  
  
	마감일* <input id="endDated" autocomplete="off" type='text' name='endDated' 
 class="form-control datepicker" 
 data-today-highlight="true" 
 data-layout-rounded="false" 
 data-title="마감일" 
 data-show-weeks="true" 
 data-today-highlight="true" 
 data-today-btn="true" 
 data-clear-btn="false" 
 data-autoclose="true" 
 data-date-start="today" 
 data-format="YYYY-MM-DD"
 data-quick-locale='{
   "days": ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
   "daysShort": ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
   "daysMin": ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
   "months": ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
   "monthsShort": ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
   "today": "Today",
   "clear": "Clear",
   "titleFormat": "MM yyyy"}'>
   
	<br>
	이미지 첨부*
	<div class="input-group">
  <div class="custom-file custom-file-primary">
     <input id="jobPostingFiles" name='jobPostingFiles'             
        type="file" 
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
        
        class="custom-file-input" 
        >
    
    <label class="custom-file-label" for="jobPostingFiles">파일을 선택하세요</label>

  </div>
</div>


<div class="js-file-input-preview-single-container2 ml--n6 mr--n6"><!-- preview container --></div>


<div class="mt-1">
  <a href="#" class="hide js-file-upload-clear2 btn btn-light btn-sm">
    이미지 삭제
  </a>
</div>
    
    
		<button id="btn1" class="btn btn-primary btn-lg btn-block">등록</button>
</form>
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
	
	var regExp = /^[0-9]+$/; //정수 유효성 검사코드
	
	var minimumCareer = document.querySelector("#minimumCareer");
	  if (!regExp.test(minimumCareer.value)) {
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
<jsp:include page="../footer.jsp" />
