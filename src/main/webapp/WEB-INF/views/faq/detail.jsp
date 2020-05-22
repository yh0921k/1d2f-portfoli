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
    <div class="portlet mt--20" style="width: 65%;">

      <div class="portlet-header">
        <h1 class="d-none d-lg-block m--3">FAQ</h1>
        <div align="right" class="container-fluid">
          <a href="/portfoli/app/faq/updateForm?number=${faq.number}"><button type="button"
              class="btn btn-outline-secondary btn-pill btn-sm">수정</button></a> <a
            href="/portfoli/app/faq/delete?number=${faq.number}"><button
              type="button"
              class="btn btn-outline-secondary btn-pill btn-sm ml-2">삭제</button></a>
        </div>
      </div>
      <p class="text-gray-900 mb-1 ml-3">카테고리 : ${faq.category.name}</p>
      <p class="text-gray-900 mb-1 ml-3">작성일시 : ${faq.registeredDate}</p>
      <p class="text-gray-900 mb-1 ml-3">조회수 : ${faq.viewCount}</p>

      <p class="text-gray-900 mb-1 ml-3">제목 : ${faq.title}</p>

      <p class="text-gray-900 mb-1 ml-3">문의사항 :</p>
      <div class="border m-3 p-3" style="min-height: 300px;">
        <p style="white-space: pre-wrap;" class="text-gray-900">${faq.content}</p>
      </div>

      <p class="text-gray-900 mb-1 ml-3">답변 :</p>
      <div class="border m-3 p-3" style="min-height: 300px;">
        <p style="white-space: pre-wrap;" class="text-gray-900">${faq.answerContent}</p>
      </div>

      <div class="row">
        <label
          class="d-block mt-3 ml-3">
          <span>게시글 공개 여부 (</span>
          <c:if test="${faq.readable eq 1}">
          <input type="radio" name="readable" value='1' checked="checked">공개
          <input type="radio" name="readable" value='0'>비공개
          </c:if>
          <c:if test="${faq.readable eq 0}">
          <input type="radio" name="readable" value='1'>공개
          <input type="radio" name="readable" value='0' checked="checked">비공개
          </c:if>
          )
        </label>
      </div>

    </div>
  </div>
  <!-------------------------------------------- /contents -------------------------------------------------->
</div>
