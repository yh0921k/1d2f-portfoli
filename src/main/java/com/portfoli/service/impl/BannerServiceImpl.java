package com.portfoli.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.portfoli.dao.BannerDao;
import com.portfoli.domain.Banner;
import com.portfoli.service.BannerService;

@Component
public class BannerServiceImpl implements BannerService {
  @Autowired
  BannerDao bannerDao;

  @Override
  public int add(Banner banner) throws Exception {
    return bannerDao.insert(banner);
  }
}