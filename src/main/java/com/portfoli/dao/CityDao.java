package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.City;

public interface CityDao {

  public List<City> findAll() throws Exception;

  // public int findNumber(String fieldName) throws Exception;
  //
  // public List<Field> findByMemberNumber(int memberNumber) throws Exception;
  //
  // public int deleteAll(int memberNumber) throws Exception;
  //
  // public int insert(Map<String, Object> params) throws Exception;
}
