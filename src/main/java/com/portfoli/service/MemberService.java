package com.portfoli.service;

import java.util.Map;
import com.portfoli.domain.CompanyMember;
import com.portfoli.domain.GeneralMember;
import com.portfoli.domain.Member;

public interface MemberService {

  int add(Member member, GeneralMember generalMember) throws Exception;

  int add(Member member, CompanyMember companyMember, int companyNumber) throws Exception;

  Member get(String email, String password) throws Exception;

  Member get(int number) throws Exception;

  int update(Map<String, Object> generalMember) throws Exception;

  GeneralMember getGeneralMember(int number) throws Exception;

}
