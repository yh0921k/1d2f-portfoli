<%@page import="java.util.List"%>
<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <jsp:include page="../header.jsp"/>

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

          <li class="nav-item active mb-2"><a class="nav-link" href="/portfoli/app/notice/list"> <span class="px-2 d-inline-block"> 공지사항 </span>
          </a></li>

          <li class="nav-item mb-2"><a class="nav-link" href="/portfoli/app/faq/list"> <span class="px-2 d-inline-block"> FAQ </span>
          </a></li>

          <li class="nav-item mb-2"><a class="nav-link" href="/portfoli/app/qna/list"> <span class="px-2 d-inline-block"> Q&A </span>
          </a></li>
 


        </ul>
      </nav>
    </div>
    <!--------------------------------------------- /nav bar ------------------------------------------------>
    
    <!-------------------------------------------- contents -------------------------------------------------->
    <div class="portlet mt--20" style="width: 65%;">

      <div class="portlet-header">
        <h1 class="d-none d-lg-block m--3">공지사항</h1>
        <div align="right">
          <button class="btn btn-outline-secondary btn-pill btn-sm" 
                  onclick="location.href='form'">글쓰기(+)</button>
        </div>
      </div>

      <div class="table-responsive rounded" style="min-height: 500px;">

        <table class="table m-0">
          <thead>
            <tr>
              <th class="b-0 w--200" style="font-size: large">카테고리</th>
              <th class="b-0" style="font-size: large;">제목</th>
              <th class="b-0 w--150" style="font-size: large;">등록일</th>
              <th class="b-0 w--100" style="font-size: large;">조회수</th>
            </tr>
          </thead>
                
          <tbody>
            <c:forEach items="${list}" var="item">
            <tr>
              <td><a class="text-gray-900" href="detail?number=${item.number}">${item.categoryName}</a></td>
              <td><a class="text-gray-900" href="detail?number=${item.number}">${item.title}</a></td>
              <td><a class="text-gray-900" href="detail?number=${item.number}">${item.registeredDate}</a></td>
              <td><a class="text-gray-900" href="detail?number=${item.number}">${item.viewCount}</a></td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
        
      </div>
    <!-------------------------------------------- contents -------------------------------------------------->

    <!-------------------------------------------- 페이징부분 -------------------------------------------------->
<div class="col-12 col-xl-7">
 <nav aria-label="pagination">
   <ul class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">
   
   
  <li
     <c:if test="${pagination.curRange ne 1}"> class="page-item disabled btn-pill"</c:if>
     <c:if test="${pagination.curPage ne 1}"> class="page-item"</c:if>
     data-page="prev">

    <a class="page-link"
                href="/portfoli/app/notice/list?pageNumber=${startPage - 1}"
                tabindex="-1" aria-disabled="true" onClick="fn_paging('${pagination.prevPage}')">Prev</a></li>


    <c:forEach var="pageNum" begin="${pagination.startPage}" end="${pagination.endPage}">
      <li
        <c:if test="${pageNum eq pagination.curPage}">
        class="page-item active"
        </c:if>
        data-page="${pageNum}"><a class="page-link"
        href="/portfoli/app/notice/list?curPage=${pageNum}">${pageNum}</a></li>
    </c:forEach>
    
    
    <li
      <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}"> class="page-item disabled btn-pill"</c:if>
      <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}"> class="page-item"</c:if>
      data-page="next">
      <a class="page-link" onClick="fn_paging('${pagination.nextPage}')" href="/portfoli/app/notice/list?pageNumber=${endPage + 1}">Next</a>
    </li>
  </ul>
          
 </nav>
</div>
</div>
</div>
</div>
    <!-------------------------------------------- 페이징부분 -------------------------------------------------->

  <script>
  function fn_paging(curPage) {
    location.href = "list?curPage=" + curPage;
    }
  </script>
           
      <jsp:include page="../footer.jsp"/>