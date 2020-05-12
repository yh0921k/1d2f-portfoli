package com.portfoli.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.BoardDao;
import com.portfoli.dao.QnaDao;
import com.portfoli.domain.Qna;
import com.portfoli.service.QnaService;

@Component
public class QnaServiceImpl implements QnaService{
  
  BoardDao boardDao;
  QnaDao qnaDao;
  TransactionTemplate transactionTemplate;
  
  public QnaServiceImpl(BoardDao boardDao, QnaDao qnaDao, PlatformTransactionManager pftxManager) {
    this.boardDao = boardDao;
    this.qnaDao=qnaDao;
    this.transactionTemplate = new TransactionTemplate(pftxManager);
  }

  @Override
  public List<Qna> list() throws Exception {
    List<Qna> qnaList = qnaDao.findAll();
    if(qnaList.size() < 0 ) {
      throw new Exception("Q&A 불러오기 실패");
    }
    return qnaList;
  }

}
