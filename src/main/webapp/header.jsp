<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Portfoli</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous" />
<link rel="stylesheet" type="text/css" media="screen"
	href="../styles/style.css" />
<script src="https://kit.fontawesome.com/b0886ff529.js" crossorigin="anonymous"></script>
<script src="../js/main.js"></script>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<a href="#"><img class="logo" src="../images/logo.png"
					alt="logo"></a>
			</div>
			<div class="col-md-8">
				<div class="s003">
					<form>
						<div class="inner-form">
							<div class="input-field first-wrap">
								<div class="input-select">
									<select data-trigger="" name="choices-single-defaul">
										<option placeholder="">전체</option>
										<option>포트폴리오</option>
										<option>채용정보</option>
										<option>기업</option>
									</select>
								</div>
							</div>
							<div class="input-field second-wrap">
								<input id="search" type="text" placeholder="검색" />
							</div>
							<div class="input-field third-wrap">
								<button class="btn-search" type="button">
									<svg class="svg-inline--fa fa-search fa-w-16"
										aria-hidden="true" data-prefix="fas" data-icon="search"
										role="img" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 512 512">
                          <path fill="currentColor"
											d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path>
                        </svg>
								</button>
							</div>
						</div>
					</form>
				</div>
				<script src="../js/extention/choices.js"></script>
				<script>
                const choices = new Choices('[data-trigger]',
                {
                  searchEnabled: false,
                  itemSelectText: '',
                });
            </script>
			</div>
			<div class="col-md-2" style="margin-top: 10px;">
				<a href="generalMember/join"><button type="button" class="btn btn-link text-muted"
					style="font-size: 14px;">회원가입</button></a>
				<button type="button"
						class="btn btn-link text-muted" style="font-size: 14px;">로그인</button>
			</div>
		</div>
		<hr>