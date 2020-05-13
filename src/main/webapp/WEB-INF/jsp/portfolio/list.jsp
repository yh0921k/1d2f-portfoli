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

      <!-- FAQ -->
      <section style="padding: 50px 0px;">
        <div class="container">

          <div class="row">

            <div class="col-12 col-lg-8">

              <!--
                .article-format class will add some slightly formattings for a good text visuals. 
                This is because most editors are not ready formatted for bootstrap
                Blog content should come inside this container, as it is from database!
                src/scss/_core/base/_typography.scss
              -->
              <div class="bg-white p-5 p-4-xl rounded-xl article-format">
              <button style="float: right; font-size: small" onclick="location.href='form'">글쓰기(+)</button>
                <table border='1' style="width: 100%">
                <tr style="background-color: #e8e8e8;">
                  <td class="padding10_0" width="15%" align="center">작성자</td>
                  <td class="padding10_0" width="55%" align="center">제  목</td>
                  <td class="padding10_0" width="15%" align="center">추천수</td>
                  <td class="padding10_0" width="15%" align="center">조회수</td>
                </tr>
                
            <c:forEach items="${list}" var="item">
            <tr>
              <td class="padding10_10"><a href="detail?number=${item.number}">${item.memberName}</a></td>
              <td class="padding10_10"><a href="detail?number=${item.number}">${item.title}</a></td>
              <td align="center"><a href="detail?number=${item.number}">${item.recommendedCount}</a></td>
              <td class="padding10_10"><a href="detail?number=${item.number}">${item.viewCount}</a></td>
            </tr>
            </c:forEach>
                
                </table>
                <br>
                
<%--
<div class="row">

  <div class="col-12 col-lg-4 mb-4">

    <!-- 
      overlay image area 
      .overlay-dark -or- overlay-light
      .overlay-opacity-[0-9]
    -->
    <div class="card b-0 shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 bg-cover overlay-dark overlay-opacity-4 text-white" style="background-image:url('../demo.files/images/unsplash/brooke-cagle-g1Kr4Ozfoac-unsplash.jpg')">

      <!-- lines, looks like through a glass -->
      <div class="absolute-full w-100 overflow-hidden">
        <img class="img-fluid" width="2000" height="2000" src="../assets/images/masks/shape-line-lense.svg" alt="...">
      </div>

      <div class="card-body font-weight-light mt--60">

        <div class="d-table">
          <div class="d-table-cell align-bottom">

            <img src="assets/images/logo/logo_light.svg" width="110" height="70" alt="...">

            <p>
              Some quick example text to build on the card title and make up the bulk of the card's content.
            </p>

            <p class="text-warning fs--13">
              FIGHTING TOGETHER FOR THE BETTER!
            </p>

          </div>
        </div>

      </div>
--%>


    <!-------------------------------------------- 페이징부분 -------------------------------------------------->
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
    <!-------------------------------------------- 페이징부분 -------------------------------------------------->

              </div>

            </div>

          </div>

        </div>
      </section>
      <!-- /FAQ -->

  <script>
  function fn_paging(curPage) {
	  location.href = "list?curPage=" + curPage;
	  }
  </script>
  <style>
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