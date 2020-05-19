<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../header.jsp" />

<div class="container-fluid">
  <div class="row">
    <!--------------------------------------- nav bar ----------------------------------------------->

    <div class="col-lg-3 mb-5 h--600 border-right ml--20 mr-5 mt--20">
      <!-- CATEGORIES -->
      <nav class="nav-deep nav-deep-light mb-2">
        <!-- mobile only -->
        <button
          class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
          data-target="#nav_responsive"
          data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
          <span class="group-icon px-2 py-2 float-start"> <i
            class="fi fi-bars-2"></i> <i class="fi fi-close"></i>
          </span> <span class="h5 py-2 m-0 float-start"> Customer Center </span>
        </button>

        <!-- desktop only -->
        <h3 class="h3 pt-3 pb-3 m-0 d-none d-lg-block ml-3">Customer
          Center</h3>
        <!-- navigation -->
        <ul id="nav_responsive"
          class="nav flex-column d-none d-lg-block font-weight-bold">

          <li class="nav-item mb-2"><a class="nav-link"
            href="/portfoli/app/notice/list"> <span
              class="px-2 d-inline-block"> 공지사항 </span>
          </a></li>

          <li class="nav-item mb-2"><a class="nav-link"
            href="/portfoli/app/faq/list"> <span
              class="px-2 d-inline-block"> FAQ </span>
          </a></li>

          <li class="nav-item mb-2"><a class="nav-link"
            href="/portfoli/app/qna/list"> <span
              class="px-2 d-inline-block"> Q&A </span>
          </a></li>

          <li class="nav-item active mb-2"><a class="nav-link"
            href="/portfoli/app/report/list"> <span
              class="px-2 d-inline-block"> 신고 </span>
          </a></li>

        </ul>
      </nav>
      <!-- /CATEGORIES -->
    </div>

    <!--------------------------------------------- /nav bar ------------------------------------------------>

    <!-------------------------------------------- contents -------------------------------------------------->
    <div class="portlet mt--20" style="width: 65%;">

      <div class="portlet-header">
        <span class="d-none d-lg-block m--3">내 신고내역</span>
      </div>

      <div class="table-responsive rounded" style="min-height: 500px;">
        <table class="table m-0">
          <thead>
            <tr>
              <th class="b-0">제목</th>
              <th class="b-0 w--150">등록일</th>
              <th class="b-0 w--100">조회수</th>
            </tr>
          </thead>

          <tbody>
            <c:forEach items="${list}" var="report">
              <tr>
                <td>[${report.reportCategory.category}] &nbsp;
                  <a href="/portfoli/app/list/detail?number=${report.number}"
                    class="text-gray-900"> ${report.title}
                </td>
                <td>${report.registeredDate}</td>
                <td>${report.viewCount}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>

      </div>
              <!-- pagination -->
              <div class="col-12 col-xl-6">
                <nav aria-label="pagination">
                  <ul
                    class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">

                    <c:if test="${page != startPage}">
                      <li
                        <c:if test="${pageNumber <= pageSize}"> class="page-item disabled btn-pill"</c:if>
                        <c:if test="${pageNumber != '1'}"> class="page-item"</c:if>
                        data-page="prev"><a class="page-link"
                        href="/portfoli/app/report/list?pageNumber=${startPage - 1}"
                        tabindex="-1" aria-disabled="true">Prev</a></li>
                    </c:if>

                    <c:forEach begin="${startPage}" end="${endPage}" var="page">
                      <li
                        <c:if test="${page == pageNumber}"> class="page-item active"</c:if>
                        data-page="${page}"><a class="page-link"
                        href="/portfoli/app/report/list?pageNumber=${page}">${page}</a>
                      </li>
                    </c:forEach>

                    <li
                      <c:if test="${endPage == totalPage}"> class="page-item disabled btn-pill"</c:if>
                      <c:if test="${endPage < totalPage}"> class="page-item"</c:if>
                      data-page="next"><a class="page-link"
                      href="/portfoli/app/report/list?pageNumber=${endPage + 1}">Next</a>
                    </li>
                  </ul>
                </nav>

                <!-- pagination -->
              </div>
      <!-------------------------------------------- /contents -------------------------------------------------->
    </div>
  </div>
</div>

<jsp:include page="../footer.jsp" />