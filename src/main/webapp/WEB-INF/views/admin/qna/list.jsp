<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="middle" class="flex-fill">
	<section class="rounded mb-3 ">
		<div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom">
			Qna <small class="fs--11 text-muted d-block mt-1">Qna 내역입니다.
			</small>
		</div>

		<div class="col-12 col-lg-9 col-xl-10 position-relative">
			<div class="portlet">
				<div class="portlet-body pt-0">

					<div class="table-responsive">
						<table class="table table-align-middle border-bottom mb-6">

							<thead>
								<tr class="text-muted fs--13">
									<th class="b-0 w--200">카테고리</th>
									<th class="b-0">제목</th>
									<th class="b-0 w--150">작성자</th>
									<th class="b-0 w--150">등록일</th>
									<th class="b-0 w--100">조회수</th>
								</tr>
							</thead>

							<tbody id="item_list">
								<c:forEach items="${qnas}" var="qna">

									<tr class="text-muted">
										<td>${qna.category.name}</td>
										<td><a href="/portfoli/admin/qna/detail?no=${qna.number}"
											data-href="/portfoli/admin/qna/detail?no=${qna.number}"
											data-ajax-modal-size="modal-xl"
											data-ajax-modal-centered="false"
											data-ajax-modal-callback-function=""
											data-ajax-modal-backdrop="" class="js-ajax-modal text-muted">${qna.title}</a></td>
										<td>${qna.writer}</td>
										<td>${qna.registeredDate}</td>
										<td>${qna.viewCount}</td>
									</tr>

								</c:forEach>
							</tbody>

						</table>
					</div>

					<!-- options and pagination -->
					<div class="row text-center-xs">

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
											href="/portfoli/admin/qna/list?pageNumber=${startPage - 1}"
											tabindex="-1" aria-disabled="true">Prev</a></li>
									</c:if>

									<c:forEach begin="${startPage}" end="${endPage}" var="page">
										<li
											<c:if test="${page == pageNumber}"> class="page-item active"</c:if>
											data-page="${page}"><a class="page-link"
											href="/portfoli/admin/qna/list?pageNumber=${page}">${page}</a></li>
									</c:forEach>

									<li
										<c:if test="${endPage == totalPage}"> class="page-item disabled btn-pill"</c:if>
										<c:if test="${endPage < totalPage}"> class="page-item"</c:if>
										data-page="next"><a class="page-link"
										href="/portfoli/admin/qna/list?pageNumber=${endPage + 1}">Next</a>
									</li>
								</ul>
							</nav>

							<!-- pagination -->
						</div>
					</div>
					<!-- /options and pagination -->

				</div>
			</div>
		</div>
	</section>
</div>