<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<title>Portfoli</title>
<meta name="description" content="...">

<meta name="viewport"
	content="width=device-width, maximum-scale=5, initial-scale=1, user-scalable=0">
<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>

<!-- up to 10% speed up for external res -->
<link rel="dns-prefetch" href="https://fonts.googleapis.com/">
<link rel="dns-prefetch" href="https://fonts.gstatic.com/">
<link rel="preconnect" href="https://fonts.googleapis.com/">
<link rel="preconnect" href="https://fonts.gstatic.com/">
<!-- preloading icon font is helping to speed up a little bit -->
<link rel="preload"
	href="../../resources/assets/fonts/flaticon/Flaticon.woff2" as="font"
	type="font/woff2" crossorigin>

<link rel="stylesheet" href="../../resources/assets/css/core.min.css">
<link rel="stylesheet"
	href="../../resources/assets/css/vendor_bundle.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&amp;display=swap">

<!-- favicon -->
<link rel="shortcut icon" href="../../favicon.ico">
<link rel="apple-touch-icon" href="demo.files/logo/icon_512x512.png">

<link rel="manifest"
	href="../../resources/assets/images/manifest/manifest.json">
<meta name="theme-color" content="#377dff">

</head>
<body>

	<div id="wrapper">


		<!-- light logo -->
		<a aria-label="go back" href="../../index.html"
			class="position-absolute top-0 start-0 my-2 mx-4 z-index-3 h--70 d-inline-flex align-items-center">
			<img src="../../resources/assets/images/logo/logo.png"
			width="110" height="32" alt="...">
		</a>


		<div class="d-lg-flex text-white min-h-100vh"
			style="background: linear-gradient(180deg, #42404e 0, #1b1e29);">

			<div class="col-12 col-lg-5 d-lg-flex">
				<div class="w-100 align-self-center">


					<div class="py-7">
						<h1
							class="d-inline-block text-align-end text-center-md text-center-xs display-4 h2-xs w-100 max-w-600 w-100-md w-100-xs">
							Board 입력 <span class="display-3 h1-xs d-block font-weight-medium">
								테스트용 </span>
						</h1>
					</div>


				</div>
			</div>


			<div class="col-12 col-lg-7 d-lg-flex">
				<div
					class="w-100 align-self-center text-center-md text-center-xs py-2">


					<!-- optional class: .form-control-pill -->
					<form action="addForm" method="POST"
						class="bs-validate p-5 py-6 rounded d-inline-block bg-white text-dark w-100 max-w-600"
						data-error-toast-text="<i class='fi fi-circle-spin fi-spin float-start'></i> Please, complete all required fields!"
						data-error-toast-delay="3000"
						data-error-toast-position="top-right" data-error-scroll-up="true">

						<!--
              <p class="text-danger">
                Ups! Please check again
              </p>
              -->


						<div class="form-label-group mb-3">
							<input required placeholder="타이틀" name="title" type="text"
								class="form-control"> <label for="account_id">타이틀</label>
						</div>

						<div class="input-group-over">
							<div class="form-label-group mb-3">
								<input required placeholder="콘텐트" name="content" type="text"
									class="form-control"> <label for="account_email">콘텐트</label>
							</div>
						</div>

						<div class="form-label-group mb-3">
							<input required placeholder="뷰카운트" name="viewCount"
								type="number" class="form-control"> <label
								for="account_password">뷰카운트(숫자)</label>
						</div>

						<div class="form-label-group mb-3">
							<input required placeholder="등록일" name="registeredDate" type="date"
								class="form-control"> <label for="account_name">등록일</label>
						</div>

						<div class="form-label-group mb-3">
							<input required placeholder="첨부파일" name="attachment" type="text"
								class="form-control"> <label for="account_id">첨부파일</label>
						</div>

						<div class="clearfix bg-light position-relative rounded p-4 mb-4">
							<span class="text-muted fs--15 d-block m-2"> 🖊 이거 그냥 샘플임
							</span>
						</div>

						<div class="row">

							<div class="col-12 col-md-8">
								<button type="submit" class="btn btn-primary btn-block" style="display: block; margin: 0 90px;">
									입력하기</button>
							</div>

							<div class="col-12 col-md-6 mb-4 text-align-end text-center-xs">
								<!-- empty -->
							</div>

						</div>

					</form>

				</div>
			</div>



		</div>

	</div>
	<!-- /#wrapper -->

	<script src="../../resources/assets/js/core.min.js"></script>

</body>
</html>