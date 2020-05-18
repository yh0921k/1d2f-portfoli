package com.portfoli.admin;

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
  public void contentsLog(@RequestParam(defaultValue = "10") int moreLine,
      @RequestParam(defaultValue = "0") int startLine, HttpServletRequest request, Model model)
      throws Exception {
    // System.out.println(new Date(System.currentTimeMillis()).toString());
    String filepath = System.getProperty("catalina.base") + "/logs/portfoli.log";
    System.out.println("LogFile : " + filepath);

    model.addAttribute("moreLine", moreLine);
    model.addAttribute("loglist", adminLogService.get(filepath, startLine, moreLine));
  }

  @GetMapping("moreContentsLog")
  public void moreContentsLog(@RequestParam(defaultValue = "10") int moreLine,
      @RequestParam(defaultValue = "0") int startLine, HttpServletRequest request, Model model)
      throws Exception {
    // System.out.println(new Date(System.currentTimeMillis()).toString());
    String filepath = System.getProperty("catalina.base") + "/logs/portfoli.log";
    System.out.println("LogFile : " + filepath);

    model.addAttribute("moreLine", moreLine);
    model.addAttribute("loglist", adminLogService.get(filepath, startLine, moreLine));
  }

  // @RequestMapping("index")
  // public String login(HttpServletRequest request, String id, String password) throws Exception {
  // logger.info("AdminController::login() called");
  //
  // if (request.getSession().getAttribute("admin") != null) {
  // return "index";
  // }
  //
  // //Admin admin = adminService.get(id, password);
  // if (admin != null) {
  // HttpSession session = request.getSession();
  // session.setAttribute("admin", admin);
  // session.setAttribute("expire", EXPIRETIME);
  // session.setMaxInactiveInterval(EXPIRETIME);
  // return "index";
  // } else {
  // return "loginForm";
  // }
  // }
}
