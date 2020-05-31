package com.portfoli.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.PortfolioDao;
import com.portfoli.domain.Portfolio;
import com.portfoli.domain.SearchMap;
import com.portfoli.service.PortfolioService;

@Component
public class PortfolioServiceImpl implements PortfolioService {
  PortfolioDao portfolioDao;
  TransactionTemplate transactionTemplate;

  public PortfolioServiceImpl(PortfolioDao portfolioDao) {
    this.portfolioDao = portfolioDao;
  }

  @Override
  public List<Portfolio> list(Portfolio portfolio) throws Exception {
    return portfolioDao.findAll(portfolio);
  }

  @Override
  public Portfolio get(int boardNumber) throws Exception {
    return portfolioDao.findByNo(boardNumber);
  }

  @Override
  public List<Portfolio> getByMemberNumber(Portfolio portfolio) throws Exception {
    return portfolioDao.findByMember(portfolio);
  }

  @Override
  public List<Portfolio> listMyRecommendedlist(Portfolio portfolio) throws Exception {
    return portfolioDao.findAllRecommendedlist(portfolio);
  }

  @Override
  public boolean insert(Portfolio portfolio) throws Exception {
    return portfolioDao.insert(portfolio);
  }

  @Override
  public boolean delete(int boardNumber) throws Exception {
    return portfolioDao.delete(boardNumber);
  }

  @Override
  public boolean update(Portfolio portfolio) throws Exception {
    return portfolioDao.update(portfolio);
  }

  @Override
  public int selectListCnt(Portfolio portfolio) throws Exception {
    return portfolioDao.selectListCnt();
  }

  @Override
  public int selectMyListCnt(int generalMemberNumber) throws Exception {
    return portfolioDao.selectMyListCnt(generalMemberNumber);
  }

  @Override
  public int selectMyRecommendedListCnt(int generalMemberNumber) throws Exception {
    return portfolioDao.selectMyRecommendedListCnt(generalMemberNumber);
  }

  @Override
  public void readableon(Portfolio portfolio) throws Exception {
    portfolioDao.readableon(portfolio);
  }

  @Override
  public void readableoff(Portfolio portfolio) throws Exception {
    portfolioDao.readableoff(portfolio);
  }

  @Override
  public List<Portfolio> search(SearchMap searchMap) throws Exception {
    return portfolioDao.search(searchMap);
  }

  @Override
  public List<Portfolio> searchMyRecommendedlist(SearchMap searchMap) throws Exception {
    return portfolioDao.findSomeRecommendedlist(searchMap);
  }








}
