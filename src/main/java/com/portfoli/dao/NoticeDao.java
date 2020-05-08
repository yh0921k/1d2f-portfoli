package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.Notice;

public interface NoticeDao {

  List<Notice> findAll() throws Exception;

  List<Notice> findAll(Notice notice) throws Exception;
  
  List<Notice> findByCategoryNumber(int categoryNumber) throws Exception;

  Notice findByNo(int number) throws Exception;

  int insert(Notice notice) throws Exception;

  int delete(int boardNumber) throws Exception;

  int update(Notice notice) throws Exception;

  int selectListCnt() throws Exception;




}
