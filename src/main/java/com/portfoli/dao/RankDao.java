package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.Rank;

public interface RankDao {

  public List<Rank> findAll() throws Exception;
}
