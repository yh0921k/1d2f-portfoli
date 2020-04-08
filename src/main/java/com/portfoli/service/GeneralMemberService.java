package com.portfoli.service;

import com.portfoli.domain.GeneralMember;
import com.portfoli.domain.Member;

public interface GeneralMemberService {

  void add(Member member, GeneralMember generalMember) throws Exception;

}
