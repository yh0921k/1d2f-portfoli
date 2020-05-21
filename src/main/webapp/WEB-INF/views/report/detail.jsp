<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container-fluid">
  <div class="row">
    <jsp:include page="navbar.jsp"/>

    <div class="portlet mt--20" style="width: 65%;">

      <div class="portlet-header">
        <h1 class="d-none d-lg-block m--3">내 신고내역</h1>
        <!-- 
        <div align="right" class="container-fluid">
          <a href="/portfoli/app/report/delete?number=${report.number}"><button type="button"
              class="btn btn-outline-secondary btn-pill btn-sm ml-2"> 삭제 </button></a>
        </div>
        -->
      </div>
      
      <div class="table-responsive rounded" style="min-height: 500px;">
        <table class="table m-0">
          <tr>
            <th scope="row">카테고리</th>
            <td>${report.reportCategory.category}</td>
          </tr>
          <tr>
            <th scope="row">신고 대상</th>
            <td>${report.member.id}</td>
          </tr>
          <tr>
            <th scope="row">작성일</th>
            <td><fmt:formatDate var="registeredDate"
              value="${report.registeredDate}" pattern="yyyy.MM.dd HH:mm:ss"/> ${registeredDate}
            </td>
          </tr>
          <tr>
            <th scope="row">제목</th>
            <td>${report.title}</td>
          </tr>
        </table>
        <div class="border m-3 p-3" style="min-height: 300px;">
          <p style="white-space: pre-wrap;">${report.content}</p>
        </div>
        <!-- 
        <c:forEach items="${report.attachments}" var="attachment">
        <div class="position-relative bg-white rounded">
          <span data-id="0" data-file-name="${attachment.fileName}"
            class="js-file-input-item d-inline-block position-relative overflow-hidden text-center show-hover-container shadow-md m-2 rounded float-start">
          <span class="js-file-input-preview-header text-white position-absolute w-100 top-0 left-0 right-0 clearfix overlay-dark overlay-opacity-2">
          <span class="text-truncate d-block fs--12 pl--5 pr--5"> ${attachment.fileName} </span> </span>
          <span class="js-file-input-preview-footer text-white position-absolute w-100 bottom-0 left-0 right-0 clearfix overlay-dark overlay-opacity-2">
            <a href="${pageContext.servletContext.contextPath}/upload/report/${attachment.filePath}"
              class="js-file-input-preview-footer text-white position-absolute w-100 bottom-0 left-0 right-0 clearfix overlay-dark overlay-opacity-2">
            </a> </span>
            <img width="300" height="200"
              src="${pageContext.servletContext.contextPath}/upload/report/${attachment.filePath}">
          </span>
          </div>
          </c:forEach> -->
        <table class="table m-0">
          <tr>
          <th scope="row">첨부파일</th>
          <td>
          <c:forEach items="${report.attachments}" var="attachment">
            <a href="${pageContext.servletContext.contextPath}/upload/report/${attachment.filePath}"
              target=”_blank”> ${attachment.fileName} </a> <br>
            </c:forEach>
          </td>
          </tr>
        </table>
          <!-- 
        <div class="text-center">
          <button type="button"
            class="btn btn-sm btn-outline-danger btn-pill"
            onClick='location.href="/portfoli/app/report/delete?number=${report.number}"'>
            <i class="fi fi-thrash"></i> 삭제
          </button>
          <button type="button"
            class="btn btn-sm btn-outline-secondary btn-pill"
            onClick='location.href="/portfoli/app/report/list"'> 뒤로
          </button>
        </div>
         -->
    </div>
    <br>
  </div>
  <!-------------------------------------------- /contents -------------------------------------------------->
</div>
</div>