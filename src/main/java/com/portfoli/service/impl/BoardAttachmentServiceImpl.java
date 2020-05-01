package com.portfoli.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.BoardAttachmentDao;
import com.portfoli.domain.BoardAttachment;
import com.portfoli.service.BoardAttachmentService;

@Component
public class BoardAttachmentServiceImpl implements BoardAttachmentService {
  BoardAttachmentDao boardAttachmentDao;
  TransactionTemplate transactionTemplate;
 
  public BoardAttachmentServiceImpl(BoardAttachmentDao boardAttachmentDao) {
    this.boardAttachmentDao = boardAttachmentDao;
  }

  @Override
  public boolean add(BoardAttachment boardAttachment) throws Exception {
    return boardAttachmentDao.insert(boardAttachment) > 0;
  }
  
  @Override
  public List<BoardAttachment> list() throws Exception {
    return boardAttachmentDao.findAll();
  }

  @Override
  public List<BoardAttachment> get(int boardNumber) throws Exception {
    return boardAttachmentDao.findByNo(boardNumber);
  }
  
  @Override
  public boolean delete(int boardNumber) throws Exception {
    return boardAttachmentDao.delete(boardNumber) > 0;
  }

  @Override
  public boolean update(BoardAttachment boardAttachment) throws Exception {
    return boardAttachmentDao.update(boardAttachment) > 0;
  }

}