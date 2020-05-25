package com.portfoli.service;

import java.util.List;
import java.util.Map;
import com.portfoli.domain.Portfolio;

public interface PortfolioService {

  List<Portfolio> list(Portfolio portfolio) throws Exception;

  Portfolio get(int boardNumber) throws Exception;

  List<Portfolio> getByMemberNumber(Portfolio portfolio) throws Exception;

  boolean insert(Portfolio portfolio) throws Exception;

  boolean delete(int boardNumber) throws Exception;

  boolean update(Portfolio portfolio) throws Exception;

  int selectListCnt(Portfolio portfolio) throws Exception;

  int selectMyListCnt(int generalMemberNumber) throws Exception;

  void readableon(Portfolio portfolio) throws Exception;

  void readableoff(Portfolio portfolio) throws Exception;

  List<Portfolio> search(Map<String, String> map) throws Exception;


}
