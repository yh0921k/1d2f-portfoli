package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Board;

public interface BoardService {

  boolean add(Board board) throws Exception;

  List<Board> list() throws Exception;

  Board get(int number) throws Exception;

  boolean delete(int number) throws Exception;

  boolean update(Board board) throws Exception;


}
