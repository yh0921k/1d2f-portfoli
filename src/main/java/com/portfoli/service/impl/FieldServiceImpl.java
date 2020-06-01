package com.portfoli.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.FieldDao;
import com.portfoli.domain.Field;
import com.portfoli.service.FieldService;

@Component
public class FieldServiceImpl implements FieldService {

  TransactionTemplate transactionTemplate;
  FieldDao fieldDao;

  public FieldServiceImpl(//
      PlatformTransactionManager txManager, FieldDao fieldDao) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.fieldDao = fieldDao;
  }

  @Override
  public List<Field> list() throws Exception {
    return fieldDao.findAll();
  }

  @Override
  public int get(String fieldName) throws Exception {
    return fieldDao.findNumber(fieldName);
  }

  @Override
  public List<Field> listOfMemberInterest(int memberNumber) throws Exception {
    return fieldDao.findByMemberNumber(memberNumber);
  }

  @Override
  public int delete(int memberNumber) throws Exception {
    return fieldDao.deleteAll(memberNumber);
  }

  @Override
  public int add(Map<String, Object> params) throws Exception {
    return fieldDao.insert(params);
  }
}
