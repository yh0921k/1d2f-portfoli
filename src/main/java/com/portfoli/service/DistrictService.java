package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.District;

public interface DistrictService {

  List<District> get() throws Exception;

  public List<District> list(int cityNumber) throws Exception;
}
