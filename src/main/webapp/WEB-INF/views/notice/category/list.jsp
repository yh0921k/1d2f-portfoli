<%@page import="java.util.List"%>
<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <%--상단 바부분 : 필요없어서 뺌 
			<!-- PAGE TITLE -->
			<section class="bg-white">
				<div class="container py-1">

					<h1 class="h2">
						고객센터
					</h1>

					<nav aria-label="breadcrumb">
						<ol class="breadcrumb fs--14">
							<li class="breadcrumb-item"><a href="../../">portfoli</a></li>
							<li class="breadcrumb-item active" aria-current="page"><a href="list">고객센터</a></li>
						</ol>
					</nav>

				</div>
			</section>
			<!-- /PAGE TITLE -->
      --%>

			<!-- FAQ -->
			<section>
				<div class="container">

					<div class="row">

					<%--왼쪽 noticebar부분 : 필요없어서 뺌
					<jsp:include page="sidebar.jsp" />
					 --%>
						
						<div class="col-12 col-lg-8">

							<!--
								.article-format class will add some slightly formattings for a good text visuals. 
								This is because most editors are not ready formatted for bootstrap
								Blog content should come inside this container, as it is from database!
								src/scss/_core/base/_typography.scss
							-->
							<div class="bg-white p-5 p-4-xl rounded-xl article-format">
							<h1 style="display:inline-block; position: relative;">공지사항 카테고리 관리</h1>
                <div style="width: 80%;" align="right">
                  <button onclick="location.href='form'">추가하기(+)</button>
                </div>
                <table border="1" style="width: 80%;" >
                <tbody>
                <tr style="background-color: #e8e8e8">
                  <td class="TD" width="25%" align="center">번호</td>
                  <td width="75%" align="center">카테고리명</td>
                </tr>
		            <c:forEach items="${list}" var="item">
		            <tr>
		              <td class="TD" align="center"><a href="detail?number=${item.categoryNumber}">${item.categoryNumber}</a></td>
		              <td align="center"><a href="detail?number=${item.categoryNumber}">${item.name}</a></td>
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
                
                <div align="center">
                    총 게시글 수 : ${pagination.listCnt} / 총 페이지 수 : ${pagination.pageCnt} / 현재 페이지 : ${pagination.curPage} / 현재 블럭 : ${pagination.curRange} / 총 블럭 수 : ${pagination.rangeCnt}
                </div>



							</div>

						</div>

					</div>

				</div>
			</section>
			<!-- /FAQ -->

  <style>
    .TD{padding: 10px 0px}
  </style>
  <script>
  function fn_paging(curPage) {
    location.href = "list?curPage=" + curPage;
    }
  </script>

