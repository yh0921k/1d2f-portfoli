package com.portfoli.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import com.portfoli.dao.QnaCategoryDao;
import com.portfoli.domain.QnaCategory;
import com.portfoli.service.QnaCategoryService;

@Component
public class QnaCategoryServiceImpl implements QnaCategoryService {

  QnaCategoryDao qnaCategoryDao;

  public QnaCategoryServiceImpl(QnaCategoryDao qnaCategoryDao) {
    this.qnaCategoryDao = qnaCategoryDao;
  }

  @Override
  public List<QnaCategory> get() throws Exception {
    List<QnaCategory> categories = qnaCategoryDao.findAll();
    if (categories.size() == 0) {
      throw new Exception("카테고리 불러오기 실패");
    }
    return categories;
  }

}
