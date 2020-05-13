package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Qna;

public interface QnaService {

  List<Qna> list(int pageNumber, int pageSize) throws Exception;

  Qna get(int no) throws Exception;

  void delete(int boardNo) throws Exception;

  void update(Qna qna) throws Exception;

  void add(Qna qna) throws Exception;

  int selectListCnt() throws Exception;


}
