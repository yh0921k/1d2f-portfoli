package com.portfoli.service.impl;

import org.springframework.stereotype.Component;
import com.portfoli.dao.CompanyDao;
import com.portfoli.domain.Company;
import com.portfoli.service.CompanyService;

@Component
public class CompanyServiceImpl implements CompanyService {

  CompanyDao companyDAO;

  public CompanyServiceImpl(CompanyDao companyDao) {
    this.companyDAO = companyDao;
  }

  @Override
  public Company getByBusinessRegistrationNumber(String businessRegistrationNumber)
      throws Exception {

    return companyDAO.findByBusinessRegistrationNumber(businessRegistrationNumber);

  }



}
