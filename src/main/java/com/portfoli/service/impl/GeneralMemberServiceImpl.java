package com.portfoli.service.impl;

import com.portfoli.dao.GeneralMemberDao;
import com.portfoli.domain.GeneralMember;
import com.portfoli.service.GeneralMemberService;

public class GeneralMemberServiceImpl implements GeneralMemberService {

  GeneralMemberDao generalMemberDao;

  public GeneralMemberServiceImpl(GeneralMemberDao generalMemberDao) {
    this.generalMemberDao = generalMemberDao;
  }

  @Override
  public int add(GeneralMember generalMember) throws Exception {
    return generalMemberDao.insert(generalMember);
  }

}
