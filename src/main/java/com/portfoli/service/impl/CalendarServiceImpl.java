package com.portfoli.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.portfoli.dao.CalendarDao;
import com.portfoli.domain.Calendar;
import com.portfoli.service.CalendarService;

@Component
public class CalendarServiceImpl implements CalendarService {

  @Autowired
  CalendarDao calendarDao;

  @Override
  public void add(Calendar calendar) throws Exception {
    if (calendarDao.insert(calendar) < 0)
      throw new Exception("일정 추가 도중 에러 발생");

  }

  @Override
  public List<Calendar> get(int memberNumber) {
    return calendarDao.find(memberNumber);
  }

}
