<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty jobPosting}">

	<!---------------------------------------content---------------------------------------------------->
	<div class="container">
		<br>
		<div style="width: 100%;">
			<!------------------------------------------제목---------------------------------------------------->
			<h4>${jobPosting.title}<br>
				<!------------------------------------------/제목--------------------------------------------------->
			</h4>
			<hr>

			<div class="row gutters-sm mb-3">
				<!-----------------------------------------지원자격 ------------------------------------------------->
				<div class="col-12 col-xl-6 mb-3">
					<div class="portlet">

						<div class="portlet-header">
							<span class="d-block text-dark text-truncate font-weight-medium"><h5>지원자격</h5></span>
						</div>

						<div class="portlet-body">
							<div class="row h-100 d-flex align-items-center">
								<div class="col my-3">
									<p class="text-gray-900 mb-1 ml-3">
										경력 <font style="color: orange;">${jobPosting.minimumCareer}
										</font>
									</p>
									<p class="text-gray-900 mb-1 ml-3">
										자격증 <font style="color: orange;">${jobPosting.certificate.name}</font>
									</p>
									<p class="text-gray-900 mb-1 ml-3">
										요구전공 <font style="color: orange;">${jobPosting.major.name}</font>
									</p>
									<p class="text-gray-900 mb-1 ml-3">
										최소학력 <font style="color: orange;">${jobPosting.finalEducation.category}</font>
									</p>
									<p class="text-gray-900 mb-1 ml-3">
										기술 <font style="color: orange;">${jobPosting.skill.name}</font>
									</p>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-----------------------------------------/지원자격 ------------------------------------------------->
				<br>
				<!-----------------------------------------근무조건 -------------------------------------------------->
				<div class="col-12 col-xl-6 mb-3">
					<div class="portlet">

						<div class="portlet-header">
							<span class="d-block text-dark text-truncate font-weight-medium"><h5>근무조건</h5></span>
						</div>

						<div class="portlet-body">
							<div class="row h-100 d-flex align-items-center">
								<div class="col my-3">
									<p class="text-gray-900 mb-1 ml-3">
										직무 <font style="color: orange;">${jobPosting.job}</font>
									</p>
									<p class="text-gray-900 mb-1 ml-3">
										고용형태 <font style="color: orange;">${jobPosting.employmentStatus.name}</font>
									</p>
									<p class="text-gray-900 mb-1 ml-3">
										지역 <font style="color: orange;">${jobPosting.district.name}</font>
									</p>
									<p class="text-gray-900 mb-1 ml-3">
										분야 <font style="color: orange;">${jobPosting.field.name}</font>
									</p>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!----------------------------------------/근무조건 -------------------------------------------------->
			</div>

			<br>
			<p style="text-align: right; font-color: black;">
				조회수: ${jobPosting.viewCount}<br>
			</p>
		</div>

		<br>

		<hr>
		<h3>상세요강</h3>
		<!------------------------------------------ 사진 -------------------------------------------------->
		<div>
			<c:forEach items="${jobPosting.files}" var="jobPostingFile">
				<img
					src="${pageContext.servletContext.contextPath}/upload/jobposting/${jobPostingFile.filePath}"
					width="100%">
			</c:forEach>
		</div>

		<!------------------------------------------ /사진 ------------------------------------------------->

		<!------------------------------------------ 내용 -------------------------------------------------->
		<div style="text-align: center">
			<textarea readonly rows="20" cols="130" style="border: none">${jobPosting.content}</textarea>
		</div>
		<!----------------------------------------- /내용 -------------------------------------------------->
		<br>
		<!----------------------------------------- 카카오맵-------------------------------------------->
     <div id="map" style="width:500px;height:400px;"></div>
    <!-----------------------------------------/카카오맵-------------------------------------------->
		<hr>

		<div class="row gutters-sm mb-3">
			<!----------------------------------------- 남은시간 ------------------------------------------------>
			<div class="col-12 col-xl-6 mb-3">
				<div class="portlet" style="text-align: center">

					<div class="portlet-header">
						<span class="d-block text-dark text-truncate font-weight-medium"><h4>남은시간</h4></span>
					</div>

					<div class="portlet-body">
						<div class="row h-100 d-flex align-items-center">
							<div class="col my-3">
								<p class="text-gray-900 mb-1 ml-3">
								<p id="timer" style="text-clolor: red"></p>
								시작일 | ${jobPosting.startDated} <br> 마감일 |
								${jobPosting.endDated}<br>

							</div>
						</div>
					</div>

				</div>
			</div>
			<!----------------------------------------- /남은시간 ------------------------------------------------>


			<!----------------------------------------- 지원방법 ------------------------------------------------>
			<div class="col-12 col-xl-6 mb-3">
				<div class="portlet">

					<div class="portlet-header">
						<span class="d-block text-dark text-truncate font-weight-medium text-center"><h4>지원방법</h4></span>
					</div>

					<div class="portlet-body">
						<div class="row h-100 d-flex align-items-center">
							<div class="col my-3">
								<p class="text-gray-900 mb-1 ml-3">
									기업명 <font style="color: orange;">${jobPosting.company.name}</font>
								</p>
								<p class="text-gray-900 mb-1 ml-3">
									지원방법 <font style="color: orange;">전화지원</font>
								</p>
								<p class="text-gray-900 mb-1 ml-3">
									담당자 <font style="color: orange;">${jobPosting.company.representative}</font>
								</p>
								<p class="text-gray-900 mb-1 ml-3">
									연락처 <font style="color: orange;">${jobPosting.tel}</font>
								</p>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!----------------------------------------- /지원방법 ------------------------------------------------>
		</div>
		<p>마감일은 기업의 사정, 조기마감 등으로 변경될 수 있습니다.</p>
		<hr>
		<!----------------------------------------- 수정삭제 ------------------------------------------------>
		<c:if test="${not empty modifiable}">
			<div style="text-align: center">
				<a href='updateForm?no=${jobPosting.jobPostingNumber}'
					class="btn btn-sm btn-outline-secondary btn-pill mb-3">수정</a>
				<a href='delete?no=${jobPosting.jobPostingNumber}' id="delBtn"
					class="btn btn-sm btn-outline-secondary btn-pill mb-3">삭제</a>
			</div>
		</c:if>
		<!----------------------------------------- /수정삭제 ------------------------------------------------>
		


	</div>
</c:if>
<!---------------------------------------/content--------------------------------------------------->

<c:if test="${empty jobPosting}">
	<p>해당 공고가 없습니다.</p>
</c:if>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=126304aee8e06ce802d9561ab754dba4"></script>
<script>
<%------------------------------------------카카오맵 ------------------------------------------------%>
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(33.450701, 126.570667),
		level : 3
	};

	var map = new kakao.maps.Map(container, options);
<%-----------------------------------------/카카오맵 ------------------------------------------------%>
</script>
<script>
	<%------------------------------------------타이머 ------------------------------------------------%>
	//마감일
	var endDate = new Date('${jobPosting.endDated}');
	endDate.setHours(0, 0, 0, 0);
	console.log(endDate);
	//남은 날짜
	var now = new Date();
	var gap = now.getTime() - endDate.getTime();
	var result = Math.floor(gap / (1000 * 60 * 60 * 24)) * -1;

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
<%------------------------------------------/타이머 ------------------------------------------------%>

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
