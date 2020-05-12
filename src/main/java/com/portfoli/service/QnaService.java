package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Qna;

public interface QnaService {
  
  List<Qna> list() throws Exception;

  Qna get(int no) throws Exception;

  void delete(int boardNo) throws Exception;
  
}
