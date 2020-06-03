package com.portfoli.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.portfoli.domain.GeneralMember;

public interface GeneralMemberDao {

  int insert(GeneralMember generalMember) throws Exception;

  int delete(int memberNumber) throws Exception;

  GeneralMember findByEmailAndPassword(Map<String, Object> params) throws Exception;

  GeneralMember findByGeneralMemberNumber(int generalMemberNumber) throws Exception;

  GeneralMember getSessionByGNumber(int generalMemberNumber) throws Exception;

  int updateFlag(HashMap<String, Object> params) throws Exception;

  List<GeneralMember> findAll() throws Exception;

}
