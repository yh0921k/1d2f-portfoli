package com.portfoli.service;

import java.util.List;
import java.util.Map;
import com.portfoli.domain.GeneralMemberSkill;
import com.portfoli.domain.Skill;

public interface SkillService {

  public List<Skill> list() throws Exception;

  public List<Skill> list(int fieldNumber) throws Exception;

  public List<Skill> listOfMember(int memberNumber) throws Exception;

  public int delete(Map<String, Object> params) throws Exception;

  public int add(Map<String, Object> params) throws Exception;

  public Skill get(String skillName) throws Exception;

  public GeneralMemberSkill get(Map<String, Object> params) throws Exception;
}
