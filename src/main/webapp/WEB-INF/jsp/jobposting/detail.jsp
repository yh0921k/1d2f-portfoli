<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>


<c:if test="${not empty jobPosting}">
<div class="container">
<hr>
<h2>${jobPosting.title}<br></h2><br>
<hr>
<h3>상세요강</h3>
<p>
<c:forEach items="${jobPosting.files}" var="jobPostingFile">
<img src="${pageContext.servletContext.contextPath}/upload/jobposting/${jobPostingFile.filePath}" width="100%" height="600">
</c:forEach>
</p>

${jobPosting.content}<br>
<hr>
시작일: ${jobPosting.startDated}<br>
마감일: ${jobPosting.endDated}<br>
<!-- 
최소경력: ${jobPosting.minimumCareer}<br>
직무: ${jobPosting.job}<br>
연봉: ${jobPosting.yearSalary}<br>
 -->
조회수: ${jobPosting.viewCount}<br>
<hr>
  
<c:if test="${not empty loginUser}">
<p>
<a href='updateForm?no=${jobPosting.jobPostingNumber}' class="btn btn-primary pull-right">수정</a>
<a href='delete?no=${jobPosting.jobPostingNumber}' id="delBtn" class="btn btn-primary pull-right">삭제</a>
</p>
</c:if>

</div>
</c:if>

<c:if test="${empty jobPosting}">
<p>해당 공고가 없습니다.</p>
</c:if>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script>
var delBtn = document.getElementById("delBtn");
delBtn.onclick = function() {
	Swal.fire({
        title: '삭제되었습니다.',
        icon: 'success',
        timer: 3000,
        confirmButtonText: '확인'
      })	
};

</script>

<jsp:include page="../footer.jsp"/>
    