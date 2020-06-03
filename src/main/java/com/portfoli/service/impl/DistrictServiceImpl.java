package com.portfoli.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import com.portfoli.dao.DistrictDao;
import com.portfoli.domain.District;
import com.portfoli.service.DistrictService;

@Component
public class DistrictServiceImpl implements DistrictService {

  DistrictDao districtDao;

  public DistrictServiceImpl(DistrictDao districtDao) {
    this.districtDao = districtDao;
  }

  @Override
  public List<District> get() throws Exception {
    List<District> districts = districtDao.findAll();
    if (districts.size() == 0) {
      throw new Exception("지역정보가 존재하지 않습니다.");
    }
    return districts;
  }

  @Override
  public List<District> list(int cityNumber) throws Exception {
    return districtDao.findAllByNumber(cityNumber);
  }

}
