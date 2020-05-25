package com.portfoli.web;

import javax.servlet.annotation.MultipartConfig;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/calendar")
@MultipartConfig(maxFileSize = 100000000)
public class CalendarController {
  final int pageSize = 10;
  static Logger logger = LogManager.getLogger(CalendarController.class);

  public CalendarController() {
    CalendarController.logger.debug("CalendarController 객체 생성!");
  }

  @RequestMapping("list")
  public void showPdf(Model model) throws Exception {
  }




}