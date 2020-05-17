package com.portfoli.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import com.portfoli.dao.EmploymentStatusDao;
import com.portfoli.domain.EmploymentStatus;
import com.portfoli.service.EmploymentStatusService;

@Component
public class EmploymentStatusServiceImpl implements EmploymentStatusService {

  EmploymentStatusDao employmentStatusDao;

  public EmploymentStatusServiceImpl(EmploymentStatusDao employmentStatusDao) {
    this.employmentStatusDao = employmentStatusDao;
  }

  @Override
  public List<EmploymentStatus> get() throws Exception {
    List<EmploymentStatus> Status = employmentStatusDao.findAll();
    if (Status.size() == 0) {
      throw new Exception("고용형태가 존재하지 않습니다.");
    }
    return Status;
  }

}
