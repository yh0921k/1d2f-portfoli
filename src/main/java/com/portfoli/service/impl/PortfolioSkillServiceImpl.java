package com.portfoli.service.impl;

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
  public Portfolio findAllSkill(int number) {
    return portfolioSkillDao.findAllSkill(number);
  }





}
