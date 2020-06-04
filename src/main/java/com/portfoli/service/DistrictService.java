package com.portfoli.service;

import java.util.List;
import java.util.Map;
import com.portfoli.domain.District;

public interface DistrictService {

  List<District> get() throws Exception;

  District get(String districtName) throws Exception;

  public List<District> list(int cityNumber) throws Exception;

  public List<District> listOfMember(int memberNumber) throws Exception;

  public int delete(Map<String, Object> params) throws Exception;

  public int add(Map<String, Object> params) throws Exception;
}
