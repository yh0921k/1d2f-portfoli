package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.Board;

public interface BoardDao {

  int insert(Board board) throws Exception;

  List<Board> findAll() throws Exception;

  Board findByNo(int number) throws Exception;


}
