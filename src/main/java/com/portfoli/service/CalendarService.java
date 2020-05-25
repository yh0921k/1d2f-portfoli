package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Calendar;

public interface CalendarService {

  void add(Calendar calendar) throws Exception;

  List<Calendar> get(int memberNumber);


}
