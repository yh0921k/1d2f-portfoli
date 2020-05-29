package com.portfoli.service;

import com.portfoli.domain.Portfolio;

public interface PortfolioSkillService {

  Portfolio findAllSkill(int number) throws Exception;

  boolean add(int boardNumber, int memberSkillNumber) throws Exception;



}
