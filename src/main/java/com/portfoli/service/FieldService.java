package com.portfoli.service;

import java.util.List;
import java.util.Map;
import com.portfoli.domain.Field;

public interface FieldService {

  public List<Field> list() throws Exception;

  public int get(String fieldName) throws Exception;

  public List<Field> listOfMemberInterest(int memberNumber) throws Exception;

  public int delete(int memberNumber) throws Exception;

  public int add(Map<String, Object> params) throws Exception;
}
