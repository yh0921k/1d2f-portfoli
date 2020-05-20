package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.CompanyRequiredCertificate;
import com.portfoli.domain.JobPosting;

public interface CompanyRequiredCertificateDao {

  public int insert(JobPosting jobPosting) throws Exception;

  List<CompanyRequiredCertificate> findAll(int jobPostingNumber) throws Exception;

  int deleteAll(int jobPostingNumber) throws Exception;
}
