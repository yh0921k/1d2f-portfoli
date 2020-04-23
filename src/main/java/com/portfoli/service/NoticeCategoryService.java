package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.NoticeCategory;

public interface NoticeCategoryService {

  List<NoticeCategory> list() throws Exception;

  NoticeCategory get(int number) throws Exception;
  
  boolean insert(NoticeCategory category) throws Exception;

  boolean delete(int boardNumber) throws Exception;

  boolean update(NoticeCategory category) throws Exception;

}
