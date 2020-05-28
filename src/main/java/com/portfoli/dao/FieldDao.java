package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.Field;

public interface FieldDao {

  public List<Field> findAll() throws Exception;
}
