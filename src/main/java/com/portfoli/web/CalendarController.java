package com.portfoli.web;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("calendar")
public class CalendarController {

  static Logger logger = LogManager.getLogger(CalendarController.class);

  public CalendarController() {
    CalendarController.logger.debug("CalendarController 객체 생성!");
  }

  @GetMapping("calendar")
  public void calendar() throws Exception {}

  @GetMapping("eventCreate")
  public void eventCreate() throws Exception {}

  @GetMapping("eventEdit")
  public void eventEdit() throws Exception {}

}
