package com.portfoli.admin;

import java.sql.Date;
import java.text.SimpleDateFormat;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.portfoli.service.AdminLogService;

@Controller
@RequestMapping("log")
public class AdminLogController {

  static Logger logger = LogManager.getLogger(AdminLogController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  AdminLogService adminLogService;

  public AdminLogController() {
    logger.info("AdminLogController 객체 생성!");
  }

  @GetMapping("contentsLog")
  public void contentsLog(String logDate, @RequestParam(defaultValue = "10") int moreLine,
      @RequestParam(defaultValue = "0") int startLine, HttpServletRequest request, Model model)
      throws Exception {
    // @RequestParam(defaultValue = "today") @DateTimeFormat(pattern = "yyyy-MM-dd") Date logDate,
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    String today = format.format(new Date(System.currentTimeMillis()));
    System.out.println("today = " + today);
    System.out.println("date = " + logDate);
    String filepath = System.getProperty("catalina.base");
    if (logDate == null || logDate.equals(today)) {
      model.addAttribute("logDate", today);
      filepath += "/logs/portfoli.log";
    } else {
      model.addAttribute("logDate", logDate);
      filepath += "/logs/portfoli_" + logDate + "_1.log";
    }
    System.out.println("LogFile : " + filepath);

    model.addAttribute("moreLine", moreLine);
    model.addAttribute("loglist", adminLogService.get(filepath, startLine, moreLine));
  }

  @GetMapping("moreContentsLog")
  public void moreContentsLog(String logDate, @RequestParam(defaultValue = "10") int moreLine,
      @RequestParam(defaultValue = "0") int startLine, HttpServletRequest request, Model model)
      throws Exception {
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    String today = format.format(new Date(System.currentTimeMillis()));
    System.out.println("today = " + today);
    System.out.println("date = " + logDate);
    String filepath = System.getProperty("catalina.base");
    if (logDate == null || logDate.equals(today)) {
      model.addAttribute("logDate", today);
      filepath += "/logs/portfoli.log";
    } else {
      model.addAttribute("logDate", logDate);
      filepath += "/logs/portfoli_" + logDate + "_1.log";
    }
    System.out.println("LogFile : " + filepath);

    model.addAttribute("moreLine", moreLine);
    model.addAttribute("loglist", adminLogService.get(filepath, startLine, moreLine));
  }
}
