package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Company;

public interface CompanyService {

  int add(Company company) throws Exception;

  Company getByBusinessRegistrationNumber(String businessRegistrationNumber) throws Exception;

  List<Company> searchList(String keyword) throws Exception;
}
