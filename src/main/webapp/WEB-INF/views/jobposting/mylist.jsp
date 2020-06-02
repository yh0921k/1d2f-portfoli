<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid">

	<div class="row">		
  <!--------------------------------------- nav bar ----------------------------------------------->
    <div class="col-lg-3 mb-5 h--600 border-right ml--20 mt--20">

      <!-- CATEGORIES -->
      <nav class="nav-deep nav-deep-light mb-2">

        <!-- mobile only -->
        <button
          class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
          data-target="#nav_responsive"
          data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
          <span class="group-icon px-2 py-2 float-start"> <i
            class="fi fi-bars-2"></i> <i class="fi fi-close"></i></span> <span
            class="h5 py-2 m-0 float-start"> My Page </span>
        </button>

        <!-- desktop only -->
          <a href="/portfoli/app/member/companyMypage"
            style="cursor: pointer; text-decoration: none;"><h3 class="h3 pt-3 pb-3 m-0 d-none d-lg-block ml-3 text-dark">My Page</h3></a>
        <!-- navigation -->
        <ul id="nav_responsive"
          class="nav flex-column d-none d-lg-block font-weight-bold ">

          <!-- 내 정보 -->

          <li class="nav-item font-weight-bold"><a class="nav-link"
            href="#"> <span class="group-icon"><i
                class="fi fi-arrow-end"></i> <i class="fi fi-arrow-down"></i></span> <span
              class="px-2 d-inline-block active font-weight-bold"> 내 정보
            </span>
          </a> 
              <ul class="nav flex-column px-2 font-weight-bold">
                <li class="nav-item font-weight-bold"><a class="nav-link"
                  href="/portfoli/app/member/companyUpdate"> 내 정보 수정하기 </a></li>
              </ul>
          </li>

          <!-- 쪽지함 -->
          <li class="nav-item font-weight-bold"><a class="nav-link"
            href="#"> <span class="group-icon"><i
                class="fi fi-arrow-end"></i><i class="fi fi-arrow-down"></i></span> <span
              class="px-2 d-inline-block active font-weight-bold"> 쪽지함 </span>
          </a>

            <ul class="nav flex-column px-2 font-weight-bold">
              <li class="nav-item"><a class="nav-link"
                href="/portfoli/app/message/inbox"> 받은 쪽지함 </a></li>
              <li class="nav-item"><a class="nav-link"
                href="/portfoli/app/message/sent"> 보낸 쪽지함 </a></li>
            </ul></li>

            <!-- 상품 구매 내역 -->
            <li class="nav-item"><a class="nav-link"
              href="/portfoli/app/payment/list"> <i
                class="fi fi-arrow-end m-0 fs--12"></i><span
                class="px-2 d-inline-block"> 상품 구매 내역 </span></a></li>

            <!-- 공고 관리 -->
            <li class="nav-item"><a class="nav-link "
              href="/portfoli/app/jobposting/mylist"> <i
                class="fi fi-arrow-end m-0 fs--12"></i> <span
                class="px-2 d-inline-block"> 공고 관리 </span></a></li>

        </ul>

      </nav>
      <!-- /CATEGORIES -->

    </div>
    <!--------------------------------------------- /nav bar ------------------------------------------------>
		

		<!-------------------------------------------- 컨텐츠부분 -------------------------------------------->


		<div class="container mt--20"
			style="width: 70%; margin-left: 10px; overflow-x: hidden;">

			<h3 style="text-align: left">공고 관리</h3>
			<hr>

			<%-------------------------------------content----------------------------------%>
			<div>
				<table id="listTable" class="table table-striped table-hover">

					<thead>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
						<th>마감일</th>
						<th>조회수</th>
					</thead>

					<tbody>
						<c:forEach items="${myPostingList}" var="item" varStatus="status">
							<tr id="tList">
								<td>${item.jobPostingNumber}</td>
								<td><a href='detail?no=${item.jobPostingNumber}'>${item.title}</a></td>
								<td>${item.postingRegistration}</td>
								<td>${item.endDated}</td>
								<td>${item.viewCount}</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
			<hr>
			<c:if test="${RegistrationPossible== true}">
				<div style="text-align: right">
					<a href='form' class="btn btn-outline-dark btn-pill mb-1">글쓰기</a>
				</div>
			</c:if>
			<%------------------------------------content------------------------------------%>

			<br> <br> <br>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-2.2.1.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script>
	var tbody = document.querySelector("#listTable > tbody");

	$(document)
			.ready(
					function() {
						$("#keyword")
								.keyup(
										function() {
											var k = $(this).val();
											$("#listTable > tbody > tr").hide();

											var temp = $("#listTable > tbody > tr > td:nth-child(2n+1):contains('"
													+ k + "')");
											$(temp).parent().show();
										})

					})
</script>