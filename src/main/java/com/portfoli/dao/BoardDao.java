package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.Board;

public interface BoardDao {

  int insert(Board board) throws Exception;

  int insert(Board board, String attachment) throws Exception;

  List<Board> findAll() throws Exception;


}
