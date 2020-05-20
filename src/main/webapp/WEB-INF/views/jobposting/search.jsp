<%@ page import="com.portfoli.domain.JobPosting"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<div class="container">
  <h1>검색 결과</h1>
  <table class="table table-striped table-hover">
  <thead>
    <th></th>
    <th>no</th>
    <th>고용형태</th>
    <th>제목</th>
    <th>내용</th>
    <!-- <th>최소경력</th> -->
    <!-- <th>직무</th> -->
    <!-- <th>연봉</th> -->
    <th>시작일</th>
    <th>마감일</th>
    <th>조회수</th>
  </thead>

<c:forEach items="${list}" var="item">
    <tr>
      <td><a href='detail?no=${item.jobPostingNumber}'><c:forEach items="${item.files}" var="jobPostingFile">
      <img src="../../upload/jobposting/${jobPostingFile.filePath}_300x300.jpg">
      </c:forEach></td>
      <td>${item.jobPostingNumber}</td> 
      <td>${item.employmentStatus.name}</td>
      <td><a href='detail?no=${item.jobPostingNumber}'>${item.title}</a></td> 
      <td>${item.content}</td>
      <!-- <td>${item.minimumCareer}</td>  -->
      <!-- <td>${item.job}</td> -->
      <!-- <td>${item.yearSalary}</td> -->
      <td>${item.startDated}</td>
      <td>${item.endDated}</td>
      <td>${item.viewCount}</td>
    </tr>
</c:forEach>
  </table>
  </div>

<jsp:include page="../footer.jsp"/>
