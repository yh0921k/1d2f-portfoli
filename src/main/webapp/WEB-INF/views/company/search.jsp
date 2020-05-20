<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
  errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta name="theme-color" content="#377dff">

<!-- PAGE TITLE -->
<section class="bg-light p-0">
  <div class="container py-5">
    <h1 class="h3">기업 확인</h1>
  </div>
</section>
<!-- /PAGE TITLE -->

<!-- FORM -->
<section>
  <div class="container">
    <div class="row">
      <div
        class="col-12 col-sm-8 col-md-8 col-lg-6 offset-sm-2 offset-md-2 offset-lg-3"
      >
        <!-- optional class: .form-control-pill -->
        <form
          action="search"
          method="POST"
          class="bs-validate p-5 rounded shadow-xs"
        >
          <h2 class="h5 text-center mb-5 mt-3">
            사업자 등록 번호를 입력해주세요.
          </h2>

          <div class="form-label-group mb-3">
            <input
              required
              placeholder="BusinessRegistrationNumber"
              id="businessRegistrationNumber"
              name="businessRegistrationNumber"
              type="text"
              class="form-control"
              onchange="chkBizNumber()"
              maxlength="12"
            />
            <label for="businessRegistrationNumber">000-00-00000</label><span id="isValid"></span>
          </div>


          <div class="row">
            <div class="col-12 col-md-6 mt-4">
              <button type="submit" class="btn btn-primary btn-block">확인</button>
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

<script>

function chkBizNumber() {
    var checkNum = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1); 
    var tmpBizNum, i, chkSum=0, c2, remander; 
    var bizNumber = document.getElementById("businessRegistrationNumber").value.replace(/-/gi,''); 

     for (i=0; i<=7; i++) chkSum += checkNum[i] * bizNumber.charAt(i); 
     c2 = "0" + (checkNum[8] * bizNumber.charAt(8)); 
     c2 = c2.substring(c2.length - 2, c2.length); 
     chkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1)); 
     remander = (10 - (chkSum % 10)) % 10;
     
     if(bizNumber.length === 10 && Math.floor(bizNumber.charAt(9)) != remander){
          document.getElementById("isValid").innerHTML = "유효한 사업자 등록번호입니다.";
          document.getElementById("isValid").style.color = "blue";
     } else {
          document.getElementById("isValid").innerHTML = "유효하지 않은 사업자 등록번호입니다.";
          document.getElementById("isValid").style.color = "red";
     }
    
}

  $(document)
      .ready(
          function() {
            $(function() {

              $('#businessRegistrationNumber')
                  .keydown(
                      function(event) {
                        var key = event.charCode
                            || event.keyCode || 0;
                        $text = $(this);
                        if (key !== 8 && key !== 9) {
                          if ($text.val().length === 3) {
                            $text.val($text.val()
                                + '-');
                          }
                          if ($text.val().length === 6) {
                            $text.val($text.val()
                                + '-');
                          }
                        }

                        return (key == 8
                            || key == 9
                            || key == 46
                            || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
                        // Key 8번 백스페이스, Key 9번 탭, Key 46번 Delete 부터 0 ~ 9까지, Key 96 ~ 105까지 넘버패트
                        // 한마디로 JQuery 0 ~~~ 9 숫자 백스페이스, 탭, Delete 키 넘버패드외에는 입력못함
                      })
            });

          });
</script>