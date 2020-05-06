package com.portfoli.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.portfoli.service.MemberService;

@Controller
@RequestMapping("auth")
public class NaverLoginController {

  private String CLIENT_ID = "ot_V9PT1hKadV9ukCY0L";
  private String CLI_SECRET = "Nz4UvLDJco";
  private String CALLBACK = "http://localhost:9999/portfoli/app/auth/naverLogin";

  @Autowired
  MemberService memberService;


  // 콜백 페이지 컨트롤러

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
    System.out.println("apiURL=" + apiURL);
    // https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&
    // client_id=ot_V9PT1hKadV9ukCY0L&
    // client_secret=Nz4UvLDJco&
    // redirect_uri=http%3A%2F%2Flocalhost%3A9999%2Fportfoli%2Fapp%2Fauth%2FnaverLogin&code=JaflaTye4Tn120EXBj&state=622242814364045709463103594870533505902
    String access_token = "";
    String refresh_token = "";

    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection) url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.print("responseCode=" + responseCode);
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
        System.out.println(res.toString());

        Map<String, Object> parsedJson = new JSONParser(res.toString()).parseObject();
        System.out.println(parsedJson);

        access_token = (String) parsedJson.get("access_token");
        refresh_token = (String) parsedJson.get("refresh_token");
        System.out.println(parsedJson.get("access_token") + ", " + parsedJson.get("refresh_token"));
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

      System.out.println("res.toString()=>" + res.toString());

      Map<String, Object> parsedJson = new JSONParser(res.toString()).parseObject();
      System.out.println("parsedJson=>" + parsedJson);

      Map<String, Object> userInfo = (Map<String, Object>) parsedJson.get("response");

      String naverCode = userInfo.get("id").toString();
      String email = userInfo.get("email").toString();
      String name = userInfo.get("name").toString();
      String profile_image = userInfo.get("profile_image").toString();
      System.out.println(naverCode + ", " + email + ", " + name + ", " + profile_image);

      System.out.println();
    } catch (Exception e) {
      System.out.println(e);
    }

  }



}
