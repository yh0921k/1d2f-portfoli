package com.portfoli.service.impl;

import java.util.HashMap;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.CompanyDao;
import com.portfoli.dao.CompanyMemberDao;
import com.portfoli.dao.GeneralMemberDao;
import com.portfoli.dao.MemberDao;
import com.portfoli.domain.CompanyMember;
import com.portfoli.domain.GeneralMember;
import com.portfoli.domain.Member;
import com.portfoli.service.MemberService;

@Component
public class MemberServiceImpl implements MemberService {

  MemberDao memberDao;
  GeneralMemberDao generalMemberDao;
  CompanyMemberDao companyMemberDao;
  CompanyDao companyDao;
  TransactionTemplate transactionTemplate;


  public MemberServiceImpl(MemberDao memberDao, GeneralMemberDao generalMemberDao,
      CompanyMemberDao companyMemberDao, CompanyDao companyDao,
      PlatformTransactionManager txManager) {
    this.memberDao = memberDao;
    this.generalMemberDao = generalMemberDao;
    this.companyMemberDao = companyMemberDao;
    this.companyDao = companyDao;
    this.transactionTemplate = new TransactionTemplate(txManager);
  }


  @Transactional
  @Override
  public int add(Member member, GeneralMember generalMember) throws Exception {
    member.setType(1);
    if (memberDao.insert(member) == 0) {
      return 0;
    }
    generalMember.setNumber(member.getNumber());
    generalMemberDao.insert(generalMember);
    return 1;
  }

  @Transactional
  @Override
  public void add(CompanyMember companyMember) throws Exception {
    companyMember.setType(2);
    // Company company = new Company();
    // companyMember.setCompany(company);
    if (companyDao.insert(companyMember.getCompany()) == 0) {
      throw new Exception("기업 등록 실패");
    }

    memberDao.insert(companyMember);
    companyMemberDao.insert(companyMember);
  }

  @Override
  public GeneralMember get(String email, String password) throws Exception {
    HashMap<String, Object> params = new HashMap<>();
    params.put("email", email);
    params.put("password", password);
    return generalMemberDao.findByEmailAndPassword(params);
  }

}
