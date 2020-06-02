package com.portfoli.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.RankDao;
import com.portfoli.domain.Rank;
import com.portfoli.service.RankService;

@Component
public class RankServiceImpl implements RankService {

  TransactionTemplate transactionTemplate;
  RankDao rankDao;

  public RankServiceImpl(PlatformTransactionManager txManager, RankDao rankDao) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.rankDao = rankDao;
  }

  @Override
  public List<Rank> list() throws Exception {
    return rankDao.findAll();
  }

  @Override
  public List<Rank> list(Map<String, Object> params) throws Exception {
    return rankDao.findAllByFilter(params);
  }
}
