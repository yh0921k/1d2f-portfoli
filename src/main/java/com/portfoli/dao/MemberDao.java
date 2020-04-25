package com.portfoli.dao;

import java.util.Map;
import com.portfoli.domain.Member;

public interface MemberDao {

  int insert(Member member) throws Exception;
  
  int delete(int memberNumber) throws Exception;
  
  int updateDefaultInfo(Member member) throws Exception;
  
  int updatePassword(Map<String, Object> params) throws Exception;
  
  int updateAddress(Member member) throws Exception;

  Member findByEmailAndPassword(Map<String, Object> params) throws Exception;

  Member findByMemberNumber(int userNumber) throws Exception;
}
