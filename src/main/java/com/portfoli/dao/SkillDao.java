package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.Skill;

public interface SkillDao {

  public List<Skill> findAll() throws Exception;

  public List<Skill> findAllByNumber(int fieldNumber) throws Exception;
}
