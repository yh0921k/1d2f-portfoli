package com.portfoli.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import com.portfoli.dao.RecommendationDao;
import com.portfoli.domain.Recommendation;
import com.portfoli.service.RecommendationService;

@Component
public class RecommendationServiceImpl implements RecommendationService {

  RecommendationDao recommendationDao;

  public RecommendationServiceImpl(RecommendationDao recommendationDao) {
    this.recommendationDao = recommendationDao;
  }

  @Override
  public Recommendation check(Recommendation recommendation) throws Exception {
    return recommendationDao.check(recommendation);
  }

  @Override
  public void toggleon(Recommendation reco) throws Exception {
    recommendationDao.toggleon(reco);
  }

  @Override
  public void toggleoff(Recommendation reco) throws Exception {
    recommendationDao.toggleoff(reco);
  }

  @Override
  public List<Recommendation> rankAll(Recommendation recommendation) throws Exception {
    return recommendationDao.rankAll(recommendation);
  }

  @Override
  public int rankAllCnt(Recommendation recommendation) throws Exception {
    return recommendationDao.rankAllCnt(recommendation);
  }





}
