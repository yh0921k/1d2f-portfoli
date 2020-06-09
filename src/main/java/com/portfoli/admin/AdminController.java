package com.portfoli.admin;

import java.util.Arrays;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.portfoli.dao.MemberDao;
import com.portfoli.dao.VisitorDao;
import com.portfoli.domain.Admin;
import com.portfoli.service.AdminService;

@Controller
@RequestMapping("auth")
public class AdminController {

  static Logger logger = LogManager.getLogger(AdminController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  AdminService adminService;

  @Autowired
  MemberDao memberDao;

  @Autowired
  VisitorDao visitorDao;

  public AdminController() {
    logger.info("AdminController 객체 생성!");
  }

  @GetMapping("loginForm")
  public void loginForm(final HttpServletRequest request) throws Exception {
    System.out.println("loginForm");
    HttpSession session = request.getSession();

    System.out.println("Session isValid : " + session.getAttribute("isValid"));
    if (session.getAttribute("isValid") != null
        && session.getAttribute("isValid").equals("false")) {
      request.setAttribute("isValid", "false");
    }
    session.invalidate();
    System.out.println("loginForm after invalidate()");
  }

  @GetMapping("logout")
  public String logout() throws Exception {
    System.out.println("logout");
    return "loginForm";
  }

  @RequestMapping("login")
  public String login(final HttpServletRequest request, final HttpServletResponse response,
      final String id, final String password) throws Exception {
    logger.info("AdminController::login() called");

    if (request.getSession().getAttribute("admin") != null) {
      return "redirect:index";
    }

    Admin admin = adminService.get(id, password);
    HttpSession session = request.getSession();
    System.out.println("Admin : " + admin);
    if (admin != null) {
      session.setAttribute("admin", admin);
      return "redirect:index";
    }
    session.setAttribute("isValid", "false");
    return "redirect:loginForm";
  }

  @GetMapping("index")
  public void index(Model model) throws Exception {
    int[] memberCount = new int[12];
    for (int i = 1; i <= 12; i++) {
      memberCount[i - 1] = memberDao.findRegisteredCountForAMonth(i);
    }

    int[] visitCount = new int[12];
    for (int i = 1; i < 12; i++) {
      visitCount[i - 1] = visitorDao.findVisitCountForAMonth(i);
    }

    model.addAttribute("newMemberCountForAMonth", Arrays.toString(memberCount));
    model.addAttribute("visitCountForAMonth", Arrays.toString(visitCount));
  }
}
