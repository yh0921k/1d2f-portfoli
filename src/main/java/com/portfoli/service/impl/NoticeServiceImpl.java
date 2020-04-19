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

  @Override
  public int add(Notice notice) throws Exception {
    if (noticeDao.insert(notice) == 0) {
      return 0;
    }
    System.out.println("게시판 등록 성공! (게시글번호 : 공지사항 분류번호)");
    System.out.println(notice.getNumber() + " : " + notice.getNoticeNumber());
    return 1;
  }

  @Override
  public List<Notice> list() throws Exception {
    return noticeDao.findByAll();
  }


}
