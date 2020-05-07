<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp" />

<h1>채용공고등록</h1>
<form action='add' id="form1" method='post'
	enctype='multipart/form-data'>
	공고제목: <input id="title" name='title' type='text'><br> 내용:<br>
	<textarea id="content" name='content' rows='5' cols='60'></textarea>
	<br> 최소경력: <input id="minimumCareer" name='minimumCareer'
		type='number'><br>

	<div class="form-label-group">
		직무: <input placeholder="직무" id="job" name='job' type='text'
			class="form-control" /> <label for="job"></label>
	</div>

	연봉: <input id="yearSalary" name='yearSalary' type='number'><br>
	시작일: <input id="startDated" name='startDated' type='date'><br>
	마감일: <input id="endDated" name='endDated' type='date'><br>
	<hr>
	사진: <input id="jobPostingFiles" name='jobPostingFiles' type='file'><br>
	사진: <input id="jobPostingFiles" name='jobPostingFiles' type='file'><br>
	<button id="btn1">등록</button>
</form>


<script>
"use strict"
document.querySelector("#form1").onsubmit = () => {	
	
	var title = document.querySelector("#title");
	if (title.value == "" || title.value.length < 4) {
		title.focus();
		alert("제목은 필수 입력 항목입니다.(4글자 이상)");
		return false;
	}
	
	var content = document.querySelector("#content");
	if (content.value == "") {
		content.focus();
	    alert("내용은 필수 입력 항목입니다.");
	      return false;
	    }
	
	var regExp = /^[0-9]+$/; //정수 유효성 검사코드
	
	var minimumCareer = document.querySelector("#minimumCareer");
	if (!regExp.test(minimumCareer.value)) {
		  alert("최소경력은 필수 입력 항목입니다.(숫자만 입력가능)");		  
	    return false;
	  }
	
	var job = document.querySelector("#job");
	if (job.value == "") {
	    window.alert("직무는 필수 입력 항목입니다.");
	      return false;
	    }
	
	var yearSalary = document.querySelector("#yearSalary");
	if (!regExp.test(yearSalary.value)) {
		alert("연봉은 필수 입력 항목입니다.(숫자만 입력가능)");      
	      return false;
	    }
	
	
	var startDated = document.querySelector("#startDated");
	if (startDated.value == "") {
	    window.alert("시작일은 필수 입력 항목입니다.");
	      return false;
	    }
	
	var endDated = document.querySelector("#endDated");
	if (endDated.value == "") {
	    window.alert("마감일은 필수 입력 항목입니다.");
	      return false;
	    }

	var jobPostingFiles = document.querySelector("#jobPostingFiles");
	if (jobPostingFiles.value == "") {
	      window.alert("최소 한장 이상의 사진을 등록해주세요.");
	        return false;
	      }	
	
	}
	
/*
	
	
	
	
	
	
	else if (content.value == "") {
		window.alert("필수 입력 항목이 비어 있습니다.");
	    return false;
	  }
	
	
	else if (job.value == "") {
		window.alert("필수 입력 항목이 비어 있습니다.");
	    return false;
	  }
		
	else if (startDated.value == "") {
		window.alert("필수 입력 항목이 비어 있습니다.");
	    return false;
	  }
	
	else if (endDated.value == "") {
		window.alert("필수 입력 항목이 비어 있습니다.");
	    return false;
	  }

}
	*/

</script>
<jsp:include page="../footer.jsp" />
