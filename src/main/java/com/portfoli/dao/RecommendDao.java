package com.portfoli.dao;

import java.util.List;
import java.util.Map;
import com.portfoli.domain.Recommend;

public interface RecommendDao {

  public List<Recommend> findAll() throws Exception;

  public List<Recommend> findAllByFilter(Map<String, Object> params) throws Exception;
}
