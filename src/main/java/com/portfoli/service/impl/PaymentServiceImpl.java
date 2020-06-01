package com.portfoli.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.portfoli.dao.PaymentDao;
import com.portfoli.domain.Payment;
import com.portfoli.service.PaymentService;

@Component
public class PaymentServiceImpl implements PaymentService {
  @Autowired
  PaymentDao paymentDao;

  @Override
  public int add(Payment payment) throws Exception {
    return paymentDao.insert(payment);
  }
}