package com.portfoli.web;

import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.portfoli.domain.Member;
import com.portfoli.domain.Message;
import com.portfoli.service.MemberService;
import com.portfoli.service.MessageService;
import com.portfoli.service.UserMailSendService;

@Controller
@RequestMapping("auth")
public class AuthController {

  static Logger logger = LogManager.getLogger(MemberController.class);

  private String NAVER_CLIENT_ID = "ot_V9PT1hKadV9ukCY0L";
  private String NAVER_CALLBACK = "http://localhost:9999/portfoli/app/auth/naverLogin";

  public AuthController() {
    MemberController.logger.debug("AuthController 객체 생성!");
  }

  @Autowired
  MemberService memberService;

  @Autowired
  private UserMailSendService mailsender;

  @Autowired
  MessageService messageService;

  @GetMapping("loginForm")
  public void loginForm(HttpSession session, HttpServletRequest request, Model model)
      throws Exception {

    String email = "";
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
      for (Cookie cookie : cookies) {
        if (cookie.getName().equals("email")) {
          email = cookie.getValue();
          break;
        }
      }
      // naver
      String redirectURI = URLEncoder.encode(NAVER_CALLBACK, "UTF-8");
      SecureRandom random = new SecureRandom();
      String state = new BigInteger(130, random).toString();
      String naverApiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
      naverApiURL += String.format("&client_id=%s&redirect_uri=%s&state=%s", NAVER_CLIENT_ID,
          redirectURI, state);
      session.setAttribute("state", state);
      model.addAttribute("naverApiURL", naverApiURL);
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

    if (member != null) {
      request.getSession().setAttribute("loginUser", member);

      List<Message> recentMessages = messageService.listReceivedMessage(member.getNumber(), 1, 5);
      for (Message m : recentMessages) {
        Member sender = memberService.get(m.getSenderNumber());
        m.setMember(sender);
      }
      request.getSession().setAttribute("recentMessages", recentMessages);

      return "redirect:/";

    } else {
      throw new Exception("로그인에 실패하였습니다. <br>아이디 혹은 비밀번호를 확인해주세요.");
    }
  }

  @GetMapping("logout")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:/";
  }

  @GetMapping("findPassword")
  public void findPasswordForm() {}

  @PostMapping("findPassword")
  public String findPassword(String email, Model model) throws Exception {
    String userEmail = memberService.getEmailByEmail(email);

    if (userEmail != null) {
      model.addAttribute("email", email);
      mailsender.findPassword(email);
      return "redirect:/";
    } else {
      throw new Exception("해당 이메일은 가입된 이메일이 아닙니다.");
    }
  }

}
