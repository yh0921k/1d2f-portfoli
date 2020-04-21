package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Notice;

public interface NoticeService {

  List<Notice> list() throws Exception;

  Notice get(int number) throws Exception;
  
  //  int add(Notice notice) throws Exception;

}
