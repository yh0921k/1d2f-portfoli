package com.portfoli.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.NoticeDao;
import com.portfoli.domain.Notice;
import com.portfoli.service.NoticeService;

@Component
public class NoticeServiceImpl implements NoticeService {
  NoticeDao noticeDao;
  TransactionTemplate transactionTemplate;

  public NoticeServiceImpl(NoticeDao noticeDao) {
    this.noticeDao = noticeDao;
  }

  @Override
  public List<Notice> list() throws Exception {
    return noticeDao.findAll();
  }

  @Override
  public Notice get(int number) throws Exception {
    return noticeDao.findByNo(number);
  }

  @Override
  public int insert(Notice notice) throws Exception {
//    if(noticeDao.insert(notice.getBoard().getNumber()) ==0 )
//      return 0;
//    return 1;
    
    if (noticeDao.insert(notice) == 0)
      return 0;
    return 1;
  }



}
