<%@page import="java.util.List"%>
<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <jsp:include page="../header.jsp"/>

      <!-- PAGE TITLE -->
      <section class="bg-white" style="padding: 30px 0px;">
        <div class="container py-1">

          <h1 class="h2">
            포트폴리오 게시판
          </h1>

          <nav aria-label="breadcrumb">
            <ol class="breadcrumb fs--14">
              <li class="breadcrumb-item"><a href="../../">portfoli</a></li>
              <li class="breadcrumb-item active" aria-current="page"><a href="list">포트폴리오 게시판</a></li>
            </ol>
          </nav>

        </div>
      </section>
      <!-- /PAGE TITLE -->

<!-------------------------------------------- 컨텐츠부분 -------------------------------------------->
  <div align="center"> <button style="font-size: small" onclick="location.href='form'">글쓰기(+)</button>
<div class="row">
  <c:forEach items="${list}" var="item">
  <div class="col-12 col-lg-4 mb-4 cursor" style="max-width:300px; max-height:300px;" onclick="location.href='detail?number=${item.number}'">
    <c:if test="${item.thumbnail != null}">
      <div class="card b-0 shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 bg-cover overlay-dark overlay-opacity-4 text-white"
           style="background-image: url('../../upload/portfolio/${item.thumbnail}_300x300.jpg');">
    </c:if>
    <c:if test="${item.thumbnail == null}">
      <div class="card b-0 shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 bg-cover overlay-dark overlay-opacity-4 text-white" 
           style="background-image: url('../../resources/assets/images/background/black.png');">
    </c:if>
    
      <div class="card-body font-weight-light mt--60">

        <div class="d-table">
          <div class="d-table-cell align-bottom">

            <p>
              ${item.title}
            </p>
            <p class="text-warning fs--13">
              ${item.id}
            </p>

          </div>
        </div>

      </div>

      <div class="card-footer bg-transparent b-0">
        <hr class="border-light opacity-2">
        
        <span class="float-end fs--14 p-2">
          ${item.getRecommendedCount()}
        </span>

        <a href="#" class="btn btn-sm btn-warning opacity-8">
          ${item.getViewCount()}
        </a>
      </div>
      
      </div>
    </div>
    </c:forEach>
<!-------------------------------------------- 컨텐츠부분 -------------------------------------------->
<!-------------------------------------------- 페이징부분 -------------------------------------------->
<div class="col-12 col-xl-8">
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
</div>
<!-------------------------------------------- 페이징부분 -------------------------------------------->
  <script>
  function fn_paging(curPage) {
	  location.href = "list?curPage=" + curPage;
	  }
  </script>
  <style>
    .cursor {
      cursor: pointer;
    }
    .padding10_0{
      padding: 10px 0px;
    }
    .padding10_10{
      padding: 10px 10px;
    }
    .padding5_5{
      padding: 5px 5px;
    }
  </style>
      <jsp:include page="../footer.jsp"/>