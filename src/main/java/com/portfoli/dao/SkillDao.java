package com.portfoli.dao;

import java.util.List;
import java.util.Map;
import com.portfoli.domain.GeneralMemberSkill;
import com.portfoli.domain.Skill;

public interface SkillDao {

  public List<Skill> findAll() throws Exception;

  public List<Skill> findAllByNumber(int fieldNumber) throws Exception;

  public List<Skill> findAllByMemberNumber(int memberNumber) throws Exception;

  public int findMemberSkillNumber(Map<String, Integer> map) throws Exception;

  public int delete(Map<String, Object> params) throws Exception;

  public int insert(Map<String, Object> params) throws Exception;

  public Skill findByName(String skillName) throws Exception;

  public GeneralMemberSkill findMemberSkill(Map<String, Object> params) throws Exception;
}
