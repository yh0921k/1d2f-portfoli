package com.portfoli.dao;

import java.util.Map;
import com.portfoli.domain.Portfolio;

public interface PortfolioSkillDao {

  Portfolio findAllSkill(int number) throws Exception;

  boolean insert(Map<String, Integer> map) throws Exception;

  int deleteByBoardNumber(int boardNumber) throws Exception;


}
