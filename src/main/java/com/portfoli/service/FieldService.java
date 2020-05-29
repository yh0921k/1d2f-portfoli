package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Field;

public interface FieldService {

  public List<Field> list() throws Exception;

  public int get(String fieldName) throws Exception;

}
