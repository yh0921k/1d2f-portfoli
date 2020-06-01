package com.portfoli.dao;

import java.util.List;
import java.util.Map;
import com.portfoli.domain.Field;

public interface FieldDao {

  public List<Field> findAll() throws Exception;

  public int findNumber(String fieldName) throws Exception;

  public List<Field> findByMemberNumber(int memberNumber) throws Exception;

  public int deleteAll(int memberNumber) throws Exception;

  public int insert(Map<String, Object> params) throws Exception;
}
