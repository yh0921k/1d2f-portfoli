<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<div id="middle" class="flex-fill">
	<section class="rounded mb-3 ">
		<div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom">
			<strong>결제 내역</strong>
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
						style="font-size:0.85rem;">

						<thead>
							<tr role="row">
								<th class="sorting_asc" tabindex="0" aria-controls="rand_yjK"
									rowspan="1" colspan="1" data-column-index="0"
									style="width: 30px;" aria-sort="ascending"
									aria-label="Date: activate to sort column descending">주문번호</th>
								<th class="sorting" tabindex="0" aria-controls="rand_yjK"
                  rowspan="1" colspan="1" data-column-index="1"
                  style="width: 40px;"
                  aria-label="IP Address: activate to sort column ascending">회원ID<br>(이름)</th>
								<th class="sorting" tabindex="0" aria-controls="rand_yjK"
									rowspan="1" colspan="1" data-column-index="2"
									style="width: 150px;" aria-sort="ascending"
									aria-label="Date: activate to sort column descending">상품명</th>
								<th class="sorting" tabindex="0" aria-controls="rand_yjK"
									rowspan="1" colspan="1" data-column-index="3"
									style="text-align:center; width: 25px;"
									aria-label="IP Address: activate to sort column ascending">가격</th>
								<th class="sorting" tabindex="0" aria-controls="rand_yjK"
									rowspan="1" colspan="1" data-column-index="4"
									style="width: 170px;"
									aria-label="IP Address: activate to sort column ascending">적용공고</th>
								<th class="sorting" tabindex="0" aria-controls="rand_yjK"
                  rowspan="1" colspan="1" data-column-index="5"
                  style="width: 70px;"
                  aria-label="IP Address: activate to sort column ascending">결제수단</th>
                <th class="sorting" tabindex="0" aria-controls="rand_yjK"
                  rowspan="1" colspan="1" data-column-index="6"
                  style="width: 100px;"
                  aria-label="IP Address: activate to sort column ascending">상세내역</th>
								<th class="sorting" tabindex="0" aria-controls="rand_yjK"
									rowspan="1" colspan="1" data-column-index="7"
									style="width: 50px;"
									aria-label="IP Address: activate to sort column ascending">결제일</th>
                <th class="sorting" tabindex="0" aria-controls="rand_yjK"
                  rowspan="1" colspan="1" data-column-index="8"
                  style="width: 50px;text-align:center;"
                  aria-label="IP Address: activate to sort column ascending">적용일</th>
							</tr>
						</thead>

						<tbody id="item_list">
							<c:forEach items="${payments}" var="payment">

              <c:set value="${payment.comment}" var="paymentText"/>
              <c:set value="${fn:substring(paymentText, 0, 20)}" var="paymentFront"/>
              <c:set value="${fn:substring(paymentText, 20, 70)}" var="paymentBack"/>
								<tr>
									<td>${payment.number}</td>
									<td>${payment.member.id}<br>(${payment.member.name})</td>
									<td>${payment.productName}</td>
									<td style="text-align:center"><fmt:formatNumber value="${payment.price}" pattern="#,###" /></td>
									<td>${payment.jobPostingTitle}</td>
									<td>${payment.method}</td>
									<td>${paymentFront}<br>${paymentBack}</td>
									<td>${payment.payDate}</td>
									<td style="text-align:center">${payment.startDate} ~<br> ${payment.endDate}</td>
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
								href="/portfoli/admin/payment/list?pageNumber=${startPage - 1}"
								tabindex="-1" aria-disabled="true">Prev</a></li>
						</c:if>

						<c:forEach begin="${startPage}" end="${endPage}" var="page">
							<li
								<c:if test="${page == pageNumber}"> class="page-item active"</c:if>
								data-page="${page}"><a class="page-link"
								href="/portfoli/admin/payment/list?pageNumber=${page}">${page}</a></li>
						</c:forEach>

						<li
							<c:if test="${endPage == totalPage}"> class="page-item disabled btn-pill"</c:if>
							<c:if test="${endPage < totalPage}"> class="page-item"</c:if>
							data-page="next"><a class="page-link"
							href="/portfoli/admin/payment/list?pageNumber=${endPage + 1}">Next</a>
						</li>
					</ul>
				</nav>

				<!-- pagination -->
			</div>
		</div>
		<!-- /options and pagination -->
</section>
</div>

<style>
.table > thead > tr > th {vertical-align:middle;}
.table > tbody > tr > td {vertical-align:middle;}

</style>