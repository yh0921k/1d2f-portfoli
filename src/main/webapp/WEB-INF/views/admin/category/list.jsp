<%@page import="java.util.List"%>
<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div id="middle" class="flex-fill">  
  <section class="rounded mb-3 ">
      <div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom">
        <strong>카테고리 설정</strong>
      </div>
  <div class="container">
    <div class="row">           
      <div class="col-12 col-lg-8">
        <div class="bg-white p-5 p-4-xl rounded-xl article-format">
          <div style="width: 80%;" align="left">
            <a class="js-ajax-modal btn btn-outline-secondary btn-pill btn-sm mb-1" 
            data-href="/portfoli/admin/category/form"
            data-ajax-modal-size="modal-md" data-ajax-modal-centered="true"
            data-ajax-modal-backdrop="static">추가</a>            
          </div>
          
          
          <table class="table table-hover">
             <thead>
               <tr>
                 <th scope="col">번호</th>
                 <th scope="col">카테고리</th>
               </tr>
             </thead>

             <tbody>
               <c:forEach items="${list}" var="item">
			          <tr>
			            <td class="TD"><a href="detail?number=${item.categoryNumber}">${item.categoryNumber}</a></td>
			            <td><a href="detail?number=${item.categoryNumber}">${item.name}</a></td>
			          </tr>
               </c:forEach>
             </tbody>
           </table>
          <br>
          
        <!-- 페이징 부분 -->
          <div align="center">
              <c:if test="${pagination.curRange ne 1}">
                  <a style="display:inline-block; margin:0px 5px;" href="#" onClick="fn_paging(1)">[처음]</a> 
              </c:if>
              <c:if test="${pagination.curPage ne 1}">
                  <a style="display:inline-block; margin:0px 5px;" href="#" onClick="fn_paging('${pagination.prevPage}')">[이전]</a> 
              </c:if>
              <c:forEach var="pageNum" begin="${pagination.startPage}" end="${pagination.endPage}">
                  <c:choose>
                      <c:when test="${pageNum eq  pagination.curPage}">
                          <div style="display:inline-block; font-weight: bold; margin:0px 5px;"><a href="#" onClick="fn_paging('${pageNum}')">${pageNum}</a></div> 
                      </c:when>
                      <c:otherwise>
                          <a style="display:inline-block; margin:0px 5px;" href="#" onClick="fn_paging('${pageNum}')">${pageNum}</a>
                      </c:otherwise>
                  </c:choose>
              </c:forEach>
              <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                  <a style="display:inline-block; margin:0px 5px;" href="#" onClick="fn_paging('${pagination.nextPage}')">[다음]</a> 
              </c:if>
              <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
                  <a style="display:inline-block; margin:0px 5px;" href="#" onClick="fn_paging('${pagination.pageCnt}')">[끝]</a> 
              </c:if>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>

<style>
  .TD{padding: 10px 0px}
</style>
<script>
function fn_paging(curPage) {
  location.href = "list?curPage=" + curPage;
  }
</script>

