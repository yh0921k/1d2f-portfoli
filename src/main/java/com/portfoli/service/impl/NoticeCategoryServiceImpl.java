package com.portfoli.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.NoticeCategoryDao;
import com.portfoli.domain.NoticeCategory;
import com.portfoli.service.NoticeCategoryService;

@Component
public class NoticeCategoryServiceImpl implements NoticeCategoryService {
  NoticeCategoryDao noticeCategoryDao;
  TransactionTemplate transactionTemplate;

  public NoticeCategoryServiceImpl(NoticeCategoryDao noticeCategoryDao) {
    this.noticeCategoryDao = noticeCategoryDao;
  }

  @Override
  public boolean insert(NoticeCategory category) throws Exception {
    return noticeCategoryDao.insert(category) > 0;
  }

  @Override
  public boolean update(NoticeCategory category) throws Exception {
    return noticeCategoryDao.update(category) > 0;
  }

  @Override
  public List<NoticeCategory> list() throws Exception {
    return noticeCategoryDao.findAll();
  }

  @Override
  public List<NoticeCategory> list(NoticeCategory noticeCategory) throws Exception {
    return noticeCategoryDao.findAll(noticeCategory);
  }

  @Override
  public NoticeCategory get(int number) throws Exception {
    return noticeCategoryDao.findByNo(number);
  }

  @Override
  public boolean delete(int number) throws Exception {
    return noticeCategoryDao.delete(number) > 0;
  }

  @Override
  public int selectListCnt(NoticeCategory noticeCategory) throws Exception {
    return noticeCategoryDao.selectListCnt();
  }



}
