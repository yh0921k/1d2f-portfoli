package com.portfoli.dao;

import java.util.Map;
import com.portfoli.domain.Admin;

public interface AdminDao {
  Admin findByIdAndPassword(Map<String, Object> params) throws Exception;

}
