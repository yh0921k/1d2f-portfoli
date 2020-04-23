package com.portfoli.dao;

import java.util.Map;
import com.portfoli.domain.GeneralMember;

public interface GeneralMemberDao {

  int insert(GeneralMember generalMember) throws Exception;

  GeneralMember findByEmailAndPassword(Map<String, Object> params) throws Exception;

  GeneralMember findByMemberNumber(int memberNumber) throws Exception;

  int updateProfilePicture(Map<String, Object> generalMember) throws Exception;


}
