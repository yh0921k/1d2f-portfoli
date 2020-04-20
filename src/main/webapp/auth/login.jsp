<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
	errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/header.jsp" />

<section class="bg-light p-0">
	<div class="container py-5" style="height: 550px">

		<h1>로그인 결과</h1>
		<c:if test="${not empty loginUser}">
			<p>'${loginUser.name}'님 환영합니다.</p>
		</c:if>

		<c:if test="${empty loginUser}">
			<p>사용자 정보가 유효하지 않습니다.</p>
		</c:if>

	</div>
</section>

<jsp:include page="/footer.jsp" />