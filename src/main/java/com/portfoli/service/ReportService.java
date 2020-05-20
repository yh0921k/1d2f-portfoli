package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Report;
import com.portfoli.domain.ReportCategory;

public interface ReportService {
  int add(Report report) throws Exception;

  List<Report> list(int userNumber, int pageNumber, int pageSize) throws Exception;

  int listCount(int userNumber) throws Exception;

  Report get(int number) throws Exception;

  List<Report> adminList(int pageNumber, int pageSize) throws Exception;

  int adminListCount() throws Exception;

  List<ReportCategory> reportCategorie() throws Exception;
}