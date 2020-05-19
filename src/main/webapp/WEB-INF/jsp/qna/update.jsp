<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../header.jsp" />

<div class="container-fluid">
	<div class="row">
		<!--------------------------------------- nav bar ----------------------------------------------->

		<div class="col-lg-3 mb-5 h--600 border-right ml--20 mr-5 mt--20">
			<!-- CATEGORIES -->
			<nav class="nav-deep nav-deep-light mb-2">
				<!-- mobile only -->
				<button
					class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
					data-target="#nav_responsive"
					data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
					<span class="group-icon px-2 py-2 float-start"> <i
						class="fi fi-bars-2"></i> <i class="fi fi-close"></i>
					</span> <span class="h5 py-2 m-0 float-start"> Customer Center </span>
				</button>

				<!-- desktop only -->
				<h3 class="h3 pt-3 pb-3 m-0 d-none d-lg-block ml-3">Customer
					Center</h3>
				<!-- navigation -->
				<ul id="nav_responsive"
					class="nav flex-column d-none d-lg-block font-weight-bold">

					<li class="nav-item mb-2"><a class="nav-link"
						href="/portfoli/app/notice/list"> <span
							class="px-2 d-inline-block"> 공지사항 </span>
					</a></li>

					<li class="nav-item mb-2"><a class="nav-link"
						href="/portfoli/app/faq/list"> <span
							class="px-2 d-inline-block"> FAQ </span>
					</a></li>

					<li class="nav-item active mb-2"><a class="nav-link"
						href="/portfoli/app/qna/list"> <span
							class="px-2 d-inline-block"> Q&A </span>
					</a></li>

					<li class="nav-item mb-2"><a class="nav-link"
						href="/portfoli/app/report/list"> <span
							class="px-2 d-inline-block"> 신고 </span>
					</a></li>

				</ul>
			</nav>
			<!-- /CATEGORIES -->
		</div>

		<!--------------------------------------------- /nav bar ------------------------------------------------>

		<!-------------------------------------------- contents -------------------------------------------------->
		<div class="portlet mt--20 p-3" style="width: 65%;">

			<div class="portlet-header">
				<h1 class="d-none d-lg-block">Q&A</h1>

			</div>
			<form action="update" method="post">
				<input type="hidden" name="number" value="${qna.number}">
				<div class="row">
					<span class="text-gray-900 mt--12 mr--5" style="margin-left: 30px;">카테고리
						: </span> <select id="select_options2" name="category.number"
						class="form-control form-control-sm col-md-3">
						<c:forEach items="${categories}" var="category">
							<c:if test="${qna.category.name == category.name}">
								<option value="${category.number}" selected="selected">${category.name}</option>
							</c:if>
							<c:if test="${qna.category.name != category.name}">
								<option value="${category.number}">${category.name}</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
				<p class="text-gray-900 mb-1 ml-3">작성자 : ${qna.writer}</p>
				<p class="text-gray-900 mb-1 ml-3">작성일시 : ${qna.registeredDate}</p>
				<p class="text-gray-900 mb-1 ml-3">조회수 : ${qna.viewCount}</p>
				<div class="container-fluid">
					<span class="text-gray-900">제목 : </span> <input required
						type="text"
						class="form-label-group form-control-clean col-md-11 mt--5"
						name="title" value="${qna.title}">

					<p class="text-gray-900 mt-3">내용 :</p>

					<textarea required placeholder="문의하실 내용을 적어주세요." id="description"
						name="content" class="form-control" rows="6">${qna.content}</textarea>

					<div class="row">
						<label
							class="form-switch form-switch-pill form-switch-primary d-block mt-3  ml-3">
							<c:if test="${qna.readable == '1'}">
								<input type="checkbox" id="readable" name="readable" checked>
							</c:if> <c:if test="${qna.readable == '0'}">
								<input type="checkbox" id="readable" name="readable">
							</c:if> <i data-on="OK" data-off="NO"></i> <span class="h6">게시글
								공개 여부</span>
						</label>
						<div class="custom-control custom-checkbox mt-3 ml--30">
							<c:if test="${qna.emailNoti == '1'}">
								<input type="checkbox" class="custom-control-input"
									id="emailNoti" name="emailNoti" checked>
							</c:if>
							<c:if test="${qna.emailNoti == '0'}">
								<input type="checkbox" class="custom-control-input"
									id="emailNoti" name="emailNoti">
							</c:if>
							<label class="custom-control-label" for="emailNoti">답변 완료
								시 이메일 발송</label>
						</div>
					</div>

					<div align="right" class="container-fluid">
						<button type="submit"
							class="btn btn-outline-secondary btn-pill btn-sm mt-3">
							수정하기</button>

					</div>
				</div>
			</form>
		</div>
		<!-------------------------------------------- /contents -------------------------------------------------->
	</div>
</div>

<jsp:include page="../footer.jsp" />

<script>
	
function checkbox()
$('input[type="checkbox"]').change(function(){
    this.value = (Number(this.checked));
});
</script>