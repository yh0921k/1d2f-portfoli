package com.portfoli.service;

import com.portfoli.domain.Recommendation;

public interface RecommendationService {

  Recommendation check(Recommendation recommendation) throws Exception;

  void toggleon(Recommendation reco) throws Exception;

  void toggleoff(Recommendation reco) throws Exception;


}
