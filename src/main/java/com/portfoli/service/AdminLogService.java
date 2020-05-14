package com.portfoli.service;

import java.util.ArrayList;
import com.portfoli.domain.AdminLog;

public interface AdminLogService {
  ArrayList<AdminLog> get(String filepath, int startLine, int moreLine) throws Exception;

}
