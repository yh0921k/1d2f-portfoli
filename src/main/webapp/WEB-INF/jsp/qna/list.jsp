<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../header.jsp" />

<section>
	<div class="container-fluid">
		<div class="row">
			<!--------------------------------------- nav bar ----------------------------------------------->

			<div class="col-lg-3 mb-5 h--600 border-right ml--20 mr-5">
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
					<h1 class="h1 pt-3 d-none d-lg-block ml-3">Customer</h1>
					<h1 class="h1 pb-3 d-none d-lg-block" style="margin-left: 120px;">Center</h1>
					<!-- navigation -->
					<ul id="nav_responsive" style="margin-top: 50px;"
						class="nav flex-column d-none d-lg-block font-weight-bold">

						<li class="h5 nav-item mb-2 ml-3"><a class="nav-link"
							href="/portfoli/app/notice/list"> <span
								class="px-2 d-inline-block"> 공지사항 </span>
						</a></li>

						<li class="h5 nav-item mb-2 ml-3"><a class="nav-link"
							href="/portfoli/app/faq/list"> <span
								class="px-2 d-inline-block"> FAQ </span>
						</a></li>

						<li class="h5 nav-item active mb-2 ml-3"><a class="nav-link"
							href="/portfoli/app/qna/list"> <span
								class="px-2 d-inline-block"> Q&A </span>
						</a></li>



					</ul>
				</nav>
				<!-- /CATEGORIES -->
			</div>

			<!--------------------------------------------- /nav bar ------------------------------------------------>

			<!-------------------------------------------- contents -------------------------------------------------->
			<div class="portlet" style="width: 65%;">

				<div class="portlet-header">
					<h1 class="d-none d-lg-block m--3">Q&A</h1>
					<div align="right">
						<a href="/portfoli/app/qna/add"><button type="button"
								class="btn btn-outline-secondary btn-pill btn-sm">문의하기</button></a>
					</div>
				</div>

				<div class="table-responsive rounded" style="min-height: 500px;">
					<table class="table m-0">
						<thead>
							<tr>
								<th class="b-0 w--200">카테고리</th>
								<th class="b-0">제목</th>
								<th class="b-0 w--100">작성자</th>
								<th class="b-0 w--150">등록일</th>
								<th class="b-0 w--100">조회수</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${qnas}" var="qna">
								<tr>
									<td>${qna.category.name}</td>
									<c:if test="${qna.readable == 1}">
									<td><a href="detail?no=${qna.number}" class="text-gray-900">${qna.title}</td>
									</c:if>
									<c:if test="${qna.readable == 0}">
									<td><a href="detail?no=${qna.number}" class="text-gray-900">${qna.title}<i class="fa fa-lock ml-3"></i></td>
									</c:if>
									<td>${qna.writer}</td>
									<td>${qna.registeredDate}</td>
									<td>${qna.viewCount}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
				<div class="col-12 col-xl-6">
					<nav aria-label="pagination">
						<ul
							class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">

							<c:if test="${page != startPage}">
								<li
									<c:if test="${pageNumber <= pageSize}"> class="page-item disabled btn-pill"</c:if>
									<c:if test="${pageNumber != '1'}"> class="page-item"</c:if>
									data-page="prev"><a class="page-link"
									href="/portfoli/app/qna/list?pageNumber=${startPage - 1}"
									tabindex="-1" aria-disabled="true">Prev</a></li>
							</c:if>

							<c:forEach begin="${startPage}" end="${endPage}" var="page">
								<li
									<c:if test="${page == pageNumber}"> class="page-item active"</c:if>
									data-page="${page}"><a class="page-link"
									href="/portfoli/app/qna/list?pageNumber=${page}">${page}</a></li>
							</c:forEach>

							<li
								<c:if test="${endPage == totalPage}"> class="page-item disabled btn-pill"</c:if>
								<c:if test="${endPage < totalPage}"> class="page-item"</c:if>
								data-page="next"><a class="page-link"
								href="/portfoli/app/qna/list?pageNumber=${endPage + 1}">Next</a>
							</li>
						</ul>
					</nav>
				</div>
				<!-------------------------------------------- /contents -------------------------------------------------->
			</div>
		</div>
</section>


<jsp:include page="../footer.jsp" />
