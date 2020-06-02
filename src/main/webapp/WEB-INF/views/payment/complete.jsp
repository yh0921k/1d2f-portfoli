<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="pt-4 pb-0">
  <div class="container">
    <div>
      <h1>결제완료</h1>
    </div>
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item">상품 선택</li>
          <li class="breadcrumb-item">결제하기</li>
          <li class="breadcrumb-item active" aria-current="page">결제 완료</li>
        </ol>
      </nav>
    <br>
    <div style="text-align: center;">
      결제가 완료되었습니다! <br> 주문하신 상품은 익일 오전에 적용됩니다.
    </div>
    <br>
    <div class="p-2 shadow-success-sm mb-5" style="text-align: center;">
      주문 번호 : ${payment.number} <br> 상품명 : ${payment.productName} <br>
      결제 금액 : ${payment.price} <br> 결제 수단 : ${payment.method} <br>
      <fmt:formatDate var="payDate"
                    value="${payment.payDate}" pattern="yyyy.MM.dd HH:mm:ss"/>
      승인 내역 : ${payment.comment} <br> 결제 시각 : ${payDate}
    </div>

    <br>
    <div class="d-middle">
      <a href="/portfoli/app/payment/list" class="btn btn-sm btn-success btn-soft mb-3">결제 내역 확인</a>
      <a href="/portfoli" class="btn btn-sm btn-secondary btn-soft mb-3">
        <i class="fi fi-home"></i>홈으로 가기
      </a>
    </div>
  </div>
</section>