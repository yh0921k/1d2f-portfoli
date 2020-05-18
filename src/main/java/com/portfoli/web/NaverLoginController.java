package com.portfoli.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
public class NaverLoginController {

  private String CLIENT_ID = "ot_V9PT1hKadV9ukCY0L";
  private String CLI_SECRET = "Nz4UvLDJco";
  private String CALLBACK = "http://localhost:9999/portfoli/app/auth/naverLogin";

  @Autowired
  MemberService memberService;
  @Autowired
  MessageService messageService;

  // 콜백 페이지 컨트롤러

  @SuppressWarnings("unused")
  @RequestMapping("naverLogin")
  public void naverCallback(HttpSession session, HttpServletRequest request, Model model)
      throws IOException, ParseException {
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode(CALLBACK, "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + CLIENT_ID;
    apiURL += "&client_secret=" + CLI_SECRET;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    // System.out.println("apiURL=" + apiURL);
    String access_token = "";
    String refresh_token = "";

    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection) url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      // System.out.print("responseCode=" + responseCode);
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
        // System.out.println(res.toString());

        Map<String, Object> parsedJson = new JSONParser(res.toString()).parseObject();
        // System.out.println(parsedJson);

        access_token = (String) parsedJson.get("access_token");
        refresh_token = (String) parsedJson.get("refresh_token");
        // System.out.println(parsedJson.get("access_token") + ", " +
        // parsedJson.get("refresh_token"));
      }

      if (access_token != null) { // access_token을 잘 받아왔다면
        String apiurl = "https://openapi.naver.com/v1/nid/me";
        String header = "Bearer " + access_token;
        url = new URL(apiurl);
        con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("Authorization", header);
        responseCode = con.getResponseCode();
        if (responseCode == 200) { // 정상 호출
          br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else { // 에러 발생
          br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        res = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
          res.append(inputLine);
        }
        br.close();
      }

      // ------회원 정보 불러오기

      Map<String, Object> parsedJson = new JSONParser(res.toString()).parseObject();
      Map<String, Object> userInfo = (Map<String, Object>) parsedJson.get("response");

      String naverCode = userInfo.get("id").toString();
      String email = userInfo.get("email").toString();
      String name = userInfo.get("name").toString();
      System.out.println(naverCode + ", " + email + ", " + name);

      Member member = memberService.findMemberByOtherProvider("naver", email);

      // 네이버-이메일 일치 고객 로그인
      if (member != null) {
        session.setAttribute("loginUser", member);

        List<Message> recentMessages = messageService.listReceivedMessage(member.getNumber(), 1, 5);
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
          newMember.setProvider("naver");
          newMember.setPassword(naverCode);
          newMember.setType(1);
          int idx = email.indexOf("@");
          newMember.setId("naver_" + email.substring(0, idx));
          newMember.setSmsYN(0);
          newMember.setEmailYN(0);
          GeneralMember newGeneralMember = new GeneralMember();
          newGeneralMember.setSeekingFlag(1);
          newGeneralMember.setMembereship("none");

          if (memberService.add(newMember, newGeneralMember) > 0) {
            member = memberService.findMemberByOtherProvider("naver", email);
            session.setAttribute("loginUser", member);
            List<Message> recentMessages =
                messageService.listReceivedMessage(member.getNumber(), 1, 5);
            for (Message m : recentMessages) {
              Member sender = memberService.get(m.getSenderNumber());
              m.setMember(sender);
            }
            session.setAttribute("recentMessages", recentMessages);

          } else {
            throw new Exception("네이버 연동 실패");
          }

          // 해당 이메일 아이디 존재 -> 연동?
        } else {
          request.setAttribute("provider_", provider);
          request.setAttribute("email_", existEmail);

        }
      }

    } catch (Exception e) {
      System.out.println(e);
    }

  }

  @PostMapping("naverLinking")
  private ModelAndView linking(String provider, String email) throws Exception {
    if (memberService.updateProvider(provider, email) > 0) {
      ModelAndView mv = new ModelAndView();
      mv.addObject("message1", "기존 계정에 네이버 계정이 연동되었습니다.");
      mv.addObject("message2", "앞으로는 네이버 계정으로 로그인 해 주세요!");
      mv.setViewName("messageView");
      return mv;
    } else {
      throw new Exception("네이버 연동 실패");
    }

  }

}
