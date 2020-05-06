<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../header.jsp" />

<script>
	
</script>

<section>
	<div class="container">


		<div class="row">

			<div
				class="col-12 col-sm-12 offset-sm-0 col-md-8 offset-md-2 col-lg-6 offset-lg-0 order-2 order-lg-1 mb-5">

				<h1>콜백 페이지</h1>
				<pre>${res}</pre>
				<!-- {"access_token":"AAAANW11XYX1ItTWOT_X7cGe7cXrCwOqjEuBpQraNSMxytGYYdxPtljATy18q21-A57xi1jZQDs34pSOp0OsU6aisxI",
				      "refresh_token":"UUW4qcNpTh2zezvpoYuDayLzjH0v1Rarb78XvlprhFKTVzgz4dgmAOAiikQDNsC2pPqoHheyA0UuKsPZWeuKXfbsaomgwTulfGunWUHfisqe4ie",
				      "token_type":"bearer",
				      "expires_in":"3600"} -->
				<a href="/portfoli">go to main page</a>


			</div>

		</div>


	</div>
</section>
<hr>
<pre style="background-color: white; color: black;">${errorDetail}</pre>
<jsp:include page="../footer.jsp" />