package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.FinalEducation;
import com.portfoli.domain.GeneralMemberEducation;

public interface FinalEducationService {

  GeneralMemberEducation memEuds(int number) throws Exception;

  List<FinalEducation> findAll() throws Exception;

  void insertEduByMemberNumber(List<GeneralMemberEducation> edus, int memberNumber)
      throws Exception;

  List<GeneralMemberEducation> findEduAll();

}
