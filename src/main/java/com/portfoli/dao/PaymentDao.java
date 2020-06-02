package com.portfoli.dao;

import java.util.List;
import java.util.Map;
import com.portfoli.domain.Payment;

public interface PaymentDao {
  int insert(Payment payment) throws Exception;

  List<Payment> findAllByUserNumber(Map<String, Object> param) throws Exception;

  int findAllCount(int userNumber) throws Exception;
}