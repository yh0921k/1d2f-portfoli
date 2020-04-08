package com.portfoli.service.impl;

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
  public void add(Member member, GeneralMember generalMember) throws Exception {
    if (memberDao.insert(member) == 0) {
      throw new Exception("회원 등록 실패.");
    }
    System.out.println(member.getNumber() + member.getName());
    generalMember.setNumber(member.getNumber());
    generalMemberDao.insert(generalMember);
  }

}
