package com.portfoli.service.impl;

import java.util.List;
import java.util.Map;
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

  @Override
  public List<District> listOfMember(int memberNumber) throws Exception {
    return districtDao.findAllByMemberNumber(memberNumber);
  }

  @Override
  public District get(String districtName) throws Exception {
    return districtDao.findByName(districtName);
  }

  @Override
  public int delete(Map<String, Object> params) throws Exception {
    return districtDao.delete(params);
  }

  @Override
  public int add(Map<String, Object> params) throws Exception {
    return districtDao.insert(params);
  }

}
