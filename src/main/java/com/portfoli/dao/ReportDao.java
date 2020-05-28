package com.portfoli.dao;

import java.util.List;
import java.util.Map;
import com.portfoli.domain.Report;

public interface ReportDao {
  int insert(Report report) throws Exception;

  List<Report> findAllByReporterNumber(Map<String, Object> param) throws Exception;

  int count(int userNumber) throws Exception;

  List<Report> findAllForAdmin(Map<String, Object> param) throws Exception;

  int adminCount() throws Exception;

  Report findByNumber(int number) throws Exception;

  int reply(Report report) throws Exception;
}