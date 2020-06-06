package com.portfoli.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.RecommendDao;
import com.portfoli.domain.Recommend;
import com.portfoli.service.RecommendService;

@Component
public class RecommendServiceImpl implements RecommendService {

  TransactionTemplate transactionTemplate;
  RecommendDao recommendDao;

  public RecommendServiceImpl(PlatformTransactionManager txManager, RecommendDao recommendDao) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.recommendDao = recommendDao;
  }

  @Override
  public List<Recommend> list() throws Exception {
    return recommendDao.findAll();
  }

  @Override
  public List<Recommend> list(Map<String, Object> params) throws Exception {
    return recommendDao.findAllByFilter(params);
  }
}
