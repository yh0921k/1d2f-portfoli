<%@page import="java.util.List"%>
<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="middle" class="flex-fill">
  <section class="rounded mb-3 ">
    <div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom"><strong>공지사항</strong></div>
        <div id="rand_yjK_wrapper" class="dataTables_wrapper dt-bootstrap4">
        <div class="row mb-3">
        
        <div class="col-sm-12 col-md-6 d-flex align-items-center justify-content-end">
        <div class="dt-buttons btn-group flex-wrap">
        </div>
        </div>
        </div>
        <div align="right">
          <button class="btn btn-outline-secondary btn-pill btn-sm" 
                  onclick="location.href='form'">등록하기</button>
        </div>
        <div class="row">
        <div class="col-sm-12">
        <table id="logTable" class="table-datatable table table-bordered table-hover table-striped js-datatableified dataTable dtr-inline" data-lng-empty="No data available in table" data-lng-page-info="Showing _START_ to _END_ of _TOTAL_ entries" data-lng-filtered="(filtered from _MAX_ total entries)" data-lng-loading="Loading..." data-lng-processing="Processing..." data-lng-search="Search..." data-lng-norecords="No matching records found" data-lng-sort-ascending=": activate to sort column ascending" data-lng-sort-descending=": activate to sort column descending" data-lng-column-visibility="Column Visibility" data-lng-csv="CSV" data-lng-pdf="PDF" data-lng-xls="XLS" data-lng-copy="Copy" data-lng-print="Print" data-lng-all="All" data-main-search="true" data-column-search="false" data-row-reorder="false" data-col-reorder="true" data-responsive="true" data-header-fixed="true" data-select-onclick="true" data-enable-paging="true" data-enable-col-sorting="true" data-autofill="false" data-group="false" data-items-per-page="10" data-lng-export="<i class='fi fi-squared-dots fs--18 line-height-1'></i>" dara-export-pdf-disable-mobile="true" data-export="[&quot;csv&quot;, &quot;pdf&quot;, &quot;xls&quot;]" data-options="[&quot;copy&quot;, &quot;print&quot;]" id="rand_yjK" role="grid" aria-describedby="rand_yjK_info" style="width: 1168px;">
          <thead>
            <tr role="row">
            <th class="sorting_asc" tabindex="0" aria-controls="rand_yjK" rowspan="1" colspan="1" data-column-index="0" style="width: 150px;" aria-sort="ascending" aria-label="Date: activate to sort column descending">분류</th>
            <th class="sorting" tabindex="0" aria-controls="rand_yjK" rowspan="1" colspan="1" data-column-index="1" style="width: 150px;" aria-label="Time: activate to sort column ascending">제목</th>
            <th class="sorting" tabindex="0" aria-controls="rand_yjK" rowspan="1" colspan="1" data-column-index="2" style="width: 150px;" aria-label="IP Address: activate to sort column ascending">등록일</th>
            <th class="sorting" tabindex="0" aria-controls="rand_yjK" rowspan="1" colspan="1" data-column-index="3" style="width: 150px;" aria-label="User: activate to sort column ascending">조회수</th>
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

        </table></div></div>
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
      <c:if test="${pagination.curPage != pagination.rangeCnt && pagination.rangeCnt > 0}">
        <li class="page-item disabled btn-pill" data-page="next">
          <a class="page-link" onClick="fn_paging('${pagination.nextPage}')" href="#">Next</a> 
        </li>
      </c:if>
      <c:if test="${pagination.curPage == pagination.rangeCnt}"> 
        <li class="page-item" data-page="next">
          <a class="page-link" onClick="fn_paging('${pagination.nextPage}')" href="#">Next</a> 
        </li>
      </c:if>
    </ul>
   </nav>
  </div>
        <div class="row">

    </div>  
  </div>
</div>        
</section>
</div>
  <script>
  function fn_paging(curPage) {
    location.href = "list?curPage=" + curPage;
    }
  </script>
