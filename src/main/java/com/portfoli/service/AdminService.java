package com.portfoli.admin;

public interface AdminService {
  Admin get(String id, String password) throws Exception;

}
