package com.portfoli.admin;

import java.util.HashMap;

@Component
public class AdminServiceImpl implements AdminService {

  AdminDao adminDao;

  public AdminServiceImpl(AdminDao adminDao) {
    this.adminDao = adminDao;
  }

  @Override
  public Admin get(String id, String password) throws Exception {
    HashMap<String, Object> params = new HashMap<>();
    params.put("email", id);
    params.put("password", password);
    return adminDao.findByIdAndPassword(params);
  }
}
