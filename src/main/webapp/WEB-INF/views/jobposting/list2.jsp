<%@ page import="com.portfoli.domain.JobPosting"%>
<%@ page import="com.portfoli.domain.JobPostingFile"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:forEach items="${list}" var="item" varStatus="status">
    <tr id="tList">
    <td><a href='detail?no=${item.jobPostingNumber}'><c:forEach items="${item.files}" var="jobPostingFile">
      <img src="../../upload/jobposting/${jobPostingFile.filePath}_300x300.jpg" width="100" height="100">
      </c:forEach></td>
      <td>${item.jobPostingNumber}</td>
      <td><a href='detail?no=${item.jobPostingNumber}'>${item.title}</a></td>
      <td>${item.startDated}</td>
      <td>${item.endDated}</td>
      <td>${item.viewCount}</td>
    </tr>
  </c:forEach>



