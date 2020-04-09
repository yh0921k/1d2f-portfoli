package com.portfoli.service.impl;

import org.springframework.stereotype.Component;
import com.portfoli.dao.PortfolioFileDao;
import com.portfoli.domain.PortfolioFile;
import com.portfoli.service.PortfolioFileService;

@Component
public class PortfolioFileServiceImpl implements PortfolioFileService {

  PortfolioFileDao portfolioFileDao;

  public PortfolioFileServiceImpl(PortfolioFileDao portfolioFileDao) {
    this.portfolioFileDao = portfolioFileDao;
  }


  @Override
  public int add(PortfolioFile portfolioFile) throws Exception {
    return portfolioFileDao.insert(portfolioFile);
  }

}
