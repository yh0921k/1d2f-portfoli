package com.portfoli.web;

import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.portfoli.domain.GeneralMember;
import com.portfoli.service.MemberService;

@Controller
@RequestMapping("auth")
public class AuthController {

  static Logger logger = LogManager.getLogger(MemberController.class);

  public AuthController() {
    MemberController.logger.debug("AuthController 객체 생성!");
  }

  @Autowired
  MemberService memberService;

  @GetMapping("loginForm")
  public void loginForm(HttpServletRequest request, Map<String, Object> model) throws Exception {

    String email = "";
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
      for (Cookie cookie : cookies) {
        if (cookie.getName().equals("email")) {
          email = cookie.getValue();
          break;
        }
      }
    }
    model.put("email", email);
  }

  @PostMapping("login")
  public String login(HttpServletRequest request, HttpServletResponse response, String email,
      String password, String saveEmail) throws Exception {

    Cookie cookie = new Cookie("email", email);
    if (saveEmail != null) {
      cookie.setMaxAge(60 * 60 * 24 * 30);
    } else {
      cookie.setMaxAge(0);
    }

    response.addCookie(cookie);

    GeneralMember member = memberService.get(email, password);
    System.out.println("----------------------------------------");

    if (member != null) {
      request.getSession().setAttribute("loginUser", member);
      request.setAttribute("refreshUrl", "2;url=../../index.html");
    } else {
      request.getSession().invalidate();
      request.setAttribute("refreshUrl", "2;url=login");
    }
    return "auth/login";
  }

  @RequestMapping("/auth/logout")
  public String logout(HttpServletRequest request) {
    request.getSession().invalidate();
    return "redirect:../../index.html";
  }


}
