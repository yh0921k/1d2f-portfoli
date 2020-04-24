<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>공고 상세정보</h1>

<c:if test="${not empty jobPosting}">
공고번호: ${jobPosting.jobPostingNumber}<br>
공고제목: ${jobPosting.title}<br>
내용: ${jobPosting.content}<br>
최소경력: ${jobPosting.minimumCareer}<br>
직무: ${jobPosting.job}<br>
연봉: ${jobPosting.yearSalary}<br>
시작일: ${jobPosting.startDated}<br>
마감일: ${jobPosting.endDated}<br>
조회수: ${jobPosting.viewCount}<br>

<hr>
  
<p>
<c:forEach items="${jobPosting.files}" var="jobPostingFile">
<img src="${pageContext.servletContext.contextPath}/upload/jobposting/${jobPostingFile.filePath}" height="80">
</c:forEach>
</p>



<p>
<a href='updateForm?no=${jobPosting.jobPostingNumber}'>수정</a>
<a href='delete?no=${jobPosting.jobPostingNumber}'>삭제</a>
</p>

</c:if>

<c:if test="${empty jobPosting}">
<p>해당 공고가 없습니다.</p>
</c:if>

<jsp:include page="../footer.jsp"/>
    