<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
	errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../header.jsp" />

<script>

</script>

<div style="margin: 100px;">
	<br>
	<h3>환영합니다!</h3>
	<br>
	<p>회원가입이 정상적으로 이루어 졌습니다.</p>
	<br>
	<p>로그인 하시면 홈페이지 내의 모든 서비스를 이용하실 수 있습니다.</p>
	<br> <a href="${pageContext.request.getContextPath()}/">메인 페이지로
		이동하기</a>
</div>

<jsp:include page="../footer.jsp" />