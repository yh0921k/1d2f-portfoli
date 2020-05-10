package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.NoticeCategory;

public interface NoticeCategoryDao {

  List<NoticeCategory> findAll() throws Exception;

  List<NoticeCategory> findAll(NoticeCategory noticeCategory) throws Exception;

  NoticeCategory findByNo(int number) throws Exception;

  int insert(NoticeCategory category) throws Exception;

  int delete(int number) throws Exception;

  int update(NoticeCategory category) throws Exception;

  int selectListCnt() throws Exception;


}
