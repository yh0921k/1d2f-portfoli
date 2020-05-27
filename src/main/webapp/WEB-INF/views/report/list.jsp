<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid">
  <div class="row">
    <jsp:include page="navbar.jsp"/>

    <div class="portlet mt--20" style="width: 65%;">

      <div class="portlet-header">
        <h1 class="d-none d-lg-block m--3">내 신고내역</h1>
      </div>
      <br><br>

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
                <td>
                  <c:choose>
                  <c:when test="${report.reStep == 0}"> [${report.reportCategory.category}] &nbsp; </c:when> 
                  <c:when test="${report.reStep > 0}"> &nbsp; &nbsp; &nbsp; </c:when> 
                  </c:choose>
                  <a href="/portfoli/app/report/detail?number=${report.number}"
                    class="text-gray-900"> ${report.title} </a>
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