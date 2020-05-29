package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Skill;

public interface SkillService {

  public List<Skill> list() throws Exception;

  public List<Skill> list(int fieldNumber) throws Exception;

  public List<Skill> listOfMember(int memberNumber) throws Exception;

  public int getMemberSkillNumber(int generalMemberNumber, int skillNumber) throws Exception;

}
