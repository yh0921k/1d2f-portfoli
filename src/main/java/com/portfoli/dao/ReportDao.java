package com.portfoli.dao;

import com.portfoli.domain.Report;

public interface ReportDao {
  int insert(Report report) throws Exception;
}