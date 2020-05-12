package com.portfoli.dao;

import java.util.List;
import java.util.Map;
import com.portfoli.domain.Board;

public interface BoardDao {

  int insert(Board board) throws Exception;

  List<Board> findAll() throws Exception;

  Board findByNo(int number) throws Exception;

  int delete(int number) throws Exception;

  int update(Board board) throws Exception;

  int updateViewCount(Map<String, Object> params);

}
