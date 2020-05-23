package com.portfoli.dao;

import com.portfoli.domain.Recommendation;

public interface RecommendationDao {

  Recommendation check(Recommendation recommendation) throws Exception;

  void toggleon(Recommendation reco) throws Exception;

  void toggleoff(Recommendation reco) throws Exception;


}
