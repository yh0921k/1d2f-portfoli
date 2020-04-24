<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp"/>

<h1>채용공고등록</h1>
<form action='add' method='post' enctype='multipart/form-data'>
공고제목: <input name='title' type='text'><br>
내용:<br>
<textarea name='content' rows='5' cols='60'></textarea><br>
최소경력: <input name='minimumCareer' type='number'><br>
직무: <input name='job' type='text'><br>
연봉: <input name='yearSalary' type='number'><br>
시작일: <input name='startDated' type='date'><br>
마감일: <input name='endDated' type='date'><br>
<hr>
사진: <input name='jobPostingFiles' type='file'><br>
사진: <input name='jobPostingFiles' type='file'><br>
<button>등록</button>
</form>

<jsp:include page="../footer.jsp"/>
    