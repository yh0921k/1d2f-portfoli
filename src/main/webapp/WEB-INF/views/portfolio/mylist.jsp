<%@page import="java.util.List"%>
<%@page import="com.portfoli.domain.Notice"%>
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
				<button class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none" data-target="#nav_responsive" data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
					<span class="group-icon px-2 py-2 float-start"> <i class="fi fi-bars-2"></i> <i class="fi fi-close"></i></span> <span class="h5 py-2 m-0 float-start"> My Page </span>
				</button>

				<!-- desktop only -->
				<c:if test="${loginUser.type == '1'}">
					<a href="/portfoli/app/member/generalMypage" style="cursor:pointer; text-decoration: none;"><h3 class="h3 pt-3 pb-3 m-0 d-none d-lg-block ml-3 text-dark">My Page</h3></a>
				</c:if> 
				<c:if test="${loginUser.type == '2'}">
					<a href="/portfoli/app/member/companyMypage" style="cursor:pointer; text-decoration: none;"><h3 class="h3 pt-3 pb-3 m-0 d-none d-lg-block ml-3 text-dark">My Page</h3></a>
				</c:if>
				<!-- navigation -->
				<ul id="nav_responsive" class="nav flex-column d-none d-lg-block font-weight-bold ">

					<!-- 내 정보 -->
					
					<li class="nav-item font-weight-bold">
					<a class="nav-link" href="#"> 
					<span class="group-icon"><i class="fi fi-arrow-end"></i> <i class="fi fi-arrow-down"></i></span> 
					<span class="px-2 d-inline-block active font-weight-bold"> 내 정보 </span>
        	</a>
					
					<c:if test="${loginUser.type == '1'}">
							<ul class="nav flex-column px-2 font-weight-bold">
								<li class="nav-item font-weight-bold"><a class="nav-link" 	href="/portfoli/app/member/generalUpdate"> 내 정보 수정하기 </a></li>
							</ul>
						</c:if> 
						<c:if test="${loginUser.type == '2'}">
							<ul class="nav flex-column px-2 font-weight-bold">
								<li class="nav-item font-weight-bold"><a class="nav-link" href="/portfoli/app/member/companyUpdate"> 내 정보 수정하기 </a></li>
							</ul>
						</c:if>
						</li>

					<!-- 쪽지함 -->
					<li class="nav-item font-weight-bold">
					<a class="nav-link" href="#"> 
					<span class="group-icon"><i class="fi fi-arrow-end"></i><i class="fi fi-arrow-down"></i></span> 
					<span class="px-2 d-inline-block active font-weight-bold"> 쪽지함 </span>
					</a>

						<ul class="nav flex-column px-2 font-weight-bold">
							<li class="nav-item"><a class="nav-link" href="/portfoli/app/message/inbox"> 받은 쪽지함 </a></li>
							<li class="nav-item"><a class="nav-link" href="/portfoli/app/message/sent"> 보낸 쪽지함 </a></li>
						</ul>
						</li>
						
						<!-- 일반회원 -->
						<c:if test="${loginUser.type == '1'}">
						
							<!-- 일정 -->
							<li class="nav-item"><a class="nav-link" href="/portfoli/app/calendar/calendar"> <i class="fi fi-arrow-end m-0 fs--12"></i> <span class="px-2 d-inline-block"> 일정 관리 </span></a></li>
							
							<!-- 포트폴리오 -->
							<li class="nav-item font-weight-bold active">
								<a class="nav-link" href="#"> 
								<span class="group-icon"><i class="fi fi-arrow-end"></i><i class="fi fi-arrow-down"></i></span> 
								<span class="px-2 d-inline-block active font-weight-bold"> 내 포트폴리오 </span>
								</a>
							<ul class="nav flex-column px-2 font-weight-bold">
								<li class="nav-item active"><a class="nav-link" href="/portfoli/app/portfolio/mylist"> 포트폴리오 관리 </a></li>
								<li class="nav-item"><a class="nav-link" href="/portfoli/app/portfolio/myRecommendedlist"> 내가 찜한 목록 </a></li>
							</ul>
							</li>
							
						</c:if>
						
						<!-- 기업회원 -->
						<c:if test="${loginUser.type == '2'}">
						
						<!-- 멤버십 -->
						<li class="nav-item"><a class="nav-link" href="/portfoli/app/payment/introduction"> <i class="fi fi-arrow-end m-0 fs--12"></i><span class="px-2 d-inline-block"> 멤버십 </span></a></li>

						<!-- 공고 관리 -->
						<li class="nav-item"><a class="nav-link " href="/portfoli/app/jobposting/mylist"> <i class="fi fi-arrow-end m-0 fs--12"></i> <span class="px-2 d-inline-block"> 공고 관리 </span></a></li>
						</c:if>

				</ul>

			</nav>
			<!-- /CATEGORIES -->

		</div>
		<!--------------------------------------- nav bar ----------------------------------------------->

		<!-------------------------------------------- 컨텐츠부분 -------------------------------------------->

		<div class="container"
			style="width: 70%; overflow-y: scroll; margin-left: 10px; overflow-x: hidden;">
			<div class="portlet mt--20"
				style="width: 95%; box-shadow: 0 0 0 0; display: inline-block">

				<div class="portlet-header">
					<h3 class="h2" style="display: inline-block;">포트폴리오 관리하기</h3>
					<button class="btn btn-outline-secondary btn-pill btn-sm"
						style="margin-bottom: .5rem; margin-left: 2rem;"
						onclick="location.href='form'">글쓰기(+)</button>
					<!-------------------------------- 보기 스타일 전환버튼 -------------------------------->
					<a href="#!" class="btn btn-soft btn-toggle" id="styleToggle"
						style="margin-bottom: 0.3rem; margin-left: 30%; border: 1px #9E9E9E solid; padding: 0.4rem 0.7rem;">
						<span class="group-icon"> <i class="fi fi-list"></i> <i
							class="fi fi-squared-dots"></i>
					</span>
					</a>
					<!-------------------------------- 보기 스타일 전환버튼 -------------------------------->
					<!-------------------------------- 페이지 노출 컨텐츠수 -------------------------------->
					<select name="quantity" id="fnPageSize" class="form-control mb-3"
						style="margin-bottom: 0.5rem !important; display: inline-block; font-size: 1rem; width: 9rem; height: 2.5rem; padding: 0.5rem;"
						onchange="fnSetPageSize(this.value)">
						<option value="5">5개씩 보기</option>
						<option value="10">10개씩 보기</option>
						<option value="20">20개씩 보기</option>
						<option value="50">50개씩 보기</option>
					</select>
					<!-------------------------------- 페이지 노출 컨텐츠수 -------------------------------->
				</div>
				<!-------------------------------- 검색창 -------------------------------->
				<form action='searchMylist' method='get'>
					<input class="form-control" id='keyword' name='keyword' type='text'
						style="display: inline-block; width: 90%; height: 2.5rem; margin: 3rem 0rem;">
					<button aria-label="Global Search" type="submit"
						class="btn bg-transparent shadow-none m-0 px-2 py-1 text-muted">
						<i class="fi fi-search fs--20"></i>
					</button>
				</form>
				<!-------------------------------- 검색창 -------------------------------->
				<div class="table-responsive rounded"
					style="min-height: 500px; overflow: initial;">

					<!-------------------------------- 프토폴리오 리스트 (테이블형) -------------------------------->
					<table id="listTable" class="table m-0"
						style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
						<thead>
							<tr>
								<th class="b-0 w--150" style="font-size: large;">순번</th>
								<th class="b-0 w--400" style="font-size: large;">제목</th>
								<th class="b-0 w--300" style="font-size: large;">등록일</th>
								<th class="b-0 w--250" style="font-size: large;">공개여부</th>
								<th class="b-0 w--200" style="font-size: large">추천수</th>
								<th class="b-0 w--200" style="font-size: large;">조회수</th>
								<th class="b-0 w--500" style="font-size: large;">스킬</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${list}" var="item" varStatus="status">

								<tr data-href="detail?number=${item.number}"
									data-ajax-modal-size="modal-xl" data-ajax-modal-centered="true"
									data-ajax-modal-callback-function=""
									data-ajax-modal-backdrop="" class="js-ajax-modal ">
									<%--------------------------------------순번 --------------------------------------%>
									<c:choose>
										<c:when test="${not empty keyword}">
											<td
												style="max-width: 20rem; overflow: hidden; text-overflow: ellipsis;"
												class="my-td my">${status.getCount()}</td>
										</c:when>
										<c:otherwise>
											<td
												style="max-width: 20rem; overflow: hidden; text-overflow: ellipsis;"
												class="my-td my">${(pageSize*pagination.curPage)-pageSize + status.getCount()}</td>
										</c:otherwise>
									</c:choose>
									<%--------------------------------------순번 --------------------------------------%>
									<%--------------------------------------제목 --------------------------------------%>
									<td class="my-td my" ondragstart="return false"
										style="max-width: 20rem; overflow: hidden; text-overflow: ellipsis;">
										${item.title}</td>
									<%--------------------------------------제목 --------------------------------------%>
									<%--------------------------------------등록일 --------------------------------------%>
									<td class="my-td my"
										style="max-width: 20rem; overflow: hidden; text-overflow: ellipsis;">
										${item.registeredDate}</td>
									<%--------------------------------------등록일 --------------------------------------%>
									<%--------------------------------------공개여부 --------------------------------------%>
									<c:if test="${item.readable eq 1}">
										<td class="my-td my"
											style="max-width: 20rem; overflow: hidden; text-overflow: ellipsis;">
											<a href="#" id="readableToggler"
											class="btn-toggle btn btn-sm btn-outline-secondary active"
											data-toggle-ajax-url-on="readableon?number=${item.number}"
											data-toggle-ajax-url-off="readableoff?number=${item.number}"
											data-toast-failure-position=""> <span class="group-icon">
													<i class="fi" style="font-size: medium; width: 50px;">비공개</i>
												<%-- 비공개 --%> <i class="fi"
													style="font-size: medium; width: 50px;">공개</i>
												<%-- 공개 --%>
											</span> <br>
										</a>
										</td>
									</c:if>
									<c:if test="${item.getReadable() eq 0}">
										<td class="my-td my"
											style="max-width: 20rem; overflow: hidden; text-overflow: ellipsis;">
											<a href="#" id="readableToggler"
											class="btn-toggle btn btn-sm btn-outline-secondary"
											data-toggle-ajax-url-on="readableon?number=${item.number}"
											data-toggle-ajax-url-off="readableoff?number=${item.number}"
											data-toast-failure-position=""> <span class="group-icon">
													<i class="fi" style="font-size: medium; width: 50px;">비공개</i>
												<%-- 비공개 --%> <i class="fi"
													style="font-size: medium; width: 50px;">공개</i>
												<%-- 공개 --%>
											</span> <br>
										</a>
										</td>
									</c:if>
									<%--------------------------------------공개여부 --------------------------------------%>
									<%--------------------------------------추천수 --------------------------------------%>
									<td class="my-td my"
										style="max-width: 20rem; overflow: hidden; text-overflow: ellipsis;">${item.getRecommendedCount()}</td>
									<%--------------------------------------추천수 --------------------------------------%>
									<%--------------------------------------조회수 --------------------------------------%>
									<td class="my-td my"
										style="max-width: 20rem; overflow: hidden; text-overflow: ellipsis;">${item.viewCount}</td>
									<%--------------------------------------조회수 --------------------------------------%>
									<%--------------------------------------스킬 --------------------------------------%>
									<td class="my-td my"
										style="max-width: 20rem; overflow: hidden; text-overflow: ellipsis;">
										<c:forEach items="${item.skill}" var="skill">
		              ${skill.name}/
		              </c:forEach>
									</td>
									<%--------------------------------------스킬 --------------------------------------%>
								</tr>

							</c:forEach>
						</tbody>
					</table>
					<!-------------------------------- 프토폴리오 리스트 (테이블형) -------------------------------->

				</div>
			</div>



			<div class="row" id="blockStyle"
				style="margin-left: 50000px; position: absolute; margin-top: -550px; -webkit-backface-visibility: hidden; backface-visibility: hidden; background: white; display: none;">
				<!--------------------------------------------- 프토폴리오 리스트 (블럭형) --------------------------------------------->
				<c:forEach items="${list}" var="item">
					<a href="#" data-href="detail?number=${item.number}"
						data-ajax-modal-size="modal-xl"
						data-ajax-modal-callback-function="" data-ajax-modal-backdrop=""
						class="js-ajax-modal">
						<div class="col-12 col-lg-4 mb-4 cursor"
							style="max-width: 300px; max-height: 300px; margin-right: 20px">
							<div
								class="card b-0 shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 bg-cover overlay-dark overlay-opacity-4 text-white"
								<c:if test="${item.thumbnail != null}">
           style="background-image: url('../../upload/portfolio/${item.thumbnail}_300x300.jpg'); width:300px;">
    </c:if>
								<c:if test="${item.thumbnail == null}">
           style="background-image: url('../../resources/assets/images/background/black.png'); width:300px;">
    </c:if>
								<!-- 제목, 아이디 -->
								<div class="card-body font-weight-light mt--60">
									<div class="d-table">
										<div class="d-table-cell align-bottom"
											style="text-align: center;">
											<p
												style="max-height: 1.65rem; width: 16.5rem; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
												${item.title}</p>
											<p class="text-warning fs--13">${item.member.id}</p>
										</div>
									</div>
								</div>
								<!-- 제목, 아이디 -->

								<!-- 카드하단 -->
								<div class="card-footer bg-transparent b-0"
									style="height: 100px;">
									<hr class="border-light opacity-2">
									<a style="position: absolute; left: 67%;"> <span
										class="float-end fs--14 p-2">
											${item.getRecommendedCount()} </span>
									</a> <a href="#" class="btn btn-sm btn-warning opacity-8"
										style="position: absolute; left: 20%;">
										${item.getViewCount()} </a>
								</div>
								<!-- 카드하단 -->

							</div>
						</div>
					</a>
				</c:forEach>
				<!--------------------------------------------- 프토폴리오 리스트 (블럭형) --------------------------------------------->
			</div>
		</div>
		<!-------------------------------------------- 컨텐츠부분 -------------------------------------------->
		<!--------------------------- 페이징부분(search 기능 없을때만 사용) ---------------------------------->
		<c:choose>
			<c:when test="${not empty keyword}">
			</c:when>
			<c:otherwise>

				<div class="col-12 col-xl-12"
					style="margin-top: 2%; padding-right: 40%; margin: 10px auto; text-align: center;">
					<nav aria-label="pagination">
						<ul
							class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">

							<!-- prev부분 -->
							<c:if test="${pagination.curPage == 1}">
								<li class="page-item disabled btn-pill" data-page="prev"><a
									class="page-link" href="#" tabindex="-1" aria-disabled="true"
									onClick="fn_paging(1)">Prev</a></li>
							</c:if>
							<c:if test="${pagination.curPage != 1}">
								<li class="page-item" data-page="prev"><a class="page-link"
									href="#" tabindex="-1" aria-disabled="true"
									onClick="fn_paging('${pagination.prevPage}')">Prev</a></li>
							</c:if>

							<!-- 중간 numbering 부분 -->
							<c:forEach var="pageNum" begin="${pagination.startPage}"
								end="${pagination.endPage}">
								<c:if test="${pageNum == pagination.curPage}">
									<li class="page-item active" data-page="${pageNum}"><a
										class="page-link" href="#"
										onClick="fn_center_paging('${pageNum}')">${pageNum}</a></li>
								</c:if>
								<c:if test="${pageNum != pagination.curPage}">
									<li data-page="${pageNum}"><a class="page-link" href="#"
										onClick="fn_center_paging('${pageNum}')">${pageNum}</a></li>
								</c:if>
							</c:forEach>

							<!-- next 부분 -->
							<c:if test="${pagination.curPage < pagination.pageCnt}">
								<li class="page-item btn-pill" data-page="next"><a
									class="page-link" onClick="fn_paging('${pagination.nextPage}')"
									href="#">Next</a></li>
							</c:if>
							<c:if test="${pagination.curPage >= pagination.pageCnt}">
								<li class="page-item disabled btn-pill" data-page="next"><a
									class="page-link" href="#">Next</a></li>

							</c:if>
						</ul>
					</nav>
				</div>
			</c:otherwise>
		</c:choose>
		<!--------------------------- 페이징부분(search 기능 없을때만 사용) ---------------------------------->
	</div>
</div>
<script>
  function getQueryStringObject() {
      var a = window.location.search.substr(1).split('&');
      if (a == "") return {};
      var b = {};
      for (var i = 0; i < a.length; ++i) {
          var p = a[i].split('=', 2);
          if (p.length == 1)
              b[p[0]] = "";
          else
              b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
      }
      return b;
  }
  
  function fnSetPageSize(val) {
      location.href = "mylist?quantity=" + val;
  }
  
  $(document).ready(function() {

	    var qs = getQueryStringObject();
	    var page = qs.quantity;
	    switch(page) {
	    case "5":
	        $("option[value='5']").attr('selected','selected');
	      break;
	    case "10":
	          $("option[value='10']").attr('selected','selected');
	      break;
	    case "20":
	          $("option[value='20']").attr('selected','selected');
	      break;
	    case "50":
	          $("option[value='50']").attr('selected','selected');
	      break;
	    default:
	          $("option[value='10']").attr('selected','selected');
	    }
	  
	   $("#keyword").keyup(function() {
	     var k = $(this).val();
	     $("#listTable > tbody > tr").hide();
	     
	     var temp = $("#listTable > tbody > tr > td:nth-child(n):contains('"+ k +"')");
	     $(temp).parent().show();
	     })
	   
	 });
  
  $("readableToggler").on('click', function(e){
      e.stopImmediatePropagation();
      e.currentTarget.stopImmediatePropagation();
  });
  
  var toggle = $('#styleToggle');
  $('#styleToggle').on('click',function(){
	  if(toggle.hasClass("active")) {
	      $('.table.m-0').css('display', 'contents');
        $('#blockStyle').hide('fast');
		  } else {
			  $('.table.m-0').css('display', 'none');
	      $('#blockStyle').css('margin-left', 0).show('fast');
		  }
  });
  
  function fn_center_paging(pageNum) {
      var qs = getQueryStringObject();
      if(qs.quantity != null) {
        location.href = "mylist?quantity=" + qs.quantity + "&curPage=" + pageNum;
      } else {
        location.href = "mylist?curPage=" + pageNum;
      }
    }

  function fn_paging(curPage) {
    location.href = "mylist?curPage=" + curPage;
    }
  </script>
<style>
.table .my-td.my {
	padding: 1.2rem 1rem 1rem 1rem;
}

.cursor {
	cursor: pointer;
}

.padding10_0 {
	padding: 10px 0px;
}

.padding10_10 {
	padding: 10px 10px;
}

.padding5_5 {
	padding: 5px 5px;
}
</style>
