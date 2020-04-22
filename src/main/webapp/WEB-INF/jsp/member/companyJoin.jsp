<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

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
<link rel="shortcut icon"
  href="http://localhost:9999/portfoli/favicon.ico" />
<link rel="apple-touch-icon" href="demo.files/logo/icon_512x512.png" />

<link rel="manifest"
  href="../../resources/assets/images/manifest/manifest.json" />

<script>
      function isSame() {
        var password = document.getElementById("password").value;
        var checkPassword = document.getElementById("checkPassword").value;

        if (password.length < 6 || password.length > 16) {
          password = null;
          checkPassword = null;
          document.getElementById("same").innerHTML = null;
          window.alert("비밀번호는 6글자 이상, 16글자 이하만 사용 가능합니다.");
        } else {
          if (password != "" && checkPassword != "") {
            if (password === checkPassword) {
              document.getElementById("same").innerHTML =
                "비밀번호가 일치합니다.";
              document.getElementById("same").style.color = "blue";
            } else {
              document.getElementById("same").innerHTML =
                "비밀번호가 일치하지 않습니다.";
              document.getElementById("same").style.color = "red";
            }
          }
        }
      }
    </script>

<meta name="theme-color" content="#377dff" />
</head>
<body>
  <div id="wrapper">
    <!-- light logo -->
    <a aria-label="go back" href="/portfoli"
      class="position-absolute top-0 start-0 my-2 mx-4 z-index-3 h--70 d-inline-flex align-items-center">
      <img src="../../resources/assets/images/logo/logo.png" width="110"
      height="32" alt="..." />
    </a>

    <div class="d-lg-flex text-white min-h-100vh"
      style="background: linear-gradient(180deg, #42404e 0, #1b1e29);">
      <div class="col-12 col-lg-5 d-lg-flex">
        <div class="w-100 align-self-center">
          <div class="py-7">
            <h1
              class="d-inline-block text-align-end text-center-md text-center-xs display-4 h2-xs w-100 max-w-600 w-100-md w-100-xs">
              Sign up <span class="display-3 h1-xs d-block font-weight-medium">
                Portfoli </span>
            </h1>
          </div>
        </div>
      </div>

      <div class="col-12 col-lg-7 d-lg-flex">
        <div
          class="w-100 align-self-center text-center-md text-center-xs py-2">
          <!-- optional class: .form-control-pill -->
          <form action="../member/companyJoin" method="POST"
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
              <input required placeholder="사업자등록번호" readonly name="businessRegistrationNumber" type="text" maxlength='12'
                class="form-control" value="${company.businessRegistrationNumber}"/> <label
                for="businessRegistrationNumber">사업자등록번호</label>
            </div>
            
            <div class="form-label-group mb-3">
              <input required placeholder="기업명" readonly name="companyName" type="text"
                class="form-control" value="${company.name}"/> <label
                for="companyName">기업명</label>
            </div>
            
            <div class="form-label-group mb-3">
              <input required placeholder="기업 전화번호" readonly name="companyTel" type="text"
                class="form-control" value="${company.tel}"/> <label
                for="companyTel">기업 전화번호</label>
            </div>
            
             <div class="form-label-group mb-3">
              <input required placeholder="직책" name="position" type="text"
                class="form-control" /> <label
                for="position">직책</label>
            </div>

            <div class="form-label-group mb-3">
              <input required placeholder="아이디" name="id" type="text"
                class="form-control" /> <label
                for="account_id">아이디</label>
            </div>
            
            <div class="form-label-group mb-3">
              <input required placeholder="이름" name="name" type="text"
                class="form-control" /> <label
                for="account_name">이름</label>
            </div>

            <div class="input-group-over">
              <div class="form-label-group mb-3">
                <input required placeholder="이메일" name="email" type="email"
                  class="form-control" /> <label
                  for="account_email">이메일</label>
              </div>
              <a href="#" class="btn fs--12 btn-password-type-toggle"
                data-target="#email"> <span
                class="group-icon"> <i class="fi fi-envelope m-0"></i> <i
                  class="fi fi-check m-0"></i>
              </span>
              </a>
            </div>

            <div class="form-label-group mb-3">
              <input required placeholder="비밀번호" name="password" id="password"
                type="password" class="form-control" onchange="isSame()" />
              <label for="account_password">비밀번호</label>
            </div>

            <div class="form-label-group mb-3">
              <input required placeholder="비밀번호 확인" id="checkPassword"
                type="password" class="form-control" onchange="isSame()" />
              <label for="account_password">비밀번호 확인</label> <span id="same"></span>
            </div>

            <div class="form-label-group mb-3">
              <input required placeholder="연락처" name="tel" type="text"
                class="form-control" /> <label
                for="account_id">연락처</label>
            </div>

            <div class="clearfix bg-light position-relative rounded p-4 mb-4">
              <span class="text-muted fs--15 d-block m-2"> 🖊 portfoli에서
                보내는 이메일 및 SMS 수신에 동의하십니까?<br /> 등록한 관심 채용 공고와 일정을 받아보실 수 있습니다!
              </span>

              <div style="display: block; margin: 0 70px;">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="emailYN"
                    id="emailYN" value="1" checked /> <label
                    class="form-check-label" for="inlineRadio1">이메일
                    수신동의</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="emailYN"
                    id="emailYN" value="0" /> <label
                    class="form-check-label" for="inlineRadio2">이메일
                    수신거부</label>
                </div>
              </div>
              <div style="display: block; margin: 0 87px;">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="smsYN"
                    id="smsYN" value="1" checked /> <label
                    class="form-check-label" for="inlineRadio1">SMS
                    수신동의</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="smsYN"
                    id="smsYN" value="0" /> <label
                    class="form-check-label" for="inlineRadio2">SMS
                    수신거부</label>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-12 col-md-8">
                <button type="submit" class="btn btn-primary btn-block"
                  style="display: block; margin: 0 90px;">
                  회원가입</button>
               
              </div>

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
