<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="middle" class="flex-fill">
  <section class="rounded mb-3 ">
    <div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom">
      <strong> 신고 처리 </strong>
      <small class="fs--11 text-muted d-block mt-1">
               사용자가 신고한 내역입니다. </small>
    </div>
    
      <div class="col-12">
      <div class="table-responsive">
        <table class="table table-align-middle border-bottom mb-3">
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
        <div class="border mb-3 p-3" style="min-height: 300px;">
          <p style="white-space: pre-wrap;">${report.content}</p>
        </div>

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
        <div class="text-center">
          <button type="button"
            class="btn btn-sm btn-outline-primary btn-pill"
            onClick='location.href="/portfoli/admin/report/replyForm?number=${report.number}"'>
            <i class="fi fi-arrow-right-3"></i> 답변
          </button>
          <button type="button"
            class="btn btn-sm btn-outline-secondary btn-pill"
            onClick='location.href="/portfoli/admin/report/list"'> 뒤로
          </button>
        </div>
    </div>
    <br>
</div>
</section>
</div>