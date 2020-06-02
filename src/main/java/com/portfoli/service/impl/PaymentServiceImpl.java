package com.portfoli.service.impl;

import java.util.HashMap;
import java.util.List;
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

  @Override
  public List<Payment> list(int userNumber, int pageNumber, int pageSize) throws Exception {
    HashMap<String,Object> param = new HashMap<>();
    param.put("userNumber", userNumber);
    param.put("offset", (pageNumber - 1) * pageSize);
    param.put("pageSize", pageSize);

    return paymentDao.findAllByUserNumber(param);
  }

  @Override
  public int listCount(int userNumber) throws Exception {
    return paymentDao.findAllCount(userNumber);
  }
}