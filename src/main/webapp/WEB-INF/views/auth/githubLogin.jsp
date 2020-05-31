<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<section>
	<div class="container">
		<div class="row">

			<div>

				<h2 class="h4 font-weight-normal ml-4 text-muted" style="margin-bottom: 150px;">${provider_}에서
					${email_}로 가입된 내역이 있습니다.</h2>

				<div class="row">

					<div class="col-12 col-md-6 mt-4 ml-4">
						<form action="githubLinking" method="POST">
							<input name="provider" type="hidden" value=${provider_}> <input
								name="email" type="hidden" value=${email_}>
							<button type="submit" class="btn btn-primary btn-block">
								${provider_} 계정 연동하기</button>
						</form>
					</div>

					<div class="col-12 col-md-3 ml-7 mt-4 text-align-end text-center-xs">
						<a href="findPassword" class="btn btn-block"> 비밀번호 찾기 </a>
					</div>

				</div>


				<div class="p-4 p-0-xs rounded" data-aos="fade-in"
					data-aos-delay="150">
					<hr>
					<ul class="list-unstyled list-icons mb-0 fs--18">

						<li class="p-1"><i class="fi fi-arrow-end fs--13"></i> <a
							href="${pageContext.request.getContextPath()}/app/auth/loginForm"
							class="link-muted"> 로그인 페이지로 가기 </a></li>

						<li class="p-1"><i class="fi fi-arrow-end fs--13"></i> <a
							href="${pageContext.request.getContextPath()}" class="link-muted">
								메인페이지로 돌아가기 </a></li>

					</ul>


				</div>

			</div>

		</div>


	</div>
</section>
<hr>

<script>
var existEmail = '${email_}';
if (existEmail === null || existEmail === '') {
  window.location.replace("http://localhost:9999/portfoli/");
}
</script>