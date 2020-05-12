<%@ page import="com.portfoli.domain.JobPosting"%>
<%@ page import="com.portfoli.domain.JobPostingFile"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../header.jsp" />


<div class="container">
<h1>채용정보</h1>
<div id="searchForm" style="text-align:right">
<form action='search' method='get' >
	<input id='keyword' name='keyword' type='text' >
	<button>검색</button> 
</form>
</div>
<hr>

<div style="text-align:center">
<table id="listTable" class="table table-striped table-hover">
	<thead>
	  <th></th>
		<th>no</th>
		<th>제목</th>
		<th>내용</th>
		<!--  <th>최소경력</th>-->
		<!--  <th>직무</th> -->
		<!--  <th>연봉</th> -->
		<th>시작일</th>
		<th>마감일</th>
		<th>조회수</th>
	</thead>

	<tbody>
	<c:forEach items="${list}" var="item" varStatus="status">
    <tr id="tList">
    <td><a href='detail?no=${item.jobPostingNumber}'><c:forEach items="${item.files}" var="jobPostingFile">
      <img src="../../upload/jobposting/${jobPostingFile.filePath}_300x300.jpg" width="200" height="200">
      </c:forEach></td>
			<td>${item.jobPostingNumber}</td>			
			<td><a href='detail?no=${item.jobPostingNumber}'>${item.title}</a></td>
			<td>${item.content}</td>
			<!-- <td>${item.minimumCareer}</td> -->
			<!-- <td>${item.job}</td> -->
			<!-- <td>${item.yearSalary}</td> -->
			<td>${item.startDated}</td>
			<td>${item.endDated}</td>
			<td>${item.viewCount}</td>
		</tr>
	</c:forEach>
  </tbody>
</table>
</div>

<button id="moreListBtn" class="btn btn-primary btn-lg btn-block">더보기</button>

<hr>

<c:if test="${not empty loginUser}">
<div style="text-align:right">
<a href='form' class="btn btn-primary pull-right">글쓰기</a>
</div>
</c:if>

<br>
</div>


<script src="https://code.jquery.com/jquery-2.2.1.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>

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

 $(document).ready(function() {
	 $("#keyword").keyup(function() {
		 var k = $(this).val();
		 $("#listTable > tbody > tr").hide();
		 
		 var temp = $("#listTable > tbody > tr > td:nth-child(2n+1):contains('"+ k +"')");
   $(temp).parent().show();
		 })
	 
 })

</script>

<jsp:include page="../footer.jsp" />

