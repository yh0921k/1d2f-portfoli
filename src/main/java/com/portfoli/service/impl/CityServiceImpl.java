package com.portfoli.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.CityDao;
import com.portfoli.domain.City;
import com.portfoli.service.CityService;

@Component
public class CityServiceImpl implements CityService {

  TransactionTemplate transactionTemplate;
  CityDao cityDao;

  public CityServiceImpl(//
      PlatformTransactionManager txManager, CityDao cityDao) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.cityDao = cityDao;
  }

  @Override
  public List<City> list() throws Exception {
    return cityDao.findAll();
  }
  //
  // @Override
  // public int get(String fieldName) throws Exception {
  // return fieldDao.findNumber(fieldName);
  // }
  //
  // @Override
  // public List<Field> listOfMemberInterest(int memberNumber) throws Exception {
  // return fieldDao.findByMemberNumber(memberNumber);
  // }
  //
  // @Override
  // public int delete(int memberNumber) throws Exception {
  // return fieldDao.deleteAll(memberNumber);
  // }
  //
  // @Override
  // public int add(Map<String, Object> params) throws Exception {
  // return fieldDao.insert(params);
  // }
}
