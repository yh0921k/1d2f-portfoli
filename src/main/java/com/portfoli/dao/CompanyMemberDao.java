package com.portfoli.dao;

import com.portfoli.domain.Member;

public interface CompanyMemberDao {
  int insert(Member member) throws Exception;
}