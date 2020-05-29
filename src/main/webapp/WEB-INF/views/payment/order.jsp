<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<section class="pt-4 pb-0">
  <div class="container">
    <div><h1>결제하기</h1></div>
      <div style="text-align:right;">
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item">상품 선택</li>
          <li class="breadcrumb-item active">결제하기</li>
          <li class="breadcrumb-item" aria-current="page">결제 완료</li>
        </ol>
      </nav></div>
      <br><br>
<span class="font-weight-bold">신청 상품 정보</span>
          <table class="table m-0">
    <thead>
      <tr>
        <th class="bb-0 text-gray-500 font-weight-normal fs--14 min-w-300">상품명</th>
        <th class="bb-0 text-gray-500 font-weight-normal fs--14 w--200">가격</th>
        <th class="bb-0 text-gray-500 font-weight-normal fs--14 w--120 text-center">기간</th>
        <th class="bb-0 text-gray-500 font-weight-normal fs--14 w--60 text-align-end"> </th>
      </tr>
    </thead>
    
        <tbody>
      <!-- product -->
      <tr>

        <!-- product name -->
        <td id="productName">
        ${order.productName}<br> <span class="d-block text-muted fs--13">${jobPosting.title}</span>
        </td>

        <!-- price -->
        <td id="price">
        <span class="d-block text-success fs--15"> ${order.price}원</span>
        </td>

        <!-- term -->
        <td id="term" class="text-muted text-center">
        ${startDate} ~ ${endDate}
        </td>

      </tr>
      <!-- /product -->
    </tbody>
  </table>
  
  <h1 class="font-weight-light">결제 정보</h1>
                    <table>
                       <tr>
                          <th class="w--20">주문자</th>
                          <td>${jobPosting.member.name}(${jobPosting.company.name})
                        </tr>
                        <tr>
                          <th class="w--200" style="background-color: #F5F5F5;">결제 수단</th>
                          <th scope="col">
                <input type="radio" name="method" id="paymethod01" value="card" checked>신용카드
                <input type="radio" name="method" id="paymethod03" value="bank"> 무통장 입금<br>
                <div id="info1">
                           [ 신용카드 결제안내 ] <br>
                           신용카드 결제 시 매출 전표가 발행되며, 부가가치세법 제 33조에 따라 세금계산서를 발행하지 않습니다. <br>
                           신용카드는 세금계산서가 발행되지 않으므로 결제 완료 후 발행되는 매출전표로 세금계산서를 대신할 수 있습니다. <br>
                    대금 결제 청구서는 (주)이니시스 명의로 청구됩니다. <br>
                    <strong>법인카드로 결제하실 경우, 사업자등록번호 인증을 실시</strong>합니다. <br>
                    </div>
                    <div id="info2" style="display: none;">
                    [ 무통장 입금 결제안내 ] <br>
                    입금이 완료되어야, 신청하신 상품과 서비스가 적용됩니다. <br>
                    결제하기 버튼을 클릭하면 입금계좌번호를 확인하실 수 있습니다.
                    </div>
                    </th>
                        </tr>

                        <tr>
                          <th class="w--200" style="background-color: #F5F5F5;">주문자 이메일</th>
                          <td><input type="text" class="form-control form-control-sm" value="${jobPosting.member.email}">
                          <small> (입력하신 메일주소로 결제 완료 메일이 발송됩니다.) </small></td>
                        </tr>
                    </table>
                    <form action="pay" method="post" id="pay">
                  <button type="submit" class="btn btn-sm btn-primary mb-1"> 결제하기 </button> </form>
  </div>
</section>

<script>
$('input[id=paymethod01]').on('click', function() {
  $("#info2").hide();
  $("#info1").show();
  $('.btn-primary').prop('href', "/portfoli/app/payment/pay");
})

$('input[id=paymethod03]').on('click', function() {
  $("#info1").hide();
  $("#info2").show();
  $('.btn-primary').prop('href', "/portfoli/app/payment/bank");
})
</script>