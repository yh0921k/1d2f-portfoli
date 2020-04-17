package com.portfoli.service.impl;

import java.util.HashMap;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.GeneralMemberDao;
import com.portfoli.dao.MemberDao;
import com.portfoli.domain.GeneralMember;
import com.portfoli.domain.Member;
import com.portfoli.service.GeneralMemberService;

@Component
public class GeneralMemberServiceImpl implements GeneralMemberService {

  MemberDao memberDao;
  GeneralMemberDao generalMemberDao;
  TransactionTemplate transactionTemplate;

  public GeneralMemberServiceImpl(GeneralMemberDao generalMemberDao, MemberDao memberDao,
      PlatformTransactionManager txManager) {
    this.generalMemberDao = generalMemberDao;
    this.memberDao = memberDao;
    this.transactionTemplate = new TransactionTemplate(txManager);
  }

  @Transactional
  @Override
  public int add(Member member, GeneralMember generalMember) throws Exception {
    if (memberDao.insert(member) == 0) {
      return 0;
    }
    System.out.println(member.getNumber() + member.getName());
    generalMember.setNumber(member.getNumber());
    generalMemberDao.insert(generalMember);
    return 1;
  }

  @Override
  public GeneralMember get(String email, String password) throws Exception {
    HashMap<String, Object> params = new HashMap<>();
    params.put("email", email);
    params.put("password", password);
    return generalMemberDao.findByEmailAndPassword(params);
  }

}
