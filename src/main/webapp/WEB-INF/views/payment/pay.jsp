<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
IMP.init('imp35276447');

IMP.request_pay({
  amount : '${payment.price}',
  pay_method : '${payment.method}',
  buyer_tel : '${loginUser.tel}',
  buyer_name : '${loginUser.name}',
  buyer_email : '${loginUser.email}',
  name : '${payment.productName}'
}, function(response) {
  // 결제 후 호출되는 callback 함수
  if ( response.success ) {
    console.log(response);
    var msg = '결제가 완료되었습니다.';
    alert(msg);
  } else {
    alert('결제실패 : ' + response.error_msg);
  }
})
</script>