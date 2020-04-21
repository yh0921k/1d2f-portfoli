package com.portfoli.dao;

import com.portfoli.domain.Company;

public interface CompanyDao {

  int insert(Company company) throws Exception;

  Company findByBusinessRegistrationNumber(String businessRegistrationNumber) throws Exception;

}
