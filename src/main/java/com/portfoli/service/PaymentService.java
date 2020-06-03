package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.JobPosting;
import com.portfoli.domain.Payment;

public interface PaymentService {
  int add(Payment payment, JobPosting jobPosting) throws Exception;

  List<Payment> list(int userNumber, int pageNumber, int pageSize) throws Exception;

  int listCount(int userNumber) throws Exception;
}