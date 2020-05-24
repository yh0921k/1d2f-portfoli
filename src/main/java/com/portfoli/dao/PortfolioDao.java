package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.Portfolio;

public interface PortfolioDao {

  List<Portfolio> findAll(Portfolio portfolio) throws Exception;

  Portfolio findByNo(int boardNumber) throws Exception;

  List<Portfolio> findByMember(Portfolio portfolio) throws Exception;

  boolean insert(Portfolio portfolio) throws Exception;

  boolean delete(int boardNumber) throws Exception;

  boolean update(Portfolio portfolio) throws Exception;

  int selectListCnt() throws Exception;

  int selectMyListCnt(int generalMemberNumber) throws Exception;

  void readableon(Portfolio portfolio) throws Exception;

  void readableoff(Portfolio portfolio) throws Exception;






}
