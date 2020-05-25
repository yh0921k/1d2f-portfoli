 <%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid">
  <div class="row">
    <!--------------------------------------- nav bar ----------------------------------------------->
    <jsp:include page="../faq/navbar.jsp"/>
    <!--------------------------------------------- /nav bar ------------------------------------------------>
    
    <!-------------------------------------------- contents -------------------------------------------------->
    <div class="portlet mt--20" style="width: 65%;box-shadow: none;">

      <div class="portlet-header">
        <h1 class="d-none d-lg-block m--3">FAQ</h1>
      </div>
      <p class="text-gray-900 mb-1 ml-3">카테고리 : ${faq.category.name}</p>
      <p class="text-gray-900 mb-1 ml-3">작성일시 : ${faq.registeredDate}</p>
      <p class="text-gray-900 mb-1 ml-3">조회수 : ${faq.viewCount}</p>

      <p class="text-gray-900 mb-1 ml-3">제목 : ${faq.title}</p>

      <p class="text-gray-900 mb-1 ml-3">문의사항 :</p>
      <div class="border m-3 p-3" style="min-height: 150px;">
        <p style="white-space: pre-wrap;" class="text-gray-900">${faq.content}</p>
      </div>

      <p class="text-gray-900 mb-1 ml-3">답변 :</p>
      <div class="border m-3 p-3" style="min-height: 150px;">
        <p style="white-space: pre-wrap;" class="text-gray-900">${faq.answerContent}</p>
      </div>
    </div>
  </div>
  <!-------------------------------------------- /contents -------------------------------------------------->
</div>
