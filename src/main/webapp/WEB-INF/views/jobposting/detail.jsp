<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty jobPosting}">
	<div class="container" style="width: 100%; height: 1900px;">
		<br>
		<h5>채용정보</h5>
		<div style="width: 100%;">
			<h4>${jobPosting.title}<br>
			</h4>
			<hr>

			<div style="width: 50%;">
				<h5>지원자격</h5>
				<p class="text-gray-900 mb-1 ml-3">경력 :
					${jobPosting.minimumCareer} 년 이상</p>
			</div>
			<br>

			<div style="width: 50%;">
				<h5>근무조건</h5>
				<p class="text-gray-900 mb-1 ml-3">직무 : ${jobPosting.job}</p>
				<p class="text-gray-900 mb-1 ml-3">고용형태 : ${jobPosting.employmentStatus.name}</p>
				<p class="text-gray-900 mb-1 ml-3">자격증 : ${jobPosting.certificate.name}</p>
				<p class="text-gray-900 mb-1 ml-3">요구전공 : ${jobPosting.major.name}</p>
        <p class="text-gray-900 mb-1 ml-3">지역 : ${jobPosting.district.name}</p>
        <p class="text-gray-900 mb-1 ml-3">최소학력 : ${jobPosting.finalEducation.category}</p>
			</div>
			<br>
			<p style="text-align: right; font-color: black;">
				조회수: ${jobPosting.viewCount}<br>
			</p>
		</div>

		<br>

		<hr>
		<h3>상세요강</h3>
		<p>
			<c:forEach items="${jobPosting.files}" var="jobPostingFile">
				<img
					src="${pageContext.servletContext.contextPath}/upload/jobposting/${jobPostingFile.filePath}"
					width="100%" height="600">
			</c:forEach>
		</p>

		<div style="text-align: center">
			<textarea readonly rows="20" cols="130">${jobPosting.content}</textarea>
		</div>

		<br>

		<hr>

		<div
			style="text-align: center; width: 25%; height: 180px; padding: 5px;">
			<h4>남은시간</h4>
			<p id="timer" style="text-clolor: red"></p>

			시작일 | ${jobPosting.startDated}<br> 마감일 | ${jobPosting.endDated}<br>
		</div>
		<hr>

		<c:if test="${not empty modifiable}">
			<div style="text-align: right">
				<a href='updateForm?no=${jobPosting.jobPostingNumber}'
					class="btn btn-outline-dark btn-pill mb-1">수정</a>
			</div>
			<div style="text-align: right">
				<a href='delete?no=${jobPosting.jobPostingNumber}' id="delBtn"
					class="btn btn-outline-dark btn-pill mb-1">삭제</a>
			</div>
		</c:if>
		
	</div>
</c:if>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<c:if test="${empty jobPosting}">
	<p>해당 공고가 없습니다.</p>
</c:if>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script>
	//마감일
	var endDate = new Date('${jobPosting.endDated}');
	endDate.setHours(0, 0, 0, 0);
	console.log(endDate);
	//남은 날짜
	var now = new Date();
	var gap = now.getTime() - endDate.getTime();
	var result = Math.floor(gap / (1000 * 60 * 60 * 24)) * -1;

	//타이머 시작
	$(document).ready(function() {
		tid = setInterval('msg_time()', 1000); // 타이머 1초간격으로 수행
	});

	var stDate = new Date();
	var edDate = new Date(endDate).getTime(); // 종료날짜
	var RemainDate = edDate - stDate;

	function msg_time() {
		var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24))
				/ (1000 * 60 * 60));
		var miniutes = Math
				.floor((RemainDate % (1000 * 60 * 60)) / (1000 * 60));
		var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);

		if (hours < 10)
			hours = "0" + hours;

		if (miniutes < 10)
			miniutes = "0" + miniutes;

		if (seconds < 10)
			seconds = "0" + seconds;

		m = result - 1 + "일  " + hours + ":" + miniutes + ":" + seconds; // 남은 시간 text형태로 변경

		document.all.timer.innerHTML = "<b><font color='red' size='6px'>" + m
				+ "</font></b>"; // div 영역에 보여줌

		if (RemainDate < 0) {
			// 시간이 종료 되었으면
			clearInterval(tid); // 타이머 해제
		} else {
			RemainDate = RemainDate - 1000; // 남은시간 -1초
		}
	}
	//타이머 끝

	var delBtn = document.getElementById("delBtn");
	delBtn.onclick = function() {
		Swal.fire({
			title : '삭제되었습니다.',
			icon : 'success',
			timer : 3000,
			confirmButtonText : '확인'
		})
	};
</script>
