package com.portfoli.dao;

import com.portfoli.domain.Visitor;

public interface VisitorDao {
  int insert(Visitor visitor);

  int findVisitCountForAMonth(int month) throws Exception;
}