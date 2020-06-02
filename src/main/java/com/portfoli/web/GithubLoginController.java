package com.portfoli.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import com.portfoli.domain.GeneralMember;
import com.portfoli.domain.Member;
import com.portfoli.domain.Message;
import com.portfoli.service.MemberService;
import com.portfoli.service.MessageService;

@Controller
@RequestMapping("auth")
public class GithubLoginController {

  @Autowired
  MemberService memberService;
  @Autowired
  MessageService messageService;

  @GetMapping("githubRedirectUri")
  public String redirectUri(String code) {
    return "redirect:githubLogin?code=" + code;
  }

  @SuppressWarnings("unchecked")
  @GetMapping("githubLogin")
  public void githubCallback(String code, HttpSession session, HttpServletRequest request)
      throws IOException, ParseException {
    System.out.println("-----------------githubLogin");

    String apiURL = "https://github.com/login/oauth/access_token";
    String clientID = "74e05c13d93fb5feacb1";
    String clientSecret = "c996bdd3f9d1ca9466bf9ff4639dff991bbf796f";

    Map<String, Object> key = new HashMap<>();
    key.put("client_id", clientID);
    key.put("client_secret", clientSecret);
    key.put("code", code);

    try {
      Gson gson = new Gson();
      HttpHeaders headers = new HttpHeaders();
      headers.setContentType(MediaType.APPLICATION_JSON);

      HttpEntity<String> entityRequest = new HttpEntity<String>(gson.toJson(key), headers);

      RestTemplate restTemplate = new RestTemplate();
      Map<String, String> result = restTemplate.postForObject(apiURL, entityRequest, Map.class);

      String accessToken = result.get("access_token");

      headers.add("Authorization", "token " + accessToken);

      entityRequest = new HttpEntity<>(headers);

      ResponseEntity<String> response = restTemplate.exchange(
          "https://api.github.com/user", HttpMethod.GET,
          entityRequest, String.class);

      if (response.getStatusCodeValue() == 200) {
        Map<String, Object> parsedJson = new JSONParser(response.getBody()).parseObject();
        String id = (String) parsedJson.get("login");
        String name;
        if (parsedJson.get("name") != null) {
          name = (String) parsedJson.get("name");
        } else {
          name = (String) parsedJson.get("login");
        }
        String photo = (String) parsedJson.get("avatar_url");
        String email = id + "@github.com";
        String password = (String) parsedJson.get("node_id");

        Member member = memberService.findMemberByOtherProvider("github", email);
        if (member != null) {
          session.setAttribute("loginUser", member);

          List<Message> recentMessages =
              messageService.listReceivedMessage(member.getNumber(), 1, 5);
          for (Message m : recentMessages) {
            Member sender = memberService.get(m.getSenderNumber());
            m.setMember(sender);
          }
          session.setAttribute("recentMessages", recentMessages);

        } else {
          String existEmail = memberService.getEmailByEmail(email);
          String provider = memberService.getProviderByEmail(email);

          // 해당 이메일 부재 -> 회원가입
          if (existEmail == null) {
            Member newMember = new Member();
            newMember.setName(name);
            newMember.setEmail(email);
            newMember.setProvider("github");
            newMember.setPassword(password);
            newMember.setPhotoFilePath(photo);
            newMember.setType(1);
            newMember.setId("github_" + id);
            newMember.setSmsYN(0);
            newMember.setEmailYN(0);
            GeneralMember newGeneralMember = new GeneralMember();
            newGeneralMember.setSeekingFlag(1);
            newGeneralMember.setMembereship("none");

            if (memberService.add(newMember, newGeneralMember) > 0) {
              member = memberService.findMemberByOtherProvider("github", email);
              session.setAttribute("loginUser", member);

              List<Message> recentMessages =
                  messageService.listReceivedMessage(member.getNumber(), 1, 5);
              for (Message m : recentMessages) {
                Member sender = memberService.get(m.getSenderNumber());
                m.setMember(sender);
              }
              session.setAttribute("recentMessages", recentMessages);

            } else {
              throw new Exception("깃허브 연동 실패");
            }
          } else {
            request.setAttribute("provider_", provider);
            request.setAttribute("email_", existEmail);
          }
        }
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  }

  @PostMapping("githubLinking")
  private ModelAndView linking(String provider, String email) throws Exception {
    if (memberService.updateProvider(provider, email) > 0) {
      ModelAndView mv = new ModelAndView();
      mv.addObject("message1", "기존 계정에 깃허브 계정이 연동되었습니다.");
      mv.addObject("message2", "앞으로는 깃허브 계정으로 로그인 해 주세요!");
      mv.setViewName("messageView");
      return mv;

    } else {
      throw new Exception("깃허브 연동 실패");
    }
  }
}