package com.portfoli.service.impl;

import java.util.List;
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

  @Override
  public int add(Company company) throws Exception {
    if (companyDAO.insert(company) > 0) {
      return 1;
    } else {
      return 0;
    }
  }

  @Override
  public List<Company> searchList(String keyword) throws Exception {
    return companyDAO.findAllByKeyword(keyword);
  }

  @Override
  public Company get(int number) throws Exception {
    return companyDAO.findByNumber(number);
  }
}