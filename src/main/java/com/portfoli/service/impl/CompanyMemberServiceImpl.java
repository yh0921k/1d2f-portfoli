package com.portfoli.service.impl;

import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.CompanyDao;
import com.portfoli.dao.CompanyMemberDao;
import com.portfoli.dao.MemberDao;
import com.portfoli.domain.CompanyMember;
import com.portfoli.service.CompanyMemberService;

@Component
public class CompanyMemberServiceImpl implements CompanyMemberService {
  TransactionTemplate transactionTemplate;
  MemberDao memberDao;
  CompanyMemberDao companyMemberDao;
  CompanyDao companyDao;

  public CompanyMemberServiceImpl(PlatformTransactionManager txManager,
      MemberDao memberDao, CompanyMemberDao companyMemberDao, CompanyDao companyDao) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.memberDao = memberDao;
    this.companyMemberDao = companyMemberDao;
    this.companyDao = companyDao;
  }

  @Transactional
  @Override
  public void add(CompanyMember companyMember) throws Exception {
    if (companyDao.insert(companyMember.getCompany()) == 0) {
      throw new Exception("기업 등록 실패");
    }

    memberDao.insert(companyMember);
    companyMemberDao.insert(companyMember);
  }
}