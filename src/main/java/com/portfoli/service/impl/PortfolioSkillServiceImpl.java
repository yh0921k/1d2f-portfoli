package com.portfoli.service.impl;

import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Component;
import com.portfoli.dao.PortfolioSkillDao;
import com.portfoli.domain.Portfolio;
import com.portfoli.service.PortfolioSkillService;

@Component
public class PortfolioSkillServiceImpl implements PortfolioSkillService {
  PortfolioSkillDao portfolioSkillDao;

  public PortfolioSkillServiceImpl(PortfolioSkillDao portfolioSkillDao) {
    this.portfolioSkillDao = portfolioSkillDao;
  }

  @Override
  public Portfolio findAllSkill(int number) throws Exception {
    return portfolioSkillDao.findAllSkill(number);
  }

  @Override
  public boolean add(int boardNumber, int memberSkillNumber) throws Exception {
    Map<String, Integer> map = new HashMap<>();
    map.put("boardNumber", boardNumber);
    map.put("memberSkillNumber", memberSkillNumber);
    return portfolioSkillDao.insert(map);
  }





}
