package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Banner;

public interface BannerService {
  int add(Banner banner) throws Exception;

  List<Banner> activatedList() throws Exception;

  List<Banner> notActivatedList() throws Exception;

  Banner get(int number) throws Exception;
}