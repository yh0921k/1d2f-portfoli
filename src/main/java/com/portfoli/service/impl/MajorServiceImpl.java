package com.portfoli.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.portfoli.dao.MajorDao;
import com.portfoli.domain.Major;
import com.portfoli.service.MajorService;

@Component
public class MajorServiceImpl implements MajorService {

  @Autowired
  MajorDao majorDao;

  @Override
  public List<Major> listMajor() throws Exception {
    List<Major> majors = majorDao.findAll();
    if (majors.size() == 0) {
      throw new Exception("전공 정보 불러오는 도중 에러 발생");
    }
    return majors;
  }


}
