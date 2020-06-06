<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container-fluid">
  <div class="row">

    <!--------------------------------------- nav bar ----------------------------------------------->
    <div class="col-lg-3 mb-5 h--600 border-right ml--20 mt--20">

      <!-- CATEGORIES -->
      <nav class="nav-deep nav-deep-light mb-2 ">

        <!-- mobile only -->
        <button
          class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
          data-target="#nav_responsive"
          data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
          <span class="group-icon px-2 py-2 float-start"> <i
            class="fi fi-bars-2"></i> <i class="fi fi-close"></i>
          </span> <span class="h5 py-2 m-0 float-start"> My Page </span>
        </button>

        <!-- desktop only -->
        <h3 class="h3 pt-3 pb-3 m-0 d-none d-lg-block ml-3">My Page</h3>


        <!-- navigation -->
        <ul id="nav_responsive"
          class="nav flex-column d-none d-lg-block font-weight-bold ">

          <li class="nav-item font-weight-bold"><a class="nav-link"
            href="#"> <span class="group-icon"> <i
                class="fi fi-arrow-end"></i> <i class="fi fi-arrow-down"></i>
            </span> <span class="px-2 d-inline-block active font-weight-bold">
                내 정보 </span>
          </a>

            <ul class="nav flex-column px-2 font-weight-bold">
              <li class="nav-item"><a class="nav-link"
                href="/portfoli/app/member/generalUpdate"> 내 정보 수정하기 </a></li>
              <li class="nav-item"><a class="nav-link" href="#"> 멤버쉽 </a></li>
            </ul></li>

          <li class="nav-item font-weight-bold active"><a
            class="nav-link" href="#"> <span class="group-icon"> <i
                class="fi fi-arrow-end"></i> <i class="fi fi-arrow-down"></i>
            </span> <span class="px-2 d-inline-block active font-weight-bold">
                쪽지함 </span>
          </a>

            <ul class="nav flex-column px-2 font-weight-bold">
              <li class="nav-item font-weight-bold active"><a
                class="nav-link" href="/portfoli/app/message/inbox"> 받은 쪽지함
              </a></li>
              <li class="nav-item font-weight-bold"><a class="nav-link"
                href="/portfoli/app/message/sent"> 보낸 쪽지함 </a></li>
            </ul></li>

            <!-- 일반회원 -->
            <c:if test="${loginUser.type == '1'}">
            
              <!-- 일정 -->
              <li class="nav-item"><a class="nav-link" href="/portfoli/app/calendar/calendar"> <i class="fi fi-arrow-end m-0 fs--12"></i> <span class="px-2 d-inline-block"> 일정 관리 </span></a></li>
              
              <!-- 포트폴리오 -->
              <li class="nav-item font-weight-bold">
                <a class="nav-link" href="#"> 
                <span class="group-icon"><i class="fi fi-arrow-end"></i><i class="fi fi-arrow-down"></i></span> 
                <span class="px-2 d-inline-block active font-weight-bold"> 내 포트폴리오 </span>
                </a>
              <ul class="nav flex-column px-2 font-weight-bold">
                <li class="nav-item"><a class="nav-link" href="/portfoli/app/portfolio/mylist"> 포트폴리오 관리 </a></li>
                <li class="nav-item"><a class="nav-link" href="/portfoli/app/portfolio/myRecommendedlist"> 내가 찜한 목록 </a></li>
              </ul>
              </li>
              
            </c:if>
            
            <!-- 기업회원 -->
            <c:if test="${loginUser.type == '2'}">
            
            <!-- 상품 구매 내역 -->
            <li class="nav-item"><a class="nav-link" href="/portfoli/app/payment/list"> <i class="fi fi-arrow-end m-0 fs--12"></i><span class="px-2 d-inline-block"> 상품 구매 내역 </span></a></li>

            <!-- 공고 관리 -->
            <li class="nav-item"><a class="nav-link " href="/portfoli/app/jobposting/mylist"> <i class="fi fi-arrow-end m-0 fs--12"></i> <span class="px-2 d-inline-block"> 공고 관리 </span></a></li>
            </c:if>

        </ul>
      </nav>

      <!-- /CATEGORIES -->
    </div>

    <!--------------------------------------------- /nav bar ------------------------------------------------>

    <div class="col-lg-8 mt--20">
      <div id="middle" class="flex-fill">
        <div class="page-title bg-transparent b-0">
          <h1 class="h3 mt-3 mb-3 px-3 font-weight-normal myfont myfont-md">받은 쪽지함</h1>
        </div>
      </div>

      <!-- message detail -->
      <div class="col-12 col-lg-9 col-xl-10 position-relative">

        <!-- portlet -->
        <div class="portlet">

          <!-- portlet : header -->
          <div class="portlet-header border-bottom">
            <div class="container">
              <div class="float-start">
                <span
                  class="d-block text-muted text-truncate font-weight-medium pt-2">
                  보낸 사람: ${message.member.id} &nbsp; 
                  <a href="#"
                  class="js-ajax-modal link-muted"
                  data-href="/portfoli/app/report/form?number=${message.senderNumber}"
                  data-ajax-modal-size="modal-md" data-ajax-modal-centered="true"
                  data-ajax-modal-backdrop="static"> 신고 
                  </a>
                </span> <small class="d-block"> <fmt:formatDate var="sendDate"
                    value="${message.sendDate}" pattern="yyyy.MM.dd HH:mm:ss" />
                  ${sendDate}
                </small>
              </div>
              <div class="float-end mt-1">
                <a href="#"
                  class="js-ajax-modal btn btn-sm btn-outline-success btn-pill"
                  data-href="/portfoli/app/message/form?receiverNumber=${message.senderNumber}"
                  data-ajax-modal-size="modal-md" data-ajax-modal-centered="true"
                  data-ajax-modal-backdrop="static"> <i
                  class="fi fi-arrow-right-3"></i> 답장하기
                </a> <a href="#"
                  data-href="/portfoli/app/message/inbox/delete?number=${message.number}"
                  class="js-ajax-confirm btn btn-sm btn-outline-danger btn-pill rounded-circle"
                  data-ajax-confirm-mode="ajax" data-ajax-confirm-method="GET"
                  data-ajax-confirm-size="modal-md"
                  data-ajax-confirm-centered="false"
                  data-ajax-confirm-title="쪽지 삭제"
                  data-ajax-confirm-body="쪽지를 삭제하시겠습니까?"
                  data-ajax-confirm-btn-yes-class="btn-sm btn-danger"
                  data-ajax-confirm-btn-yes-text="삭제"
                  data-ajax-confirm-btn-yes-icon="fi fi-check"
                  data-ajax-confirm-btn-no-class="btn-sm btn-light"
                  data-ajax-confirm-btn-no-text="닫기"
                  data-ajax-confirm-btn-no-icon="fi fi-close"
                  data-ajax-confirm-callback-function="deleteCallback"> <i
                  class="fi fi-thrash"></i>
                </a>
              </div>
            </div>
          </div>
          <!-- /portlet : header -->

          <!-- portlet : body -->
          <div class="portlet-body">

            <div class="article-format container">

              <!-- MESSAGE -->
              <h5 class="mt-3 mb-4">${message.title}</h5>

              <p style="white-space: pre;">${message.content}</p>
              <c:forEach items="${message.files}" var="messageFile">
                <div
                  class="position-relative bg-white rounded">
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
                        class="js-file-input-file-info-size text-truncate d-block fs--12 pl--5 pr--5">파일 다운로드</span>
                    </a>
                  </span> <img width="300" height="200"
                    src="${pageContext.servletContext.contextPath}/upload/message/${messageFile.filePath}">
                  </span>
                </div>
              </c:forEach>
            </div>
          </div>
          <!-- /portlet : body -->

        </div>
        <!-- /portlet -->

      </div>
      <!-- /message detail -->

    </div>
  </div>
</div>
<style>
  .myfont{
  	font-weight:bold!important;
  	text-align:left; 
  	margin-left:1rem;
  }
  .myfont-md{
  	font-size:1.5rem!important; 
  }
  .myfont-lg{
  	font-size:1.8rem!important; 
  }
  .myfont-sm{
  	font-size:1.2rem!important; 
  }
</style>
<script>
function deleteCallback() {
  location.href = "./";
}
</script>