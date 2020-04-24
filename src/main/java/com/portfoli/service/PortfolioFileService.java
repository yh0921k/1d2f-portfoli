package com.portfoli.service;

import com.portfoli.domain.PortfolioFile;

public interface PortfolioFileService {

  boolean add(PortfolioFile portfolioFile) throws Exception;

  boolean delete(int number) throws Exception;

}
