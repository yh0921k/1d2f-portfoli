<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
	errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta name="theme-color" content="#377dff">

<!-- PAGE TITLE -->
<section class="bg-light p-0">
	<div class="container py-5">
		<h1 class="h3">기업 확인</h1>
		<p>해당 사업자등록번호 조회 불가</p>
	</div>
</section>
<!-- /PAGE TITLE -->

<!-- FORM -->
<section>
	<div class="container">


		<div class="row">

			<div
				class="col-12 col-sm-8 col-md-8 col-lg-6 offset-sm-2 offset-md-2 offset-lg-3">


				<!-- optional class: .form-control-pill -->
				<form class="bs-validate p-5 rounded shadow-xs" novalidate
					method="post" action="add"
					data-error-toast-text="<i class='fi fi-circle-spin fi-spin float-start'></i> Please, complete all required fields!"
					data-error-toast-delay="3000" data-error-toast-position="top-right">


					<!--
                <p class="text-danger">
                  Ups! Please check again
                </p>
                -->


					<div class="form-label-group mb-3">
						<input required placeholder="사업자등록번호" readonly
							name="businessRegistrationNumber" type="text"
							class="form-control" value="${businessRegistrationNumber}" /> <label
							for="businessRegistrationNumber">사업자등록번호</label>
					</div>

					<div class="form-label-group mb-3">
						<input required placeholder="기업명" id="name" name="name"
							type="text" class="form-control"> <label for="name">기업명</label>
					</div>

					<div class="form-label-group mb-3">
						<input required placeholder="기업 전화번호" id="tel" name="tel"
							type="text" class="form-control phoneNumber"> <label
							for="account_email">기업 전화번호</label>
					</div>

					<div class="form-label-group mb-3">
						<input placeholder="대표자" id="representative" name="representative"
							type="text" class="form-control"> <label
							for="representative">대표자명</label>
					</div>




					<!-- GDPR CONSENT -->
					<div class="clearfix bg-light position-relative rounded p-4 mb-4">

						<span
							class="text-muted fs--12 d-block position-absolute bottom-0 end-0 m-2">
							Portfoli </span> <label class="form-checkbox form-checkbox-primary">
							<input required type="checkbox" name="checkbox"> <i></i>
							<span> 상기 등록 내용을 확인하였습니다. </span>
						</label>

					</div>
					<!-- /GDPR CONSENT -->

					<div class="row">

						<div class="col-12 col-md-6 mt-4">
							<button type="submit" class="btn btn-primary btn-block">
								등록하기</button>
						</div>

						<div class="col-12 col-md-6 mt-4 text-align-end text-center-xs">
							<!-- empty -->
						</div>

					</div>

				</form>

			</div>

		</div>


	</div>
</section>
<!-- /FORM -->

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
$(document).on("keyup", ".phoneNumber", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-") ); });

</script>
