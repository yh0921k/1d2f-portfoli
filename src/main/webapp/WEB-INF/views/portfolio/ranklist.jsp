<%@page import="java.util.List"%>
<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <!-- PAGE TITLE -->
      <form id="get" action="rankAll" method="get">
      <section class="bg-white" style="padding: 30px 0px;">
        <div class="container py-1">

          <h3 class="h2" style="display:inline-block;">포트폴리오 랭킹 게시판</h3>
<!-------------------------------- 보기 스타일 전환버튼 -------------------------------->
        <a href="#!" class="btn btn-soft btn-toggle" id="styleToggle" 
           style="margin-left: 44%;border: 1px #9E9E9E solid;padding:0.4rem 0.7rem;">
          <span class="group-icon">
            <i class="fi fi-list"></i>
            <i class="fi fi-squared-dots"></i>
          </span>
        </a>
<!-------------------------------- 보기 스타일 전환버튼 -------------------------------->
<!-------------------------------- 페이지 노출 컨텐츠수 -------------------------------->
			<select name="quantity" id="fnPageSize" class="form-control mb-3"
			        style="display: inline-block;font-size: 1rem;width: 9rem;height: 2.5rem;padding: 0.5rem;"
			        onchange="fnSetPageSize(this.value)"
			        >
			  <option value="5">5개씩 보기</option>
			  <option value="10">10개씩 보기</option>
			  <option value="20">20개씩 보기</option>
			  <option value="50">50개씩 보기</option>
			</select>
<!-------------------------------- 페이지 노출 컨텐츠수 -------------------------------->

          <nav aria-label="breadcrumb">
            <ol class="breadcrumb fs--14">
              <li class="breadcrumb-item"><a href="../../">portfoli</a></li>
              <li class="breadcrumb-item active" aria-current="page"><a href="list">포트폴리오 랭킹 게시판</a></li>
            </ol>
          </nav>
      <!-- /PAGE TITLE -->

<!-------------------------------------------- 컨텐츠부분 -------------------------------------------->

    <div class="portlet mt--20"  style="width: 95%; box-shadow: 0 0 0 0; display:inline-block">
<!-------------------------------- 시작일~마지막일 박스 -------------------------------->
		<div>
		<input class="searchMonth" type="month" />달
		<input class="searchDate" id="startDate" name="startDate"  type="date" value='${startDate}'/>시작일
		<input class="searchDate" id="endDate" name="endDate"  type="date" value='${endDate}'/>마지막일
		</div>
<!-------------------------------- 시작일~마지막일 박스 -------------------------------->
      <div class="table-responsive rounded" style="min-height: 500px; overflow:initial;">

<!-------------------------------- 프토폴리오 리스트 (테이블형) -------------------------------->
        <table id="listTable" class="table m-0" style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">
          <thead>
            <tr>
              <th class="b-0 w--150" style="font-size: large;">순번</th>
              <th class="b-0 w--400" style="font-size: large;">제목</th>
              <th class="b-0 w--300" style="font-size: large;">등록일</th>
              <th class="b-0 w--200" style="font-size: large">추천수</th>
              <th class="b-0 w--200" style="font-size: large;">조회수</th>
              <th class="b-0 w--500" style="font-size: large;">스킬</th>
            </tr>
          </thead>
                
          <tbody>
<%--------------------------------------순번 --------------------------------------%>
            <c:forEach items="${list}" var="item" varStatus="status">
            <tr data-href="detail?number=${item.portfolio.number}" 
                data-ajax-modal-size="modal-xl" 
                data-ajax-modal-centered="true" 
                data-ajax-modal-callback-function=""
                data-ajax-modal-backdrop="" 
                class="js-ajax-modal ">
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
                  ${item.portfolio.title}
              </td>
<%--------------------------------------제목 --------------------------------------%>
<%--------------------------------------등록일 --------------------------------------%>
              <td class="my-td my"
                  style="max-width: 20rem;overflow: hidden;text-overflow: ellipsis;">
                  ${item.portfolio.registeredDate}</td>
<%--------------------------------------등록일 --------------------------------------%>
<%--------------------------------------추천수 --------------------------------------%>
              <td class="my-td my" style="max-width: 20rem;overflow: hidden;text-overflow: ellipsis;">${item.portfolio.getRecommendedCount()}</td>
<%--------------------------------------추천수 --------------------------------------%>
<%--------------------------------------조회수 --------------------------------------%>
              <td class="my-td my" style="max-width: 20rem;overflow: hidden;text-overflow: ellipsis;">${item.portfolio.viewCount}</td>
<%--------------------------------------조회수 --------------------------------------%>
<%--------------------------------------스킬 --------------------------------------%>
              <td class="my-td my"
                  style="max-width: 20rem;overflow: hidden;text-overflow: ellipsis;">
                  <c:forEach items="${item.portfolio.skill}" var="skill">
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



<div class="row" id="blockStyle" style="margin-left: 0px; position: relative; margin-top:-500px; backface-visibility: hidden; background: white; display: none;">
<!--------------------------------------------- 프토폴리오 리스트 (블럭형) --------------------------------------------->
  <c:forEach items="${list}" var="item">
<a href="#"
  data-href="detail?number=${item.portfolio.number}" 
  data-ajax-modal-size="modal-xl" 
  data-ajax-modal-callback-function=""
  data-ajax-modal-backdrop="" 
  class="js-ajax-modal">
  <div class="col-12 col-lg-4 mb-4 cursor" style="max-width:300px; max-height:300px; margin-right:20px">
    <div class="card b-0 shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 bg-cover overlay-dark overlay-opacity-4 text-white"
    <c:if test="${item.portfolio.thumbnail != null}">
           style="background-image: url('../../upload/portfolio/${item.portfolio.thumbnail}_300x300.jpg'); width:300px;">
    </c:if>
    <c:if test="${item.portfolio.thumbnail == null}">
           style="background-image: url('../../resources/assets/images/background/black.png'); width:300px;">
    </c:if>
    
    <!-- 제목, 아이디 -->
      <div class="card-body font-weight-light mt--60">
        <div class="d-table">
          <div class="d-table-cell align-bottom" style="text-align:center;">
            <p style="max-height: 1.65rem;width: 16.5rem;overflow:hidden;white-space: nowrap;text-overflow: ellipsis;">
              ${item.portfolio.title}
            </p>
            <p class="text-warning fs--13">
              ${item.portfolio.member.id}
            </p>
          </div>
        </div>
      </div>
    <!-- 제목, 아이디 -->

    <!-- 카드하단 -->
      <div class="card-footer bg-transparent b-0" style="height: 100px;">
        <hr class="border-light opacity-2">
        <a style="position: absolute; left: 67%;">
        <span class="float-end fs--14 p-2">
          ${item.portfolio.getRecommendedCount()}
        </span>
        </a>
        <a href="#" class="btn btn-sm btn-warning opacity-8" style="position: absolute; left:20%;">
          ${item.portfolio.getViewCount()}
        </a>
      </div>
    <!-- 카드하단 -->
    
      </div>
    </div>
    </a>
    </c:forEach>
<!--------------------------------------------- 프토폴리오 리스트 (블럭형) --------------------------------------------->
</div>
<!-------------------------------------------- 컨텐츠부분 -------------------------------------------->
<!--------------------------- 페이징부분(search 기능 없을때만 사용) ---------------------------------->
              <c:choose>
              <c:when test="${not empty keyword}">
              </c:when>
              <c:otherwise>

  <div class="col-12 col-xl-12" style="margin-top: 2%;padding-right: 40%;margin: 10px auto;text-align: center;">
   <nav aria-label="pagination">
     <ul class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">
    
            <!-- prev부분 -->
       <c:if test="${pagination.curPage == 1}"> 
         <li class="page-item disabled btn-pill" data-page="prev">
         <a class="page-link" href="#" tabindex="-1" aria-disabled="true" onClick="fn_paging(1)">Prev</a></li>
       </c:if>
       <c:if test="${pagination.curPage != 1}"> 
         <li class="page-item" data-page="prev">
         <a class="page-link" href="#" tabindex="-1" aria-disabled="true" onClick="fn_paging('${pagination.prevPage}')">Prev</a></li>
       </c:if>
  
            <!-- 중간 numbering 부분 -->
      <c:forEach var="pageNum" begin="${pagination.startPage}" end="${pagination.endPage}">
        <c:if test="${pageNum == pagination.curPage}">
          <li class="page-item active" data-page="${pageNum}">
            <a class="page-link" href="#" onClick="fn_center_paging('${pageNum}')">${pageNum}</a>
          </li>
        </c:if>
        <c:if test="${pageNum != pagination.curPage}">
          <li data-page="${pageNum}">
            <a class="page-link" href="#" onClick="fn_center_paging('${pageNum}')">${pageNum}</a>
          </li>
        </c:if>
      </c:forEach>
      
            <!-- next 부분 -->
        <c:if test="${pagination.curPage < pagination.pageCnt}">
          <li class="page-item btn-pill" data-page="next">
            <a class="page-link" onClick="fn_paging('${pagination.nextPage}, ${pagination.pageCnt}')" href="#">Next</a> 
          </li>
        </c:if>
        <c:if test="${pagination.curPage >= pagination.pageCnt}"> 
          <li class="page-item disabled btn-pill" data-page="next">
            <a class="page-link" href="#">Next</a> 
          </li>
          
        </c:if>
      </ul>
     </nav>
    </div>
              </c:otherwise>
              </c:choose>
              
        </div>
      </section>
		</form>
<!--------------------------- 페이징부분(search 기능 없을때만 사용) ---------------------------------->  <style>
    .modal-content {
    margin-top:150px;
  }
  </style>
  
  <script>
  $('.searchMonth').change(function() {
	  var month = $('.searchMonth').val();
	  console.log(month+"-01");
	  console.log($('.searchMonth').getMonth());
	  console.log($('.searchMonth').getMonth()+1);
  });
  
  $('.searchDate').change(function() {
	  if($('#startDate').val() != "" && $('#endDate').val() != "") {
		  $('#get').submit();
	  }
  });
  
  
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
	  $('#get').submit();
		  //location.href = "rankAll?quantity=" + val;
  }
  
  $(document).ready(function() {
	  var date = new Date();
	  $('.searchMonth').attr("value", date.getFullYear() + "-" +
			  (date.getMonth() >= 9 ? date.getMonth()+1 : "0" + (date.getMonth()+1)));
	  
	  var qs = getQueryStringObject();
	  var page = qs.quantity;
		  console.log($('pageSize'));
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
		  var queryString;
		  if(qs.quantity == null) {
			  queryString = "quantity=" + 10;
		  } else {
			  queryString = "quantity=" + qs.quantity;
		  }
		  if(pageNum == null) {
			  queryString += "&curPage=" + 1;
		  } else {
			  queryString += "&curPage=" + pageNum;
		  }
		  if(qs.startDate != null) {
			  queryString += "&startDate=" + qs.startDate;
		  }
		  if(qs.endDate != null) {
			  queryString += "&endDate=" + qs.endDate;
		  }		  
		  location.href = "rankAll?" + queryString;
	  }
  function fn_paging(pagination) {
	  var pag = pagination.split(',');
	  var curPage = pag[0];
	  var pageCnt = pag[1];
	  if(curPage != pageCnt) {
		  fn_center_paging(curPage);
	  } else {
	  }
  }
  </script>
  <style>
    .cursor {
      cursor: pointer;
    }
    .padding10_0{
      padding: 10px 0px;
    }
    .padding10_10{
      padding: 10px 10px;
    }
    .padding5_5{
      padding: 5px 5px;
    }
  </style>