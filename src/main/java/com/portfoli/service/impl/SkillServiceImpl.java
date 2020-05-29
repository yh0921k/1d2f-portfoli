package com.portfoli.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.SkillDao;
import com.portfoli.domain.Skill;
import com.portfoli.service.SkillService;

@Component
public class SkillServiceImpl implements SkillService {

  TransactionTemplate transactionTemplate;
  SkillDao skillDao;

  public SkillServiceImpl(//
      PlatformTransactionManager txManager, SkillDao skillDao) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.skillDao = skillDao;
  }

  @Override
  public List<Skill> list() throws Exception {
    return skillDao.findAll();
  }

  @Override
  public List<Skill> list(int fieldNumber) throws Exception {
    return skillDao.findAllByNumber(fieldNumber);
  }

  @Override
  public List<Skill> listOfMember(int memberNumber) throws Exception {
    return skillDao.findAllByMemberNumber(memberNumber);
  }
}
