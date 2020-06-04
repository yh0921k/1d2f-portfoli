package com.portfoli.dao;

import java.util.List;
import java.util.Map;
import com.portfoli.domain.District;

public interface DistrictDao {

  List<District> findAll() throws Exception;

  public List<District> findAllByNumber(int cityNumber) throws Exception;

  public List<District> findAllByMemberNumber(int memberNumber) throws Exception;

  public District findByName(String districtName) throws Exception;

  public int delete(Map<String, Object> params) throws Exception;

  public int insert(Map<String, Object> params) throws Exception;

}
