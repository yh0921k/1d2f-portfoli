<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>


<c:if test="${not empty jobPosting}">

<div class="container">
<h1>공고 변경</h1>
<form action='update' method='post' enctype='multipart/form-data'>

<input name='no' readonly type='hidden' value='${jobPosting.jobPostingNumber}'><br>

<div class="col-sm-13">
제목* <input name='title' placeholder="제목" class="form-control" type='text' value='${jobPosting.title}'><br>
</div>

<div class="col-sm-13">
내용* <textarea name='content' class="form-control" rows='5' cols='60'>${jobPosting.content}</textarea><br>
</div>

<div class="col-sm-13">
<input name='minimumCareer' placeholder="최소경력(숫자만 입력가능)" type='number' class="form-control" value='${jobPosting.minimumCareer}'><br>
</div>

<div class="col-sm-13">
<input name='job' placeholder="직무" class="form-control" type='text' value='${jobPosting.job}'><br>
</div>


<!-- <input name='yearSalary' type='number' value='${jobPosting.yearSalary}'><br> -->
시작일<input name='startDated' type='date' class="form-control" value='${jobPosting.startDated}'><br>
마감일<input name='endDated' type='date' class="form-control" value='${jobPosting.endDated}'><br>

이미지 첨부<input name='jobPostingFiles' type='file' class="form-control"><br>

<p>
<button id="cBtn" class="btn btn-primary btn-lg btn-block">변경</button>
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

<jsp:include page="../footer.jsp"/>
    