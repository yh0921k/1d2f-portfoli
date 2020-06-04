package com.portfoli.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.portfoli.dao.JobPostingDao;
import com.portfoli.dao.PaymentDao;
import com.portfoli.domain.JobPosting;
import com.portfoli.domain.Payment;
import com.portfoli.service.PaymentService;

@Component
public class PaymentServiceImpl implements PaymentService {
  @Autowired
  PaymentDao paymentDao;

  @Autowired
  JobPostingDao jobPostingDao;

  @Transactional
  @Override
  public int add(Payment payment, JobPosting jobPosting) throws Exception {
    paymentDao.insert(payment);
    jobPostingDao.insertLogo(jobPosting);

    return 1;
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

  @Override
  public List<Payment> adminList(int pageNumber, int pageSize) throws Exception {
    HashMap<String,Object> param = new HashMap<>();
    param.put("offset", (pageNumber - 1) * pageSize);
    param.put("pageSize", pageSize);

    return paymentDao.findAllForAdmin(param);
  }

  @Override
  public int adminListCount() throws Exception {
    return paymentDao.adminCount();
  }
}