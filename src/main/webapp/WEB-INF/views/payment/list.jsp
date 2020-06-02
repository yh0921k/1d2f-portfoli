<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container-fluid">
  <div class="row">

  <!--------------------------------------- nav bar ----------------------------------------------->
<div class="col-lg-3 mb-5 h--600 border-right ml--20 mt--20">

			<!-- CATEGORIES -->
			<nav class="nav-deep nav-deep-light mb-2">

				<!-- mobile only -->
				<button class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none" data-target="#nav_responsive" data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
					<span class="group-icon px-2 py-2 float-start"> <i class="fi fi-bars-2"></i> <i class="fi fi-close"></i></span> <span class="h5 py-2 m-0 float-start"> My Page </span>
				</button>

				<!-- desktop only -->
					<a href="/portfoli/app/member/companyMypage" style="cursor:pointer; text-decoration: none;"><h3 class="h3 pt-3 pb-3 m-0 d-none d-lg-block ml-3 text-dark">My Page</h3></a>
				<!-- navigation -->
				<ul id="nav_responsive" class="nav flex-column d-none d-lg-block font-weight-bold ">

					<!-- 내 정보 -->
					
					<li class="nav-item font-weight-bold">
					<a class="nav-link" href="#"> 
					<span class="group-icon"><i class="fi fi-arrow-end"></i> <i class="fi fi-arrow-down"></i></span> 
					<span class="px-2 d-inline-block active font-weight-bold"> 내 정보 </span>
        	</a>
					
							<ul class="nav flex-column px-2 font-weight-bold">
								<li class="nav-item font-weight-bold"><a class="nav-link" href="/portfoli/app/member/companyUpdate"> 내 정보 수정하기 </a></li>
							</ul>
						</li>

					<!-- 쪽지함 -->
					<li class="nav-item font-weight-bold">
					<a class="nav-link" href="#"> 
					<span class="group-icon"><i class="fi fi-arrow-end"></i><i class="fi fi-arrow-down"></i></span> 
					<span class="px-2 d-inline-block font-weight-bold"> 쪽지함 </span>
					</a>

						<ul class="nav flex-column px-2 font-weight-bold">
							<li class="nav-item"><a class="nav-link" href="/portfoli/app/message/inbox"> 받은 쪽지함 </a></li>
							<li class="nav-item"><a class="nav-link" href="/portfoli/app/message/sent"> 보낸 쪽지함 </a></li>
						</ul>
						</li>
						
						<!-- 상품 구매 내역 -->
						<li class="nav-item active"><a class="nav-link" href="/portfoli/app/payment/list"> <i class="fi fi-arrow-end m-0 fs--12"></i><span class="px-2 d-inline-block"> 상품 구매 내역 </span></a></li>

						<!-- 공고 관리 -->
						<li class="nav-item"><a class="nav-link " href="/portfoli/app/jobposting/mylist"> <i class="fi fi-arrow-end m-0 fs--12"></i> <span class="px-2 d-inline-block"> 공고 관리 </span></a></li>

				</ul>

			</nav>
			<!-- /CATEGORIES -->

		</div>
    <!--------------------------------------------- /nav bar ------------------------------------------------>

  <div class="col-lg-8 mt--20" data-gfont="Nanum Gothic">
      <div id="middle" class="flex-fill">
        <div class="page-title bg-transparent b-0">
          <h1 class="h3 mt-3 mb-3 px-3" style="display: inline-block;">상품 구매 내역</h1>
          <h6 style="margin-left: 700px; display: inline-block;" onclick="location.href='/portfoli/app/qna/list'">결제 관련 문의</h6>
        </div>
      </div>

      <!-- payment list -->
      <div class="col-12 col-lg-9 col-xl-10 position-relative">
<c:forEach items="${payments}" var="payment">
    <div class="card h-100 border-light bl-0 br-0 bb-0 bw--2">
      <div class="card-body">
        <h5 id="date" class="card-title">${payment.payDate} &nbsp; <small class="text-muted">(주문번호: ${payment.number})</small></h5>
        <h6 class="card-title" style="font-weight: bold;">${payment.productName}</h6>
        <p>
          <small><span style="color: #263238; font-weight: bold;">${payment.jobPostingTitle}</span>
          <br> 사용 기간 : ${payment.startDate} ~ ${payment.endDate}
          <br> 결제 수단 : ${payment.method}
          <br> 승인 내역 : ${payment.comment}
          </small>
        </p>
      </div>
    </div>
</c:forEach>
<br><br>
              <!-- pagination -->
              <div class="col-12 col-xl-6 d-middle">
                <nav aria-label="pagination">
                  <ul
                    class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">

                    <c:if test="${page != startPage}">
                      <li
                        <c:if test="${pageNumber <= pageSize}"> class="page-item disabled btn-pill"</c:if>
                        <c:if test="${pageNumber != '1'}"> class="page-item"</c:if>
                        data-page="prev"><a class="page-link"
                        href="/portfoli/app/payment/list?pageNumber=${startPage - 1}"
                        tabindex="-1" aria-disabled="true">Prev</a></li>
                    </c:if>
                    
                    <c:forEach begin="${startPage}" end="${endPage}" var="page">
                      <li
                        <c:if test="${page == pageNumber}"> class="page-item active"</c:if>
                        data-page="${page}"><a class="page-link"
                        href="/portfoli/app/payment/list?pageNumber=${page}">${page}</a>
                      </li>
                    </c:forEach>

                      <li
                        <c:if test="${endPage == totalPage}"> class="page-item disabled btn-pill"</c:if>
                        <c:if test="${endPage < totalPage}"> class="page-item"</c:if>
                        data-page="next"><a class="page-link"
                        href="/portfoli/app/payment/list?pageNumber=${endPage + 1}">Next</a>
                      </li>
                  </ul>
                </nav>
                
                <!-- pagination -->
              </div>
      </div>
      <!-- /payment list -->

      </div>
    </div>
  </div>