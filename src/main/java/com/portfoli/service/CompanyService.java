package com.portfoli.service;

import com.portfoli.domain.Company;

public interface CompanyService {

  int add(Company company) throws Exception;

  Company getByBusinessRegistrationNumber(String businessRegistrationNumber) throws Exception;

}
