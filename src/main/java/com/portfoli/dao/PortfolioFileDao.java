package com.portfoli.dao;

import com.portfoli.domain.PortfolioFile;

public interface PortfolioFileDao {

  int insert(PortfolioFile portfolioFile) throws Exception;

  int delete(int boardNumber) throws Exception;

}
