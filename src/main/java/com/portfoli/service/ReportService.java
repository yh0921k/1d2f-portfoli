package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Report;
import com.portfoli.domain.ReportCategory;

public interface ReportService {
  int add(Report report) throws Exception;

  List<ReportCategory> reportCategorie() throws Exception;
}