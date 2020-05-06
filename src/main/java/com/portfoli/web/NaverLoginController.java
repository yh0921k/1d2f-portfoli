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
import org.springframework.web.bind.annotation.ResponseBody;
import com.portfoli.service.MemberService;

@Controller
@RequestMapping("auth")
public class NaverLoginController {

  private String CLIENT_ID = "ot_V9PT1hKadV9ukCY0L";
  private String CLI_SECRET = "Nz4UvLDJco";

  @Autowired
  MemberService memberService;


  /**
   * 콜백 페이지 컨트롤러
   *
   * @param session
   * @param request
   * @param model
   * @return
   * @throws IOException
   * @throws ParseException
   */
  @RequestMapping("naverLogin")
  public void naverCallback1(HttpSession session, HttpServletRequest request, Model model)
      throws IOException, ParseException {
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI =
        URLEncoder.encode("http://localhost:9999/portfoli/app/auth/naverLogin", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + CLIENT_ID;
    apiURL += "&client_secret=" + CLI_SECRET;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    System.out.println("apiURL=" + apiURL);
    String res = requestToServer(apiURL);
    if (res != null && !res.equals("")) {
      model.addAttribute("res", res);
      Map<String, Object> parsedJson = new JSONParser(res).parseObject();
      System.out.println(parsedJson);
      session.setAttribute("currentUser", res);
      session.setAttribute("currentAT", parsedJson.get("access_token"));
      session.setAttribute("currentRT", parsedJson.get("refresh_token"));
      System.out.println(parsedJson.get("access_token") + ", " + parsedJson.get("refresh_token"));
    } else {
      model.addAttribute("res", "Login failed!");
    }

  }

  /**
   * 토큰 갱신 요청 페이지 컨트롤러
   *
   * @param session
   * @param request
   * @param model
   * @param refreshToken
   * @return
   * @throws IOException
   * @throws ParseException
   */
  @RequestMapping("refreshToken")
  public String refreshToken(HttpSession session, HttpServletRequest request, Model model,
      String refreshToken) throws IOException, ParseException {
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=refresh_token&";
    apiURL += "client_id=" + CLIENT_ID;
    apiURL += "&client_secret=" + CLI_SECRET;
    apiURL += "&refresh_token=" + refreshToken;
    System.out.println("apiURL=" + apiURL);
    String res = requestToServer(apiURL);
    model.addAttribute("res", res);
    session.invalidate();
    return "test-naver-callback";
  }

  /**
   * 토큰 삭제 컨트롤러
   *
   * @param session
   * @param request
   * @param model
   * @param accessToken
   * @return
   * @throws IOException
   */
  @RequestMapping("deleteToken")
  public String deleteToken(HttpSession session, HttpServletRequest request, Model model,
      String accessToken) throws IOException {
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=delete&";
    apiURL += "client_id=" + CLIENT_ID;
    apiURL += "&client_secret=" + CLI_SECRET;
    apiURL += "&access_token=" + accessToken;
    apiURL += "&service_provider=NAVER";
    System.out.println("apiURL=" + apiURL);
    String res = requestToServer(apiURL);
    model.addAttribute("res", res);
    session.invalidate();
    return "test-naver-callback";
  }

  /**
   * 액세스 토큰으로 네이버에서 프로필 받기
   *
   * @param accessToken
   * @return
   * @throws IOException
   */
  @ResponseBody
  @RequestMapping("getProfile")
  public String getProfileFromNaver(String accessToken) throws IOException {
    // 네이버 로그인 접근 토큰;
    String apiURL = "https://openapi.naver.com/v1/nid/me";
    String headerStr = "Bearer " + accessToken; // Bearer 다음에 공백 추가
    String res = requestToServer(apiURL, headerStr);
    return res;
  }

  /**
   * 세션 무효화(로그아웃)
   *
   * @param session
   * @return
   */
  @RequestMapping("invalidate")
  public String invalidateSession(HttpSession session) {
    session.invalidate();
    return "redirect:/naver";
  }

  /**
   * 서버 통신 메소드
   *
   * @param apiURL
   * @return
   * @throws IOException
   */
  private String requestToServer(String apiURL) throws IOException {
    return requestToServer(apiURL, "");
  }

  /**
   * 서버 통신 메소드
   *
   * @param apiURL
   * @param headerStr
   * @return
   * @throws IOException
   */
  private String requestToServer(String apiURL, String headerStr) throws IOException {
    URL url = new URL(apiURL);
    HttpURLConnection con = (HttpURLConnection) url.openConnection();
    con.setRequestMethod("GET");
    System.out.println("header Str: " + headerStr);
    if (headerStr != null && !headerStr.equals("")) {
      con.setRequestProperty("Authorization", headerStr);
    }
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
      return res.toString();
    } else {
      return null;
    }
  }
}
