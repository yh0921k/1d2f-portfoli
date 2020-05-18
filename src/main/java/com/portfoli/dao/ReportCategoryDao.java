package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.ReportCategory;

public interface ReportCategoryDao {
  List<ReportCategory> findAll() throws Exception;
}