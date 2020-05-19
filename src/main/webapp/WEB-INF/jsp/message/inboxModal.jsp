<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<input type="hidden" name="number" value="${message.number}">
<!-- Modal Header -->
<div class="modal-header">
  <h5 class="modal-title" id="exampleModalLabelMd">
    <i class="fi fi-envelope-2 text-muted"></i> <span
      class="d-inline-block pl-2 pr-2"> 쪽지 읽기 </span> </span>
  </h5>

  <button type="button" class="close" data-dismiss="modal"
    aria-label="Close">
    <span class="fi fi-close fs--18" aria-hidden="true"></span>
  </button>
</div>

<!-- Modal Content -->
<div class="modal-body p--10">
  <div class="container">
    <span class="d-block text-muted text-truncate font-weight-medium pt-1">
      보낸 사람: ${message.member.id}
    </span> <small class="d-block"> <fmt:formatDate var="sendDate"
        value="${message.sendDate}" pattern="yyyy.MM.dd HH:mm:ss" />
      ${sendDate}
    </small>
  </div>

  <div class="article-format container">
    <!-- MESSAGE -->
    <h5 class="mt-3 mb-4">${message.title}</h5>

    <p style="white-space:pre;">${message.content}</p>

    <c:forEach items="${message.files}" var="messageFile">
      <div
        class="position-relative bg-white shadow-md shadow-3d-hover transition-all-ease-50 transition-hover-top rounded">
        <span data-id="0" data-file-name="${messageFile.fileName}"
          class="js-file-input-item d-inline-block position-relative overflow-hidden text-center show-hover-container shadow-md m-2 rounded float-start">
          <span
          class="js-file-input-preview-header text-white position-absolute w-100 top-0 left-0 right-0 clearfix overlay-dark overlay-opacity-2">
            <span class="text-truncate d-block fs--12 pl--5 pr--5">
              ${messageFile.fileName} </span>
        </span> <span
          class="js-file-input-preview-footer text-white position-absolute w-100 bottom-0 left-0 right-0 clearfix overlay-dark overlay-opacity-2">
            <a
            href="${pageContext.servletContext.contextPath}/upload/message/${messageFile.filePath}"
            download
            class="js-file-input-preview-footer text-white position-absolute w-100 bottom-0 left-0 right-0 clearfix overlay-dark overlay-opacity-2">
              <span
              class="js-file-input-file-info-size text-truncate d-block fs--12 pl--5 pr--5">파일
                다운로드</span>
          </a>
        </span> <img width="150" height="100"
          src="${pageContext.servletContext.contextPath}/upload/message/${messageFile.filePath}">
        </span>
      </div>
    </c:forEach>
  </div>
</div>

<!-- Modal Footer -->
<div id="handle" class="clearfix container py-3 row-pill rounded mt-1">
  <div class="float-end">
    <a href="#"
      class="js-ajax-modal btn btn-sm btn-outline-success btn-pill"
      data-href="/portfoli/app/message/form?receiverNumber=${message.senderNumber}"
      data-ajax-modal-size="modal-md" data-ajax-modal-centered="true"
      data-ajax-modal-backdrop="static"> <i class="fi fi-arrow-right-3"></i>
      답장하기
    </a>
  </div>
</div>

<div class="bg-light border border-dashed rounded p--15 clearfix">
  <div class="clearfix"></div>
</div>