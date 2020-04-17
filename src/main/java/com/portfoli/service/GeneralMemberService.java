package com.portfoli.service;

import com.portfoli.domain.GeneralMember;
import com.portfoli.domain.Member;

public interface GeneralMemberService {

  int add(Member member, GeneralMember generalMember) throws Exception;

  GeneralMember get(String email, String password) throws Exception;

}
