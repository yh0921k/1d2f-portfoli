package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.Notice;

public interface NoticeDao {

  List<Notice> findAll() throws Exception;

  Notice findByNo(int number) throws Exception;
  
  //  int insert(Notice notice) throws Exception;

}
