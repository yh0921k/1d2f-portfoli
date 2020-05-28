package com.portfoli.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.portfoli.dao.FinalEducationDao;
import com.portfoli.dao.GeneralMemberEducationDao;
import com.portfoli.dao.GeneralMemberEducationMajorDao;
import com.portfoli.domain.FinalEducation;
import com.portfoli.domain.GeneralMemberEducation;
import com.portfoli.service.FinalEducationService;


@Component
public class FinalEducationServiceImpl implements FinalEducationService {

  @Autowired
  GeneralMemberEducationDao generalMemberEducationDao;

  @Autowired
  GeneralMemberEducationMajorDao generalMemberEducationMajorDao;

  @Autowired
  FinalEducationDao finalEducationDao;

  @Override
  public GeneralMemberEducation memEuds(int memberNumber) throws Exception {
    return generalMemberEducationDao.findEducations(memberNumber);
  }

  @Override
  public List<FinalEducation> findAll() throws Exception {
    return finalEducationDao.findAll();
  }

  @Override
  public void insertEduByMemberNumber(List<GeneralMemberEducation> edus, int memberNumber)
      throws Exception {

    generalMemberEducationMajorDao.deleteAll(memberNumber);
    generalMemberEducationDao.deleteAll(memberNumber);
    generalMemberEducationDao.insertEduByMemberNumber(edus);
    generalMemberEducationMajorDao.insert(edus);
  }

  @Override
  public List<GeneralMemberEducation> findEduAll() {
    return generalMemberEducationDao.findEduAll();
  }



}
