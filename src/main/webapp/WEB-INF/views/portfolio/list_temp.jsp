<%@page import="java.util.List"%>
<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <!-- PAGE TITLE -->
      <section class="bg-white" style="padding: 30px 0px;">
        <div class="container py-1">

          <h3 class="h2" style="display:inline-block;">포트폴리오 게시판</h3>
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
              <li class="breadcrumb-item active" aria-current="page"><a href="list">포트폴리오 게시판</a></li>
            </ol>
          </nav>
      <!-- /PAGE TITLE -->

<!-------------------------------------------- 컨텐츠부분 -------------------------------------------->

    <div class="portlet mt--20"  style="width: 95%; box-shadow: 0 0 0 0; display:inline-block">
<!-------------------------------- 검색창 -------------------------------->
    <form action='searchAll' method='get' >
      <input class="form-control" id='keyword' name='keyword' type='text'
             style="display:inline-block; width: 90%; height: 2.5rem; margin: 3rem 0rem;">
      <button aria-label="Global Search" type="submit"
              class="btn bg-transparent shadow-none m-0 px-2 py-1 text-muted">
         <i class="fi fi-search fs--20"></i>
      </button>
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
              <th class="b-0 w--200" style="font-size: large">추천수</th>
              <th class="b-0 w--200" style="font-size: large;">조회수</th>
              <th class="b-0 w--500" style="font-size: large;">스킬</th>
            </tr>
          </thead>
                
          <tbody>
<%--------------------------------------순번 --------------------------------------%>
            <c:forEach items="${list}" var="item" varStatus="status">
            <tr data-href="detail?number=${item.number}" 
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
                  ${item.title}
              </td>
<%--------------------------------------제목 --------------------------------------%>
<%--------------------------------------등록일 --------------------------------------%>
              <td class="my-td my"
                  style="max-width: 20rem;overflow: hidden;text-overflow: ellipsis;">
                  ${item.registeredDate}</td>
<%--------------------------------------등록일 --------------------------------------%>
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
            </tr>
            
            </c:forEach>
          </tbody>
        </table>
<!-------------------------------- 프토폴리오 리스트 (테이블형) -------------------------------->
        
      </div>
    </div>

<div class="row" id="blockStyle" style="width: 1000px;margin-left: 0px;position: relative;margin-top: -500px;backface-visibility: hidden;background: white;display:none;">
<!--------------------------------------------- 프토폴리오 리스트 (블럭형) --------------------------------------------->



<%--시작점 --%>
<div class="card shadow-xs overflow-hidden b-0" style="min-width:830px;box-shadow: none!important;">
  <c:forEach items="${list}" var="item">
	<a href="#"
	  data-href="detail?number=${item.number}" 
	  data-ajax-modal-size="modal-xl" 
	  data-ajax-modal-callback-function=""
	  data-ajax-modal-backdrop=""
	  class="js-ajax-modal"
	  style="text-decoration: none;">
	<div class="row no-gutters" style="width: 688px;margin-bottom: 2rem;box-shadow: 25px 25px 25px rgba(140,152,164,.9)!important;">

<%----------------------------------------썸네일 ----------------------------------------%>
		<div class="col-12 col-lg-5 jarallax overlay-dark overlay-opacity-5 text-white pt--100 pb--100 d-table bg-cover" 
			data-speed="1.1"
			style="width:340px; background-image: url('../../upload/portfolio/${item.thumbnail}_300x300.jpg');"
			onError="this.style.backgrdoun-image ='../../resources/assets/images/background/black.png';"
			>
    <c:if test="${item.thumbnail != null}">
    </c:if>
    <c:if test="${item.thumbnail == null}">
    </c:if>
<%----------------------------------------썸네일 ----------------------------------------%>

<%----------------------------------------작성자 아이디 ----------------------------------------%>
		<div class="d-table-cell align-middle text-center" style="display: block!important; font-size: 1.5rem;">
		${item.member.id}<br>
		</div>
<%----------------------------------------작성자 아이디 ----------------------------------------%>
		<br>
<%----------------------------------------추천수 ----------------------------------------%>
       <span class="float-end fs--14 p-2" style="color: black;position: absolute;left: 59%;text-align:center;font-size: 1rem!important;">
         <i class="fi fi-like" style=""></i><br>${item.getRecommendedCount()}
       </span>
<%----------------------------------------추천수 ----------------------------------------%>
<%----------------------------------------조회수 ----------------------------------------%>
       <span class="float-end fs--14 p-2" style="font-size: 1.2rem!important;color: black;position: absolute;left:20%;font-size: 1rem!important;">
         <i class="fi fi-eye" style="color: black;font-size: 1rem!important;text-align: center;margin: 0;"></i><br>${item.getViewCount()}
       </span>
<%----------------------------------------조회수 ----------------------------------------%>

	</div>

	<!-- card body -->
	<div class="col-12 col-lg-7 p--30">

		<div class="card-body d-table h-100" style="height: 9rem!important">

			<div class="d-table-cell align-middle" 
					 style="font-size: 1rem; text-overflow: ellipsis;overflow: hidden;">

<%----------------------------------------제목 ----------------------------------------%>
				<div class="mb-0 text-center mx-auto max-w-400 font-weight-light" style="color: black;font-weight: 550!important;font-size: 1.5rem;text-overflow: ellipsis;overflow: hidden;">
				${item.title}
				</div>
<%----------------------------------------제목 ----------------------------------------%>

			</div>

		</div>
<%----------------------------------------기술명 ----------------------------------------%>
		<div style="text-align: center;color:black;">
      <c:forEach items="${item.skill}" var="skill" varStatus="status">
			${skill.name}<c:if test="${!status.last}">/</c:if>
      </c:forEach>
		</div>
<%----------------------------------------기술명 ----------------------------------------%>
	</div>
	</div>
	</a>
    </c:forEach>
</div>




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
            <a class="page-link" onClick="fn_paging('${pagination.nextPage}')" href="#">Next</a> 
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
<!--------------------------- 페이징부분(search 기능 없을때만 사용) ---------------------------------->  <style>
    .modal-content {
    margin-top:150px;
  }
  </style>
  
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
		  location.href = "list?quantity=" + val;
  }
  
  $(document).ready(function() {
	  
	  
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
		  if(qs.quantity != null) {
			  location.href = "list?quantity=" + qs.quantity + "&curPage=" + pageNum;
		  } else {
	      location.href = "list?curPage=" + pageNum;
		  }
	  }
	  
  function fn_paging(curPage) {
	  location.href = "list?curPage=" + curPage;
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
