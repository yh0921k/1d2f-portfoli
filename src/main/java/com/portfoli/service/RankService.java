package com.portfoli.service;

import java.util.List;
import java.util.Map;
import com.portfoli.domain.Rank;

public interface RankService {

  public List<Rank> list() throws Exception;

  public List<Rank> list(Map<String, Object> params) throws Exception;
}
