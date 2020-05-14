package com.portfoli.dao;

import java.util.HashMap;
import java.util.List;
import com.portfoli.domain.Faq;

public interface FaqDao {

  List<Faq> findAll(HashMap<String, Object> param);

  Faq findByNo(int no);

  int updateViewCount(int viewCount);

  int delete(int boardNo);

  int update(Faq faq);

  int insert(Faq faq);

  int selectListCnt(Faq faq);


}
