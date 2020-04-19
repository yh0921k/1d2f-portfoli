package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.Notice;

public interface NoticeDao {

  int insert(Notice notice) throws Exception;

  List<Notice> findByAll() throws Exception;

}
