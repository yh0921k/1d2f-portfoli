package com.portfoli.service;

import com.portfoli.domain.Company;

public interface CompanyService {

  Company getByBusinessRegistrationNumber(String businessRegistrationNumber) throws Exception;

}
