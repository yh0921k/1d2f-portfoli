package com.portfoli.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import com.portfoli.dao.BoardDao;
import com.portfoli.domain.Board;
import com.portfoli.service.BoardService;

@Component
public class BoardServiceImpl implements BoardService {
  BoardDao boardDao;

  public BoardServiceImpl(BoardDao boardDao) {
    this.boardDao = boardDao;
  }

  @Override
  public boolean add(Board board) throws Exception {
    if(board.getAttachment()==null||board.getAttachment().equals("")) {
      return boardDao.insert(board) > 0;
    }
    else {
      return boardDao.insert(board, board.getAttachment()) > 0;
    }
  }

  @Override
  public List<Board> list() throws Exception {
    return boardDao.findAll();
  }



}
