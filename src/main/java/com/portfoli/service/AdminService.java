package com.portfoli.service;

import com.portfoli.domain.Admin;

public interface AdminService {
  Admin get(String id, String password) throws Exception;

}
