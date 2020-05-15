package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.Company;

public interface CompanyDao {
  int insert(Company company) throws Exception;

  Company findByBusinessRegistrationNumber(String businessRegistrationNumber) throws Exception;

  List<Company> findAllByKeyword(String keyword) throws Exception;

  Company findByNumber(int number) throws Exception;
}