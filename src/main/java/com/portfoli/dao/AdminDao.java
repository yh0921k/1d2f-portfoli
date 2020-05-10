package com.portfoli.admin;

import java.util.Map;

public interface AdminDao {
  Admin findByIdAndPassword(Map<String, Object> params) throws Exception;

}
