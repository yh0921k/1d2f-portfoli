<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp" />


<div class="container">
	<h1>채용공고등록</h1>
	<form action='add' id="form1" method='post'
		enctype='multipart/form-data'>

		
		<div class="col-sm-13">
		제목*  <input id="title" placeholder="제목" class="form-control" name='title'
				type='text'><br>
		</div>

		
		<div class="col-sm-13">
		내용*	<textarea id="content" placeholder="내용" class="form-control"
				name='content' rows='10' cols='60'></textarea>
		</div>
    <br>

		<div class="col-sm-13">
			<input id="minimumCareer" placeholder="최소경력(숫자만 입력가능)"
				name='minimumCareer' type='number' class="form-control"><br>
		</div>

		<div class="col-sm-13">
			<input placeholder="직무" id="job" name='job' type='text'
				class="form-control" /> <label for="job"></label>
		</div>

		<!-- 연봉(숫자만 입력가능): <input id="yearSalary" name='yearSalary' type='number' class="form-control">만원<br> -->
		시작일*<input id="startDated" name='startDated' type='date' class="form-control"><br>
		마감일*<input id="endDated" name='endDated' type='date' class="form-control"><br>
		이미지 첨부*<input id="jobPostingFiles" name='jobPostingFiles' type='file' class="form-control"><br>

		<button id="btn1" class="btn btn-primary btn-lg btn-block">등록</button>
</div>
</form>


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
	<!--
	var minimumCareer = document.querySelector("#minimumCareer");
	if (!regExp.test(minimumCareer.value)) {
		Swal.fire({
	          title: '최소경력은 필수 입력 항목입니다.',
	          icon: 'error',
	          confirmButtonText: '확인'
	        })
	    return false;
	  }
	-->
	<!--
	var job = document.querySelector("#job");
	if (job.value == "") {
		Swal.fire({
            title: '직무는 필수 입력 항목입니다.',
            icon: 'error',
            confirmButtonText: '확인'
          })
	      return false;
	    }
	-->
	<!--
	var yearSalary = document.querySelector("#yearSalary");
	if (!regExp.test(yearSalary.value)) {
		Swal.fire({
            title: '연봉은 필수 입력 항목입니다.',
            icon: 'error',
            confirmButtonText: '확인'
          })
	      return false;
	    }
	-->
	
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
