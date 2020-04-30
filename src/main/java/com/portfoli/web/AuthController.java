package com.portfoli.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.portfoli.domain.Member;
import com.portfoli.service.MemberService;
import com.portfoli.service.UserMailSendService;

@Controller
@RequestMapping("auth")
public class AuthController {

  static Logger logger = LogManager.getLogger(MemberController.class);

  public AuthController() {
    MemberController.logger.debug("AuthController 객체 생성!");
  }

  @Autowired
  MemberService memberService;
  
  @Autowired
  private UserMailSendService mailsender;

  @GetMapping("loginForm")
  public void loginForm(HttpServletRequest request, Model model) throws Exception {

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
    model.addAttribute("email", email);
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

    Member member = memberService.get(email, password);
    System.out.println("----------------------------------------");

    if (member != null) {
      request.getSession().setAttribute("loginUser", member);
      return "redirect:/";
    } else {
      request.getSession().invalidate();
      request.setAttribute("refreshUrl", "2;url=login");
      return null;
    }
  }

  @GetMapping("logout")
  public String logout(HttpServletRequest request) {
    request.getSession().invalidate();
    return "redirect:/";
  }

  @GetMapping("findPassword")
  public void findPasswordForm() {}

  @PostMapping("findPassword")
  public String findPassword(String email, Model model) throws Exception{
    String userEmail = memberService.getEmailByEmail(email);
    
    if(userEmail != null) {
      model.addAttribute("email", email);
      mailsender.findPassword(email);
      model.addAttribute("message", "해당 이메일로 임시 비밀번호를 보냈습니다.");
      return "redirect:/";
    } else {
      model.addAttribute("error", "해당 이메일은 가입된 이메일이 아닙니다.");
      return "redirect:./";
    }
  }
  
}
