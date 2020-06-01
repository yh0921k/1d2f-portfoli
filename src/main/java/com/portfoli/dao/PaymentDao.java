package com.portfoli.dao;

import com.portfoli.domain.Payment;

public interface PaymentDao {
  int insert(Payment payment) throws Exception;
}