package com.portfoli.dao;

import java.util.Map;
import com.portfoli.domain.CompanyMember;
import com.portfoli.domain.Member;

public interface CompanyMemberDao {

  int insert(Member member) throws Exception;

  CompanyMember findByEmailAndPassword(Map<String, Object> params) throws Exception;
}
