<%@ page import="com.portfoli.domain.JobPosting"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
  <h1>검색 결과</h1>
  <table class="table table-striped table-hover">
  <thead>
    <th></th>
    <th>no</th>
    <th>고용형태</th>
    <th>제목</th>
    <th>내용</th>
    <th>등록일</th>
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
      <td>${item.postingRegistration}</td>
      <td>${item.viewCount}</td>
    </tr>
</c:forEach>
  </table>
  </div>
