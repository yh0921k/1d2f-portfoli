package com.portfoli.dao;

import java.util.Map;
import com.portfoli.domain.Member;

public interface MemberDao {

  int insert(Member member) throws Exception;
  
  int delete(Map<String, Object> params) throws Exception;
  
  int updateDefaultInfo(Member member) throws Exception;
  
  int updatePassword(Map<String, Object> params) throws Exception;
  
  int updateAddress(Member member) throws Exception;

  Member findByEmailAndPassword(Map<String, Object> params) throws Exception;

  Member findByMemberNumber(int userNumber) throws Exception;
  
  int putKey(Map<String, Object> params); // 유저 인증키 생성 메서드

  int alter_userkey(Map<String, Object> params); // 유저 인증키 Y로 바꿔주는 메서드

  String getEmailByEmail(String email);

  Member getMemberByOtherProvider(Map<String, Object> params);
  
}
