package com.portfoli.service;

import java.util.List;
import java.util.Map;
import com.portfoli.domain.Recommend;

public interface RecommendService {

  // public List<Recommend> list() throws Exception;

  public List<Recommend> list(Map<String, Object> params) throws Exception;
}
