<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>공고 변경</h1>

<c:if test="${not empty jobPosting}">
<form action='update' method='post' enctype='multipart/form-data'>
<input name='no' readonly type='hidden' value='${jobPosting.jobPostingNumber}'><br>
공고제목: <input name='title' type='text' value='${jobPosting.title}'><br>
내용:<br>
<textarea name='content' rows='5' cols='60'>${jobPosting.content}</textarea><br>
최소경력: <input name='minimumCareer' type='number' value='${jobPosting.minimumCareer}'><br>
직무: <input name='job' type='text' value='${jobPosting.job}'><br>
연봉: <input name='yearSalary' type='number' value='${jobPosting.yearSalary}'><br>
시작일: <input name='startDated' type='date' value='${jobPosting.startDated}'><br>
마감일: <input name='endDated' type='date' value='${jobPosting.endDated}'><br>

<hr>
사진: <input name='jobPostingFiles' type='file'><br>
사진: <input name='jobPostingFiles' type='file'><br>

<p>
<button>변경</button>

</p>
</form>
</c:if>

<c:if test="${empty jobPosting}">
<p>해당 게시글이 없습니다.</p>
</c:if>

<jsp:include page="../footer.jsp"/>
    