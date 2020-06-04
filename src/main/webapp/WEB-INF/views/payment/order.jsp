<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<style>
th {
  background-color: #F5F5F5;
  padding-left: 15px;
}
</style>

<section class="pt-4 pb-0">
  <div class="container">
    <div>
      <h1>결제하기</h1>
    </div>
    <div style="text-align: right;">
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item">상품 선택</li>
          <li class="breadcrumb-item active">결제하기</li>
          <li class="breadcrumb-item" aria-current="page">결제 완료</li>
        </ol>
      </nav>
    </div>
    <br> <br> <span class="font-weight-bold">신청 상품 정보</span><hr class="mb-0">
    <table class="table m-0">
      <thead>
        <tr>
          <th class="bb-0 text-gray-500 font-weight-normal fs--14 min-w-300">상품명</th>
          <th class="bb-0 text-gray-500 font-weight-normal fs--14 w--200">가격</th>
          <th
            class="bb-0 text-gray-500 font-weight-normal fs--14 w--120 text-center">기간</th>
          <th
            class="bb-0 text-gray-500 font-weight-normal fs--14 w--60 text-align-end">
          </th>
        </tr>
      </thead>

      <tbody>
        <!-- product -->
        <tr>
        
          <!-- product name -->
          <td id="productName">${payment.productName}<br> <span
            class="d-block text-muted fs--13">${jobPosting.title}</span>
          </td>

          <!-- price -->
          <td id="price"><span class="d-block text-success fs--15">
              ${payment.price}원</span></td>

          <!-- term -->
          <td id="term" class="text-muted text-center" style="width: 240px;">
            ${payment.startDate} ~ ${payment.endDate}
          </td>

        </tr>
        <!-- /product -->
      </tbody>
    </table>
    <br><br>
    <span class="font-weight-bold">결제 정보</span><hr class="pt-0 mb-2">
    <table>
      <tr>
        <th class="w--200 bb-0 font-weight-normal">주문자</th>
        <td><div class="ml-3 mb-3 pt-1">${jobPosting.member.name}(${jobPosting.company.name})</div></td>
      </tr>
      <tr>
        <th class="w--200 bb-0 font-weight-normal">결제 수단</th>
        <td scope="col"><input type="radio" name="method"
          id="paymethod01" class="mb-2 ml-3" value="card" checked>
          신용카드 <input type="radio" name="method" id="paymethod02"
          class="mb-2" value="bank"> 무통장 입금 <br>
          <div id="info1" class="ml-3 mb-3">
            <small> [ 신용카드 결제안내 ] <br> 신용카드 결제 시 매출 전표가 발행되며,
              부가가치세법 제 33조에 따라 세금계산서를 발행하지 않습니다. <br> 대금 결제 청구서는 (주)이니시스
              명의로 청구됩니다. <br> <strong>법인카드로 결제하실 경우, 사업자등록번호 인증을
                실시</strong>합니다. <br></small>
          </div>
          <div id="info2" class="ml-3 mb-3" style="display: none;">
            <small> [ 무통장 입금 결제안내 ] <br> 입금이 완료되어야, 신청하신 상품과 서비스가
              적용됩니다. <br> 결제하기 버튼을 클릭하면 입금계좌번호를 확인하실 수 있습니다.
            </small>
          </div></td>
      </tr>

      <tr>
        <th class="w--200 bb-0 font-weight-normal">주문자 이메일</th>
        <td><input type="text"
          class="form-control form-control-sm ml-3"
          style="width: 300px; position: static; float: left;"
          value="${jobPosting.member.email}"> <small class="mt-2"
          style="position: relative; float: right;"> (입력하신 메일주소로 결제
            완료 메일이 발송됩니다.) </small></td>
      </tr>
    </table>
    <br>
    <br>
    <form action="/portfoli/app/payment/complete" method="post"
      id="payForm">
      <input id="impUid" name="impUid" type="hidden"> <input
        id="merchantUid" name="merchantUid" type="hidden">
      <div class="d-middle">
        <button id="payBtn" type="button"
          class="btn btn-sm btn-primary mb-3">결제하기</button>
      </div>
    </form>
    <br>
    <br>
  </div>
</section>

<script type="text/javascript"
  src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$('#payBtn').click(() => {
  if ($('#paymethod01').is(':checked')) { 
    payForCard();
  } else {
    payForBank();
  }
});

function payForCard() {
  IMP.init('imp35276447');

  IMP.request_pay({
    amount : '${payment.price}',
    pay_method : '${payment.method}',
    buyer_tel : '${loginUser.tel}',
    buyer_name : '${loginUser.name}',
    buyer_email : '${loginUser.email}',
    name : '${payment.productName}'
  }, function(response) {
    console.log(response);
    
    if ( response.success ) {
      alert('결제가 완료되었습니다.');
      $('#impUid').val(response.imp_uid);
      $('#merchantUid').val(response.merchant_uid);
      $('#payForm').submit();
    } else {
      alert('결제실패 : ' + response.error_msg);
    }
  })
}

function payForBank() {
  alert('무통장 입금');
}

$('input[id=paymethod01]').on('click', function() {
  $("#info2").hide();
  $("#info1").show();
  // $('.btn-primary').prop('href', "/portfoli/app/payment/pay");

})

$('input[id=paymethod02]').on('click', function() {
  $("#info1").hide();
  $("#info2").show();
  // $('.btn-primary').prop('href', "/portfoli/app/payment/bank");
})
</script>