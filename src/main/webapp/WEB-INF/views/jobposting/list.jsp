<%@ page import="com.portfoli.domain.JobPosting"%>
<%@ page import="com.portfoli.domain.JobPostingFile"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container" style="text-align:center" >
<h1 style="text-align:left">채용정보</h1>
<c:import url="/app/jobposting/premium"/>
<!--------------------------------------공고검색----------------------------------------------------->
<div id="searchForm" style="text-align:right">
<form action='search' method='get' >
	<input id='keyword' name='keyword' type='text' >
	<button aria-label="Global Search" type="submit"
                  class="btn bg-transparent shadow-none m-0 px-2 py-1 text-muted">
                  <i class="fi fi-search fs--20"></i>
                </button>
</form>
</div>
<!-------------------------------------/공고검색----------------------------------------------------->
<!-------------------------------------게시글수------------------------------------------------------>
<p style="text-align:left">
전체  (<c:out value="${listCnt}"/>) 건
<p>
<!------------------------------------/게시글수------------------------------------------------------>
<hr>
<!------------------------------------게시글목록------------------------------------------------------>
<div>
<table id="listTable" class="table table-striped table-hover">
	<thead>
	  <th></th>
		<th style="display:none;">no</th>
		<th>기업</th>
		<th>지원자격</th>
		<th>근무조건</th>
		<th>마감일</th>
		<th>조회수</th>
	</thead>

	<tbody>
	<c:set var="today" value="${System.currentTimeMillis()}"/>
	<c:forEach items="${jobPostings}" var="jobPosting" varStatus="status">
    <tr id="tList">
    <td><a href='detail?no=${jobPosting.jobPostingNumber}'><c:forEach items="${jobPosting.files}" var="jobPostingFile">
      <img src="../../upload/jobposting/${jobPostingFile.filePath}" width="100" height="100">
      </c:forEach></td>
			<td style="display:none;">${jobPosting.jobPostingNumber}</td>
			<td><font style="color: orange;">${jobPosting.company.name}</font><br>
			<a href='detail?no=${jobPosting.jobPostingNumber}' style="color:black;">${jobPosting.title}</a>
			</td>
			
			<td>경력 <font style="color: orange;">${jobPosting.minimumCareer}
                    </font><br>
          최소학력 <font style="color: orange;">${jobPosting.finalEducation.category}</font>          
                    </td>
			<td>
			고용형태 <font style="color: orange;">${jobPosting.employmentStatus.name}</font><br>
			지역 <font style="color: orange;">${jobPosting.district.name}</font>
			</td>
			<td>${jobPosting.endDated}<br>
			<span id='D' class="fs--15 font-weight-bold mb-0" style="color: #424242;">
          D-${String.format("%.0f", (jobPosting.endDated.getTime() - today) / 1000 / 60 / 60 / 24)}
        </span>
			</td>
			<td>${jobPosting.viewCount}</td>
		</tr>
	</c:forEach>
  </tbody>
</table>
</div>
<!-----------------------------------/게시글목록------------------------------------------------------>
<!--------------------------------------더보기------------------------------------------------------->
<button id="moreListBtn" 
				class="container py-1 btn btn-secondary btn-lg btn-block" 
				style="width: 300px;height: 50px;margin-bottom: 1.3rem;">더보기
</button>

<!-------------------------------------/더보기------------------------------------------------------->
<hr>
<!-------------------------------------기업회원일경우 글쓰기 가능----------------------------------------->
<c:if test="${RegistrationPossible== true}">
<div style="text-align:right">
<a href='form' class="btn btn-outline-dark btn-pill mb-1">글쓰기</a>
</div>
</c:if>
<!------------------------------------/기업회원일경우 글쓰기 가능----------------------------------------->
<br>
<br>
<br>
</div>


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>
<%-------------------------------------------더보기 ------------------------------------------------%>
var tag1 = document.getElementById("moreListBtn");
var tbody = document.querySelector("#listTable > tbody");

tag1.onclick = function() {
	var lastNo = parseInt(document.querySelector("#listTable > tbody > tr:last-child > td:nth-child(2)").innerHTML);
	console.log(lastNo);
	var xhr = new XMLHttpRequest();
	xhr.open('GET', 'list2?lastNo=' + lastNo, false);
	xhr.send();
	tbody.innerHTML = tbody.innerHTML + xhr.responseText;
};
<%------------------------------------------/더보기 ------------------------------------------------%>
<%------------------------------------------검색키업이벤트--------------------------------------------%>
 $(document).ready(function() {
	 $("#keyword").keyup(function() {
		 var k = $(this).val();
		 $("#listTable > tbody > tr").hide();
		 
		 var temp = $("#listTable > tbody > tr > td:nth-child(2n+1):contains('"+ k +"')");
   $(temp).parent().show();
		 })
	 
 })
<%-----------------------------------------/검색키업이벤트--------------------------------------------%>
</script>

