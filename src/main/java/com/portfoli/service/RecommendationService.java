package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Recommendation;

public interface RecommendationService {

  Recommendation check(Recommendation recommendation) throws Exception;

  void toggleon(Recommendation reco) throws Exception;

  void toggleoff(Recommendation reco) throws Exception;

  List<Recommendation> rankAll(Recommendation recommendation) throws Exception;

  int rankAllCnt(Recommendation recommendation) throws Exception;


}
