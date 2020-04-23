package com.portfoli.service.impl;

import java.util.HashMap;
import java.util.Map;
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


  // 일반회원가입
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

  // 기업회원가입
  @Transactional
  @Override
  public int add(Member member, CompanyMember companyMember, int companyNumber) throws Exception {
    member.setType(2);
    if (memberDao.insert(member) == 0) {
      return 0;
    }

    companyMember.setNumber(member.getNumber());
    companyMember.setCompanyNumber(companyNumber);
    companyMemberDao.insert(companyMember);
    return 1;
  }


  // 로그인
  @Override
  public Member get(String email, String password) throws Exception {
    HashMap<String, Object> params = new HashMap<>();
    params.put("email", email);
    params.put("password", password);
    int type = memberDao.findByEmailAndPassword(params).getType();

    if (type == 1) {
      return generalMemberDao.findByEmailAndPassword(params);
    } else if (type == 2) {
      return companyMemberDao.findByEmailAndPassword(params);
    } else {
      throw new Exception("로그인 실패");
    }
  }


  @Override
  public int update(Map<String, Object> generalMember) throws Exception {
    if (generalMemberDao.updateProfilePicture(generalMember) > 0) {
      return 1;
    } else {
      return 0;
    }
  }


  @Override
  public Member get(int number) throws Exception {
    Member member = generalMemberDao.findByMemberNumber(number);
    if ((member) != null) {
      return member;
    } else {
      return null;
    }
  }

}
