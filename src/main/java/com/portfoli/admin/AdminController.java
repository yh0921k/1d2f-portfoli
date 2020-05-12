package com.portfoli.admin;

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
import com.portfoli.service.AdminService;

@Controller
public class AdminController {

  static Logger logger = LogManager.getLogger(AdminController.class);
  final static int EXPIRETIME = 180;

  @Autowired
  ServletContext servletContext;

  @Autowired
  AdminService adminService;

  public AdminController() {
    logger.info("AdminController 객체 생성!");
  }

  @GetMapping("loginForm")
  public void loginForm(HttpSession session) throws Exception {
    session.invalidate();
  }

  @GetMapping("logout")
  public String logout(HttpSession session) throws Exception {
    return "loginForm";
  }

  @RequestMapping("index")
  public String login(HttpServletRequest request, String id, String password) throws Exception {
    logger.info("AdminController::login() called");

    if (request.getSession().getAttribute("admin") != null) {
      return "index";
    }

    Admin admin = adminService.get(id, password);
    if (admin != null) {
      HttpSession session = request.getSession();
      session.setAttribute("admin", admin);
      session.setAttribute("expire", EXPIRETIME);
      session.setMaxInactiveInterval(EXPIRETIME);
      return "index";
    } else {
      return "loginForm";
    }
  }
}
