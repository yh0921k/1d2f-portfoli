package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.Banner;

public interface BannerDao {
  int insert(Banner banner) throws Exception;

  List<Banner> findAllActivated() throws Exception;

  List<Banner> findAllNotActivated() throws Exception;
}