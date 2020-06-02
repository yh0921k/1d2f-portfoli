package com.portfoli.service;

import com.portfoli.domain.Payment;

public interface PaymentService {
  int add(Payment payment) throws Exception;
}