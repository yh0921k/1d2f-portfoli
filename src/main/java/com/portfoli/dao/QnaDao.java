package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.Qna;

public interface QnaDao {

  List<Qna> findAll();

  Qna findByNo(int no);

  int updateViewCount(int viewCount);

}
