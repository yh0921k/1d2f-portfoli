package com.portfoli.dao;

import java.util.HashMap;
import java.util.List;
import com.portfoli.domain.Qna;

public interface QnaDao {

  List<Qna> findAll(HashMap<String, Object> param);

  Qna findByNo(int no);

  int updateViewCount(int viewCount);

  int delete(int boardNo);

  int update(Qna qna);

  int insert(Qna qna);

  int count();


}
