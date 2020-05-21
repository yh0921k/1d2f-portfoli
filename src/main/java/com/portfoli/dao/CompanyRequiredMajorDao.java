package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.CompanyRequiredMajor;
import com.portfoli.domain.JobPosting;

public interface CompanyRequiredMajorDao {

  public int insert(JobPosting jobPosting) throws Exception;

  List<CompanyRequiredMajor> findAll(int jobPostingNumber) throws Exception;

  int deleteAll(int jobPostingNumber) throws Exception;
}
