<%@page import="java.util.List"%>
<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid">
  <div class="row">
    <!--------------------------------------- nav bar --------------------------------------------->
    <jsp:include page="../faq/navbar.jsp"/>
    <!-------------------------------------- /nav bar --------------------------------------------->
    
    <!-------------------------------------------- contents --------------------------------------->
    <div class="portlet mt--20" style="width: 60%;box-shadow: none;">

      <div class="portlet-header">
        <h1 class="d-none d-lg-block m--3">FAQ</h1>
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
              <td><a class="text-gray-900" href="detail?number=${item.number}">${item.category.name}</a></td>
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
    
            <!-- prev부분 -->
       <c:if test="${pagination.curPage == 1}"> 
         <li class="page-item disabled btn-pill" data-page="prev">
         <a class="page-link" href="#" tabindex="-1" aria-disabled="true" onClick="fn_paging(1)">Prev</a></li>
       </c:if>
       <c:if test="${pagination.curPage != 1}"> 
         <li class="page-item" data-page="prev">
         <a class="page-link" href="#" tabindex="-1" aria-disabled="true" onClick="fn_paging('${pagination.prevPage}')">Prev</a></li>
       </c:if>
  
            <!-- 중간 numbering 부분 -->
      <c:forEach var="pageNum" begin="${pagination.startPage}" end="${pagination.endPage}">
        <c:if test="${pageNum == pagination.curPage}">
          <li class="page-item active" data-page="${pageNum}">
            <a class="page-link" href="list?curPage=${pageNum}">${pageNum}</a>
          </li>
        </c:if>
        <c:if test="${pageNum != pagination.curPage}">
          <li data-page="${pageNum}">
            <a class="page-link" href="list?curPage=${pageNum}">${pageNum}</a>
          </li>
        </c:if>
      </c:forEach>
      
            <!-- next 부분 -->
        <c:if test="${pagination.curPage < pagination.pageCnt}">
          <li class="page-item btn-pill" data-page="next">
            <a class="page-link" onClick="fn_paging('${pagination.nextPage}')" href="#">Next</a> 
          </li>
        </c:if>
        <c:if test="${pagination.curPage >= pagination.pageCnt}"> 
          <li class="page-item disabled btn-pill" data-page="next">
            <a class="page-link" href="#">Next</a> 
          </li>
          
        </c:if>
      </ul>
     </nav>
     </div>
    <!-------------------------------------------- 페이징부분 -------------------------------------------------->
	 </div>
	</div>
</div>
    <!-------------------------------------------- 페이징부분 -------------------------------------------------->

  <script>
  function fn_paging(curPage) {
    location.href = "list?curPage=" + curPage;
    }
  </script>
