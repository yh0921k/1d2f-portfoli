package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Portfolio;

public interface PortfolioService {

  List<Portfolio> list() throws Exception;

  Portfolio get(int boardNumber) throws Exception;
  
  List<Portfolio> getByMemberNumber(int generalMemberNumber) throws Exception;

  boolean insert(Portfolio portfolio) throws Exception;

  boolean delete(int boardNumber) throws Exception;

  boolean update(Portfolio portfolio) throws Exception;

  int selectListCnt(Portfolio portfolio) throws Exception;

//  int update(Map<String, Integer> map) throws Exception;



}
