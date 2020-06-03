package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.District;

public interface DistrictDao {

  List<District> findAll() throws Exception;

  public List<District> findAllByNumber(int cityNumber) throws Exception;

}
