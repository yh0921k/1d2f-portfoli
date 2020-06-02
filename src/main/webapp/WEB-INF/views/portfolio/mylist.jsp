<%@page import="java.util.List"%>
<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid">

  <div class="row">
    <!--------------------------------------- nav bar ----------------------------------------------->
<jsp:include page="mylistSidebar.jsp"/>
    <!--------------------------------------- nav bar ----------------------------------------------->

<!-------------------------------------------- 컨텐츠부분 -------------------------------------------->

<div class="container" style="width: 70%;overflow-y: scroll;margin-left: 10px;overflow-x: hidden;">
    <div class="portlet mt--20"  style="width: 100%; box-shadow: 0 0 0 0; display:inline-block">

      <div class="portlet-header">
          <h3 class="h2" style="display:inline-block;">포트폴리오 관리하기</h3>
          <button class="btn btn-outline-secondary btn-pill btn-sm" 
                  style="margin-bottom:.5rem;margin-left: 2rem;"
                  onclick="location.href='form'">글쓰기(+)</button>
<!-------------------------------- 보기 스타일 전환버튼 -------------------------------->
        <a href="#!" class="btn btn-soft btn-toggle" id="styleToggle" 
           style="margin-left:0px;float: right;;border: 1px #9E9E9E solid;padding:0.4rem 0.7rem;">
          <span class="group-icon">
            <i class="fi fi-list"></i>
            <i class="fi fi-squared-dots"></i>
          </span>
        </a>
<!-------------------------------- 보기 스타일 전환버튼 -------------------------------->
<!-------------------------------- 페이지 노출 컨텐츠수 -------------------------------->
      <select name="quantity" id="fnPageSize" class="form-control mb-3"
              style="float: right;display: inline-block;font-size: 1rem;width: 9rem;height: 2.5rem;padding: 0.5rem;"
              onchange="fnSetPageSize(this.value)"
              >
        <option value="6">6개씩 보기</option>
        <option value="9">9개씩 보기</option>
        <option value="21">21개씩 보기</option>
        <option value="54">54개씩 보기</option>
      </select>
<!-------------------------------- 페이지 노출 컨텐츠수 -------------------------------->
      </div>
<!-------------------------------- 검색창 -------------------------------->
		<form action='searchMylist' method='get' style="text-align:center;">
      <button aria-label="Global Search" type="submit"
              class="btn bg-transparent shadow-none m-0 px-2 py-1 text-muted"
              style="float:right; width:3%; box-sizing:content-box;margin:2% 0rem!important">
         <i class="fi fi-search fs--20"></i>
      </button>
      <input class="form-control" id='keyword' name='keyword' type='text'
             style="float:right; display:inline-block; width: 93%;height: 2.5rem; margin: 2% 0rem;">
		</form>
<!-------------------------------- 검색창 -------------------------------->
      <div class="table-responsive rounded" style="min-height: 500px; overflow:initial;">

<!-------------------------------- 프토폴리오 리스트 (테이블형) -------------------------------->
        <table id="listTable" class="table m-0" style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">
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
							  data-ajax-modal-size="modal-xl" 
							  data-ajax-modal-centered="true" 
							  data-ajax-modal-callback-function=""
							  data-ajax-modal-backdrop="" 
							  class="js-ajax-modal ">
<%--------------------------------------순번 --------------------------------------%>
							<c:choose>
							<c:when test="${not empty keyword}">
              <td style="max-width: 20rem;overflow: hidden;text-overflow: ellipsis;" class="my-td my">${status.getCount()}</td>
              </c:when>
              <c:otherwise>
              <td style="max-width: 20rem;overflow: hidden;text-overflow: ellipsis;" class="my-td my">${(pageSize*pagination.curPage)-pageSize + status.getCount()}</td>
              </c:otherwise>
              </c:choose>
<%--------------------------------------순번 --------------------------------------%>
<%--------------------------------------제목 --------------------------------------%>
              <td class="my-td my" 
                  ondragstart="return false" 
                  style="max-width: 20rem;overflow: hidden;text-overflow: ellipsis;">
                  ${item.title}
              </td>
<%--------------------------------------제목 --------------------------------------%>
<%--------------------------------------등록일 --------------------------------------%>
              <td class="my-td my"
                  style="max-width: 20rem;overflow: hidden;text-overflow: ellipsis;">
                  ${item.registeredDate}</td>
<%--------------------------------------등록일 --------------------------------------%>
<%--------------------------------------공개여부 --------------------------------------%>
              <c:if test="${item.readable eq 1}">
				        <td class="my-td my" style="max-width: 20rem;overflow: hidden;text-overflow: ellipsis;">
				        <a href="#"
				           class="btn-toggle btn btn-sm btn-outline-secondary active readableToggler"
				           data-toggle-ajax-url-on="readableon?number=${item.number}"
				           data-toggle-ajax-url-off="readableoff?number=${item.number}"
				           data-toast-failure-position=""
				           data-value="${item.thumbnail}"
				           >
				          <span class="group-icon">
				            <i class="fi" style="font-size:medium; width: 50px;">비공개</i><%-- 비공개 --%>
				            <i class="fi" style="font-size:medium; width: 50px;">공개</i><%-- 공개 --%>
				          </span>
				          <br>
				        </a>
					      </td>
              </c:if>
              <c:if test="${item.getReadable() eq 0}">
				        <td class="my-td my" style="max-width: 20rem;overflow: hidden;text-overflow: ellipsis;">
				        <a href="#" 
				           class="btn-toggle btn btn-sm btn-outline-secondary readableToggler"
				           data-toggle-ajax-url-on="readableon?number=${item.number}"
				           data-toggle-ajax-url-off="readableoff?number=${item.number}"
				           data-toast-failure-position=""
				           data-value="${item.thumbnail}"
				           >
				          <span class="group-icon">
				            <i class="fi" style="font-size:medium; width: 50px;">비공개</i><%-- 비공개 --%>
				            <i class="fi" style="font-size:medium; width: 50px;">공개</i><%-- 공개 --%>
				          </span>
				          <br>
				        </a>
					      </td>
              </c:if>
<%--------------------------------------공개여부 --------------------------------------%>
<%--------------------------------------추천수 --------------------------------------%>
              <td class="my-td my" style="max-width: 20rem;overflow: hidden;text-overflow: ellipsis;">${item.getRecommendedCount()}</td>
<%--------------------------------------추천수 --------------------------------------%>
<%--------------------------------------조회수 --------------------------------------%>
              <td class="my-td my" style="max-width: 20rem;overflow: hidden;text-overflow: ellipsis;">${item.viewCount}</td>
<%--------------------------------------조회수 --------------------------------------%>
<%--------------------------------------스킬 --------------------------------------%>
              <td class="my-td my"
                  style="max-width: 20rem;overflow: hidden;text-overflow: ellipsis;">
		              <c:forEach items="${item.skill}" var="skill">
		              ${skill.name}/
		              </c:forEach>
              </td>
<%--------------------------------------스킬 --------------------------------------%>
            </c:forEach>
          </tbody>
        </table>
<!-------------------------------- 프토폴리오 리스트 (테이블형) -------------------------------->
        
      </div>
    </div>



<div class="row" id="blockStyle" style="margin-left:50000px ; position:absolute; margin-top:-500px; -webkit-backface-visibility:hidden; backface-visibility:hidden; background:white; display:none; width:100%;">
<!--------------------------------------------- 프토폴리오 리스트 (블럭형) --------------------------------------------->
  <c:forEach items="${list}" var="item">
<a href="#"
  data-href="detail?number=${item.number}" 
  data-ajax-modal-size="modal-xl" 
  data-ajax-modal-callback-function=""
  data-ajax-modal-backdrop="" 
  class="js-ajax-modal">
  <div class="col-12 col-lg-4 mb-4 cursor" 
       style="max-width:33%; width:33%; max-height:300px;">
    <div class="card b-0 shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 bg-cover overlay-dark overlay-opacity-4 text-white"
    <c:if test="${item.thumbnail != null}">
           style="width:100%;background-image: url('../../upload/portfolio/${item.thumbnail}_300x300.jpg');">
    </c:if>
								<c:if test="${item.thumbnail == null}">
           style="width:100%;background-image: url('../../resources/assets/images/background/black.png');">
    </c:if>
								<!-- 제목, 아이디 -->
					      <div class="card-body font-weight-light mt--60" 
					           style="font-size: 1.2rem;overflow:hidden;white-space: nowrap;text-overflow: ellipsis;max-width: 100%;margin-top: 40px!important;">
					        <div class="d-table" style="display: block!important;margin: 0!important;margin-right: 0px!important;max-width: 100%;width: 100%;">
					          <div class="d-table-cell align-bottom" style="text-align: left;width: 100%;display: block!important;padding-left: 2rem;">
				            <p style="font-size:1.2rem;max-height: 1.65rem;overflow:hidden;white-space: nowrap;text-overflow: ellipsis;margin-right: 5%;">
				              ${item.title}
				            </p>
				            <p class="text-warning fs--13" style="font-size:1.2rem;max-height: 1.65rem;overflow:hidden;white-space: nowrap;text-overflow: ellipsis;margin-right: 5%;">
				              ${item.member.id}
				            </p>
									            
				            <p style="font-size:1rem;max-height: 1.65rem;overflow:hidden;white-space: nowrap;text-overflow: ellipsis;margin-right: 5%;">
				            <c:forEach items="${item.skill}" var="skill">
				            ${skill.name}/
				            </c:forEach>
				            </p>

					          </div>
					        </div>
					      </div>
								<!-- 제목, 아이디 -->

								<!-- 카드하단 -->
					      <div class="card-footer bg-transparent b-0" style="height: 100px;">
					        <hr class="border-light opacity-2">
					        <a href="#" class="btn btn-sm btn-success opacity-8" style="float:left; margin-left:1.3rem;">
					        <span class="fs--14">
					              추천수 : ${item.getRecommendedCount()}
					        </span>
					        </a>
					        <a href="#" class="btn btn-sm btn-warning opacity-8" style="float:left; margin-left:1rem;">
					              조회수 : ${item.getViewCount()}
					        </a>
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
  <script src="${pageContext.getServletContext().getContextPath()}/node_modules/sweetalert2/dist/sweetalert2.all.js"></script>
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
	        $("option[value='6']").attr('selected','selected');
	      break;
	    case "10":
	          $("option[value='9']").attr('selected','selected');
	      break;
	    case "20":
	          $("option[value='21']").attr('selected','selected');
	      break;
	    case "50":
	          $("option[value='54']").attr('selected','selected');
	      break;
	    default:
	          $("option[value='9']").attr('selected','selected');
	    }
	  
	   $("#keyword").keyup(function() {
	     var k = $(this).val();
	     $("#listTable > tbody > tr").hide();
	     
	     var temp = $("#listTable > tbody > tr > td:nth-child(n):contains('"+ k +"')");
	     $(temp).parent().show();
	     })
	   
	 });
  
  
  
  $('.readableToggler').on('click', function() {
	  
		  // 공개설정인 경우 : 비공개처리는 조건없이 통과
		  if($(this).hasClass('active')) {
			  Swal.fire({
				  icon: 'success',
				  title: '성공!'
				})
		  }
		   
		  // 비공개설정인 경우 : 썸네일이 없으면 호출안함
		  else {
			  if($(this).attr('data-value') == null || $(this).attr('data-value') == '') {
					  Swal.fire({
						  icon: 'error',
						  title: '잠깐!...',
						  text: '썸네일을 넣어주세요.',
						})
			  } else {
				  Swal.fire({
					  icon: 'success',
					  title: '성공!'
					})
			  }
		  }
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
