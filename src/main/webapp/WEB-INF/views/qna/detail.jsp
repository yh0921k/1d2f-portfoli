<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		<div class="portlet mt--20" style="width: 65%;">

			<div class="portlet-header">
				<h1 class="d-none d-lg-block m--3">Q&A</h1>
				<div align="right" class="container-fluid">
					<a href="/portfoli/app/qna/update?no=${qna.number}"><button type="button"
							class="btn btn-outline-secondary btn-pill btn-sm">수정</button></a> <a
						href="/portfoli/app/qna/delete?no=${qna.number}"><button
							type="button"
							class="btn btn-outline-secondary btn-pill btn-sm ml-2">삭제</button></a>
				</div>
			</div>
			<p class="text-gray-900 mb-1 ml-3">카테고리 : ${qna.category.name}</p>
			<p class="text-gray-900 mb-1 ml-3">작성자 : ${qna.writer}</p>
			<p class="text-gray-900 mb-1 ml-3">작성일시 : ${qna.registeredDate}</p>
			<p class="text-gray-900 mb-1 ml-3">조회수 : ${qna.viewCount}</p>

			<p class="text-gray-900 mb-1 ml-3">제목 : ${qna.title}</p>

			<p class="text-gray-900 mb-1 ml-3">내용 :</p>
			<div class="border m-3 p-3 rounded" style="min-height: 200px;">
				<p style="white-space: pre-wrap;" class="text-gray-900">${qna.content}</p>
			</div>
			<c:if test="${!empty qna.answer}">
			<div class="row mb-0 ml-3">
			<h6><i class="fi fi-arrow-right"></i>답변</h6>
			<p class="mb-0 ml-3"><small><fmt:formatDate var="registeredDate" value="${qna.answerDate}" pattern="yyyy.MM.dd HH:mm:ss"/> ${qna.answerDate}</small></p>
			</div>
			<div class="border ml-3 mr-3 mb-3 p-3 rounded" style="min-height: 200px;">
				<p style="white-space: pre-wrap;" class="text-gray-900">${qna.answer}</p>
			</div>
			</c:if>
			</div>

	</div>
	<!-------------------------------------------- /contents -------------------------------------------------->
</div>
</div>
