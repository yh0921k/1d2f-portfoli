package com.portfoli.service;

import java.util.List;
import java.util.Map;
import com.portfoli.domain.Board;

public interface BoardService {

  boolean add(Board board) throws Exception;

  List<Board> list() throws Exception;

  Board get(int number) throws Exception;

  boolean delete(int number) throws Exception;

  boolean update(Board board) throws Exception;

  void addViewCount(Map<String, Object> params) throws Exception;

}
