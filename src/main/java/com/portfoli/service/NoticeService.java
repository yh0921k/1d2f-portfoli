package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Notice;

public interface NoticeService {

  List<Notice> list() throws Exception;

  Notice get(int number) throws Exception;
  
  boolean insert(Notice notice) throws Exception;

  boolean delete(int number) throws Exception;

  boolean update(Notice notice) throws Exception;

}
