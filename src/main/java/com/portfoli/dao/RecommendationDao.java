package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.Recommendation;

public interface RecommendationDao {

  Recommendation check(Recommendation recommendation) throws Exception;

  void toggleon(Recommendation reco) throws Exception;

  void toggleoff(Recommendation reco) throws Exception;

  List<Recommendation> rankAll(Recommendation recommendation) throws Exception;

  int rankAllCnt(Recommendation recommendation) throws Exception;

  List<Recommendation> rankBySkill(int fieldNumber) throws Exception;


}
