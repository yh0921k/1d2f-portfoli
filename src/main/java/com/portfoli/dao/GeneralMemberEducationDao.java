package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.GeneralMemberEducation;

public interface GeneralMemberEducationDao {

  GeneralMemberEducation findEducations(int memberNumber);

  int deleteAll(int memberNumber);

  int insertEduByMemberNumber(List<GeneralMemberEducation> edus);

  List<GeneralMemberEducation> findEduAll();

}
