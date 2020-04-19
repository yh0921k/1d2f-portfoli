package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Notice;

public interface NoticeService {

  int add(Notice notice) throws Exception;

  List<Notice> list() throws Exception;

}
