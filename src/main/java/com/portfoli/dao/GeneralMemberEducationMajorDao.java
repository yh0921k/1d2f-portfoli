package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.GeneralMemberEducation;

public interface GeneralMemberEducationMajorDao {

  int deleteAll(int memberNumber);

  int insert(List<GeneralMemberEducation> edus);

}
