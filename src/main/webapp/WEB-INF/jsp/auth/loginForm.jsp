<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<title>Portfoli</title>
<meta name="description" content="..." />

<meta name="viewport"
	content="width=device-width, maximum-scale=5, initial-scale=1, user-scalable=0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<!-- up to 10% speed up for external res -->
<link rel="dns-prefetch" href="https://fonts.googleapis.com/" />
<link rel="dns-prefetch" href="https://fonts.gstatic.com/" />
<link rel="preconnect" href="https://fonts.googleapis.com/" />
<link rel="preconnect" href="https://fonts.gstatic.com/" />
<!-- preloading icon font is helping to speed up a little bit -->
<link rel="preload"
	href="../../resources/assets/fonts/flaticon/Flaticon.woff2" as="font"
	type="font/woff2" crossorigin />

<link rel="stylesheet" href="../../resources/assets/css/core.min.css" />
<link rel="stylesheet"
	href="../../resources/assets/css/vendor_bundle.min.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&amp;display=swap" />

<!-- favicon -->
<link rel="shortcut icon" href="favicon.ico" />
<link rel="apple-touch-icon" href="demo.files/logo/icon_512x512.png" />

<link rel="manifest"
	href="../../resources/assets/images/manifest/manifest.json" />
<meta name="theme-color" content="#377dff" />
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="918378045290-rmpud779f5h155ifo0mrvj08edqtqdt2.apps.googleusercontent.com">
</head>

<body>
	<div id="wrapper">
		<!-- light logo -->
		<a aria-label="go back" href="/portfoli"
			class="position-absolute top-0 start-0 my-2 mx-4 z-index-3 h--70 d-inline-flex align-items-center">
			<img src="../../resources/assets/images/logo/logo.png" width="110"
			alt="..." />
		</a>

		<!-- you might like more this:    linear-gradient(180deg,#2f2e80 0,#4c4bb5);    -->
		<div class="d-lg-flex text-white min-h-100vh"
			style="background: linear-gradient(180deg, #42404e 0, #1b1e29);">
			<div class="col-12 col-lg-5 d-lg-flex">
				<div class="w-100 align-self-center">
					<div class="py-7">
						<h1
							class="d-inline-block text-align-end text-center-md text-center-xs display-4 h2-xs w-100 max-w-600 w-100-md w-100-xs">
							Sign in <span class="display-3 h1-xs d-block font-weight-medium">
								Portfoli </span>
						</h1>
					</div>
				</div>
			</div>

			<div class="col-12 col-lg-7 d-lg-flex">
				<div
					class="w-100 align-self-center text-center-md text-center-xs py-2">

					<!-- optional class: .form-control-pill -->
					<form action="login" method="POST"
						class="bs-validate p-5 py-6 rounded d-inline-block bg-white text-dark w-100 max-w-600">
						<div class="row" style="margin: 0px 0px 20px 0px;">

							<!-- <div class="col-6">
								<div class="btn btn-sm btn-block btn-facebook transition-hover-top" onclick="facebook();"> <i class="fi fi-social-facebook"></i>facebook</a></div>
							</div>   -->

<div class="col-6">
								<script type="text/javascript"></script>
								<div class="fb-login-button transition-hover-top"
								  data-width="220px"
								  data-max-rows="1"
								  data-size="large" 
								  data-button-type="login_with" 
								  data-auto-logout-link="false" 
								  data-use-continue-as="true" 
								  data-scope="public_profile,email" 
								  onlogin="checkLoginState();"></div>
</div>

							<div class="col-6">
								<div
									class="btn btn-sm btn-block bg-googleplay transition-hover-top text-white"
									onclick="google();">
									<i>G</i> google
								</div>
							</div>
							<div class="g-signin2 col-6" data-onsuccess="onSignIn"
								style="display: none;"></div>

	   <div class="col-6">
								<a href="${naverApiURL}"> <img class="transition-hover-top" width="240" height="42" src="../../resources/assets/images/naver_green.PNG" /></a>
</div>

						</div>
						<div class="form-label-group mb-3">
							<input required placeholder="Email" name="email" type="text"
								class="form-control" value="${email}" /> <label
								for="account_email">아이디 혹은 이메일을 입력해주세요</label> <input
								type="checkbox" name="saveEmail"
								style="color: graytext; margin: 10px 0px 0px 0px;" checked />
							아이디 저장해두기<br />
						</div>

						<div class="input-group-over">
							<div class="form-label-group mb-3">
								<input required placeholder="Password" name="password"
									type="password" class="form-control" /> <label
									for="account_password">비밀번호를 입력해주세요</label>
							</div>

							<a href="findPassword" class="btn fs--12"> 비밀번호를 잊어버리셨습니까? </a>
						</div>

						<div class="row">
							<div class="col-12 col-md-6 mt-4">
								<button type="submit"
									class="btn btn-primary btn-block transition-hover-top">
									로그인</button>
							</div>

							<div class="col-12 col-md-6 mt-4 text-align-end text-center-xs">
								<a href="../member/generalJoin" class="btn px-0"> 아직 계정이
									없으신가요? </a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->

	<script>
		//
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "https://connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
			console.log("async() 호출");
		}(document, 'script', 'facebook-jssdk'));

		//
		function google() {
			$(".abcRioButton").trigger("click");
		}
		//
		function facebook() {
			console.log("facebook()");
		}

		//
		function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();

			var id_token = googleUser.getAuthResponse().id_token;
			var xhr = new XMLHttpRequest();
			xhr.open('POST', 'googleLogin');
			xhr.setRequestHeader('Content-Type',
					'application/x-www-form-urlencoded');
			xhr.send('idtoken=' + id_token);
			//xhr.onload = function() {
			//console.log('Signed in as: ' + xhr.responseText);
			//};

			console.log('id_token' + id_token);
			console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			console.log('Name: ' + profile.getName());
			console.log('Image URL: ' + profile.getImageUrl());
			console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.

			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {
				console.log('User signed out.');
			});

			location.href = "googleLogin?googleToken=" + id_token;
		}

		//
		window.fbAsyncInit = function() {
			FB.init({
				appId : '2546382545624738',
				cookie : true,
				xfbml : true,
				version : 'v7.0'
			});
			FB.AppEvents.logPageView();
		};
		
		//

		//
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});

		//
		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}
		
		//
		function statusChangeCallback(response) {
            if (response.status === 'connected') { // Logged into your app and Facebook.
                	 var accessToken = response.authResponse.accessToken;
                FB.api('/me?fields=id,name,email', function (response) {
                    console.log('name: ' + response.name);
                    console.log('email: ' + response.email);
                    console.log('userID: ' + response.id);
                    console.log('accessToken: ' + accessToken);
                    location.href="facebookLogin?facebookToken=" + accessToken;
                });
            } else { // The person is not logged into your app or we are unable to tell.
                console.log('Please log into this app.');
            }
		}
		
	</script>

	<script src="../../resources/assets/js/core.min.js"></script>
</body>
</html>
