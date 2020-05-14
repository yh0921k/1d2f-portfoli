<%@ page import="com.portfoli.domain.JobPosting"%>
<%@ page import="com.portfoli.domain.JobPostingFile"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../header.jsp" />


<div class="container" style="text-align:center" >
<h1 style="text-align:left">채용정보</h1>
<div id="searchForm" style="text-align:right">
<form action='search' method='get' >
	<input id='keyword' name='keyword' type='text' >
	
	<button aria-label="Global Search" type="submit"
                  class="btn bg-transparent shadow-none m-0 px-2 py-1 text-muted">
                  <i class="fi fi-search fs--20"></i>
                </button>
</form>
</div>
<hr>

<div>
<table id="listTable" class="table table-striped table-hover">
	<thead>
	  <th></th>
		<th>no</th>
		<th>제목</th>
		<th>내용</th>
		<th>등록일</th>
		<th>조회수</th>
	</thead>

	<tbody>
	<c:forEach items="${list}" var="item" varStatus="status">
    <tr id="tList">
    <td><a href='detail?no=${item.jobPostingNumber}'><c:forEach items="${item.files}" var="jobPostingFile">
      <img src="../../upload/jobposting/${jobPostingFile.filePath}_300x300.jpg" width="100" height="100">
      </c:forEach></td>
			<td>${item.jobPostingNumber}</td>			
			<td><a href='detail?no=${item.jobPostingNumber}'>${item.title}</a></td>
			<td>${item.content}</td>
			<td>${item.postingRegistration}</td>
			<td>${item.viewCount}</td>
		</tr>
	</c:forEach>
  </tbody>
</table>
</div>

<button id="moreListBtn" class="btn btn-outline-dark btn-pill mb-1 btn-block">더보기</button>

<hr>

<c:if test="${not empty loginUser}">
<div style="text-align:right">
<a href='form' class="btn btn-outline-dark btn-pill mb-1">글쓰기</a>
</div>
</c:if>
<br>
<br>
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

