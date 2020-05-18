package com.portfoli.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.portfoli.domain.GeneralMember;
import com.portfoli.domain.Member;
import com.portfoli.domain.Message;
import com.portfoli.service.MemberService;
import com.portfoli.service.MessageService;

@Controller
@RequestMapping("auth")
public class FacebookLoginController {

  @Autowired
  MemberService memberService;
  @Autowired
  MessageService messageService;

  @RequestMapping("facebookLogin")
  public void facebookCallback(HttpSession session, HttpServletRequest request,
      String facebookToken) throws IOException, ParseException {
    System.out.println("-----------------facebookLogin");
    String apiURL = "https://graph.facebook.com/me?fields=id,name,email";
    apiURL += "&access_token=" + facebookToken;

    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection) url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.println("responseCode=" + responseCode);

      if (responseCode == 200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else { // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }

      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if (responseCode == 200) {
        Map<String, Object> parsedJson = new JSONParser(res.toString()).parseObject();
        System.out.println(parsedJson);
        String facebookCode = parsedJson.get("id").toString(); // sub, name, email, picture
        String name = parsedJson.get("name").toString();
        String email = parsedJson.get("email").toString();

        Member member = memberService.findMemberByOtherProvider("facebook", email);

        // 페이스북-이메일 일치 고객 로그인
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
            newMember.setProvider("facebook");
            newMember.setPassword(facebookCode);
            newMember.setType(1);
            int idx = email.indexOf("@");
            newMember.setId("facebook_" + email.substring(0, idx));
            newMember.setSmsYN(0);
            newMember.setEmailYN(0);
            GeneralMember newGeneralMember = new GeneralMember();
            newGeneralMember.setSeekingFlag(1);
            newGeneralMember.setMembereship("none");

            if (memberService.add(newMember, newGeneralMember) > 0) {
              member = memberService.findMemberByOtherProvider("facebook", email);
              session.setAttribute("loginUser", member);
              List<Message> recentMessages =
                  messageService.listReceivedMessage(member.getNumber(), 1, 5);
              for (Message m : recentMessages) {
                Member sender = memberService.get(m.getSenderNumber());
                m.setMember(sender);
              }
              session.setAttribute("recentMessages", recentMessages);
            } else {
              throw new Exception("페이스북 연동 실패");
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

  @PostMapping("facebookLinking")
  private ModelAndView linking(String provider, String email) throws Exception {
    if (memberService.updateProvider(provider, email) > 0) {
      ModelAndView mv = new ModelAndView();
      mv.addObject("message1", "기존 계정에 페이스북 계정이 연동되었습니다.");
      mv.addObject("message2", "앞으로는 페이스북 계정으로 로그인 해 주세요!");
      mv.setViewName("messageView");
      return mv;
    } else {
      throw new Exception("페이스북 연동 실패");
    }

  }

}
