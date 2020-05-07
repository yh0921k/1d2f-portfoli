<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
	errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  response.setStatus(200);
%>

<jsp:include page="../header.jsp" />

<script>
	
</script>

<section>
	<div class="container">


		<div class="row">

			<div
				class="col-12 col-sm-12 offset-sm-0 col-md-8 offset-md-2 col-lg-6 offset-lg-0 order-2 order-lg-1 mb-5">

				<h2 class="h4 mb-4 font-weight-normal ml-4 text-muted">${error}</h2>
				<!-- <h2 class="h4 mb-4 font-weight-normal ml-4 text-muted">${requestScope['javax.servlet.error.message']}</h2> -->
				
				<div class="p-4 p-0-xs rounded" data-aos="fade-in"
					data-aos-delay="150">
					<hr>
					<h2 class="fs--20 mb-2 mt-4 text-muted font-weight-light">다음으로
						돌아가주세요:</h2>
					<ul class="list-unstyled list-icons mb-0 fs--18">
						<li class="p-1"><i class="fi fi-arrow-end fs--13"></i> <a
							href="${pageContext.request.getContextPath()}" class="link-muted">
								메인페이지 </a></li>

						<li class="p-1"><i class="fi fi-arrow-end fs--13"></i> <a
							href="${pageContext.request.getContextPath()}/app/service/center"
							class="link-muted"> 고객센터 </a></li>

					</ul>


				</div>

			</div>

		</div>


	</div>
</section>
<hr>
<pre style="background-color: white; color: black;">${errorDetail}</pre>
<jsp:include page="../footer.jsp" />