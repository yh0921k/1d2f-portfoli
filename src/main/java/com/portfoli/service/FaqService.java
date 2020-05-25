package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Faq;

public interface FaqService {

  List<Faq> list(int pageNumber, int pageSize) throws Exception;

  Faq get(int no) throws Exception;

  void delete(int boardNo) throws Exception;

  void update(Faq faq) throws Exception;

  void add(Faq faq) throws Exception;

  int selectListCnt(Faq faq) throws Exception;

  List<Faq> listForUser(int curPage, int pageSize) throws Exception;

  int selectListCntForUser(Faq faq) throws Exception;

  
}
