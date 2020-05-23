<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="middle" class="flex-fill">
	<section class="rounded mb-3 ">
		<div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom">
			<strong>Qna</strong>
		</div>
		<div id="rand_yjK_wrapper" class="dataTables_wrapper dt-bootstrap4">
			<div class="row mb-3">

				<div
					class="col-sm-12 col-md-6 d-flex align-items-center justify-content-end">
					<div class="dt-buttons btn-group flex-wrap"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<table id="logTable"
						class="table-datatable table table-bordered table-hover table-striped js-datatableified dataTable dtr-inline"
						data-lng-empty="No data available in table"
						data-lng-page-info="Showing _START_ to _END_ of _TOTAL_ entries"
						data-lng-filtered="(filtered from _MAX_ total entries)"
						data-lng-loading="Loading..." data-lng-processing="Processing..."
						data-lng-search="Search..."
						data-lng-norecords="No matching records found"
						data-lng-sort-ascending=": activate to sort column ascending"
						data-lng-sort-descending=": activate to sort column descending"
						data-lng-column-visibility="Column Visibility" data-lng-csv="CSV"
						data-lng-pdf="PDF" data-lng-xls="XLS" data-lng-copy="Copy"
						data-lng-print="Print" data-lng-all="All" data-main-search="true"
						data-column-search="false" data-row-reorder="false"
						data-col-reorder="true" data-responsive="true"
						data-header-fixed="true" data-select-onclick="true"
						data-enable-paging="true" data-enable-col-sorting="true"
						data-autofill="false" data-group="false" data-items-per-page="10"
						data-lng-export="<i class='fi fi-squared-dots fs--18 line-height-1'></i>"
						dara-export-pdf-disable-mobile="true"
						data-export="[&quot;csv&quot;, &quot;pdf&quot;, &quot;xls&quot;]"
						data-options="[&quot;copy&quot;, &quot;print&quot;]" id="rand_yjK"
						role="grid" aria-describedby="rand_yjK_info"
						style="width: 1168px;">

						<thead>
							<tr role="row">
								<th class="sorting_asc" tabindex="0" aria-controls="rand_yjK"
									rowspan="1" colspan="1" data-column-index="0"
									style="width: 100px;" aria-sort="ascending"
									aria-label="Date: activate to sort column descending">카테고리</th>
								<th class="sorting" tabindex="0" aria-controls="rand_yjK"
									rowspan="1" colspan="1" data-column-index="1"
									style="width: 300px;" aria-sort="ascending"
									aria-label="Date: activate to sort column descending">제목</th>
								<th class="sorting" tabindex="0" aria-controls="rand_yjK"
									rowspan="1" colspan="1" data-column-index="2"
									style="width: 100px;"
									aria-label="IP Address: activate to sort column ascending">작성자</th>
								<th class="sorting" tabindex="0" aria-controls="rand_yjK"
									rowspan="1" colspan="1" data-column-index="3"
									style="width: 100px;"
									aria-label="IP Address: activate to sort column ascending">등록일</th>
								<th class="sorting" tabindex="0" aria-controls="rand_yjK"
									rowspan="1" colspan="1" data-column-index="4"
									style="width: 50px;"
									aria-label="IP Address: activate to sort column ascending">조회수</th>
							</tr>
						</thead>

						<tbody id="item_list">
							<c:forEach items="${qnas}" var="qna">
								<tr>
									<td>${qna.category.name}</td>
									<td><a href="/portfoli/admin/qna/detail?no=${qna.number}"
										data-href="/portfoli/admin/qna/detail?no=${qna.number}"
										data-ajax-modal-size="modal-xl"
										data-ajax-modal-centered="false"
										data-ajax-modal-callback-function=""
										data-ajax-modal-backdrop="" class="js-ajax-modal text-dark">${qna.title}</a></td>
									<td>${qna.writer}</td>
									<td>${qna.registeredDate}</td>
									<td>${qna.viewCount}</td>
								</tr>

							</c:forEach>
						</tbody>

					</table>
				</div>
			</div>
		</div>

		<!-- options and pagination -->
		<div class="row text-center-xs">

			<!-- pagination -->
			<div class="col-12 col-xl-7">
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
</div>
</section>
</div>