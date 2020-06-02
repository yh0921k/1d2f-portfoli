package com.portfoli.dao;

import java.util.List;
import java.util.Map;
import com.portfoli.domain.Rank;

public interface RankDao {

  public List<Rank> findAll() throws Exception;

  public List<Rank> findAllByFilter(Map<String, Object> params) throws Exception;
}
