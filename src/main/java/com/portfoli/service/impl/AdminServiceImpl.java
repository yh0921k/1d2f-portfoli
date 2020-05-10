package com.portfoli.service.impl;

import java.util.HashMap;
import org.springframework.stereotype.Component;
import com.portfoli.dao.AdminDao;
import com.portfoli.domain.Admin;
import com.portfoli.service.AdminService;

@Component
public class AdminServiceImpl implements AdminService {

  AdminDao adminDao;

  public AdminServiceImpl(AdminDao adminDao) {
    this.adminDao = adminDao;
  }

  @Override
  public Admin get(String id, String password) throws Exception {
    HashMap<String, Object> params = new HashMap<>();
    params.put("id", id);
    params.put("password", password);
    return adminDao.findByIdAndPassword(params);
  }
}
