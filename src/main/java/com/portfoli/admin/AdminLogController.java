package com.portfoli.admin;

import java.sql.Date;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.portfoli.domain.Admin;

@Controller("log")
public class AdminLogController {

  static Logger logger = LogManager.getLogger(AdminLogController.class);

  @Autowired
  ServletContext servletContext;

  //@Autowired
  //LogService LogService;

  public AdminLogController() {
    logger.info("AdminLogController 객체 생성!");
  }

  @GetMapping("contentsLog")
  public void contentsLog(HttpSession session) throws Exception {
    System.out.println(new Date(System.currentTimeMillis()).toString());
  }

//  @RequestMapping("index")
//  public String login(HttpServletRequest request, String id, String password) throws Exception {
//    logger.info("AdminController::login() called");
//
//    if (request.getSession().getAttribute("admin") != null) {
//      return "index";
//    }
//
//    //Admin admin = adminService.get(id, password);
//    if (admin != null) {
//      HttpSession session = request.getSession();
//      session.setAttribute("admin", admin);
//      session.setAttribute("expire", EXPIRETIME);
//      session.setMaxInactiveInterval(EXPIRETIME);
//      return "index";
//    } else {
//      return "loginForm";
//    }
//  }
}
