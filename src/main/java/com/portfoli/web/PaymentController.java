package com.portfoli.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.portfoli.domain.JobPosting;
import com.portfoli.domain.Member;
import com.portfoli.domain.Payment;
import com.portfoli.service.JobPostingService;

@Controller
@RequestMapping("payment")
public class PaymentController {
  static Logger logger = LogManager.getLogger(PaymentController.class);

  public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
  // public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
  // public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
  // public static final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";

  public static final String KEY = "1453295861280296";
  public static final String SECRET = "OG0vl1zxv6UL2tAIETxE8tks4xgFZFpOlpjGqSeWZ8H1BiJgbgVjKfMON2uMHTA2jTJKMYGL6nMIFwYQ";

  @Autowired
  JobPostingService jobPostingService;

  public PaymentController() {
    PaymentController.logger.debug("PaymentController 객체 생성!");
  }

  /*
  private String getToken() {
    Map<String, Object> key = new HashMap<>();
    key.put("imp_key", KEY);
    key.put("imp_secret", SECRET);
    Gson gson = new Gson();
    String keyObject = gson.toJson(key);
    String result = "";
    try {
      URL url = new URL(IMPORT_TOKEN_URL);
      HttpURLConnection conn = (HttpURLConnection)url.openConnection();

      conn.setRequestMethod("POST");
      conn.setRequestProperty("Content-Type", "application/json");

      conn.setDoOutput(true);

      OutputStream out = conn.getOutputStream();
      out.write(keyObject.getBytes("utf-8"));
      out.flush();
      out.close();

      BufferedReader br = new BufferedReader(
          new InputStreamReader(conn.getInputStream(), "utf-8"));

      while(true) {
        String line = br.readLine();
        if(line==null) break;

        result +=line;
      }
      System.out.println(result);

    } catch (Exception e) {
      e.printStackTrace();
    }
    JsonObject jsonObject = gson.fromJson(result, JsonObject.class);
    System.out.println(jsonObject.get("access_token"));

    return "";
  }
   */

  @GetMapping("introduction")
  public void introduction() {}

  @GetMapping(value="jobPostingList", produces="text/plain;charset=UTF-8")
  @ResponseBody
  public String jobPostingList(HttpServletRequest request, Locale locale, Model model) throws Exception {
    Member loginUser = (Member) request.getSession().getAttribute("loginUser");
    List<JobPosting> jobPostingList = jobPostingService.myList(loginUser.getNumber());
    List<String> jobPostingTitle = new ArrayList<>();
    Gson gson = new Gson();
    for (JobPosting jobPosting : jobPostingList) {
      jobPostingTitle.add(jobPosting.getTitle());
    }

    return gson.toJson(jobPostingTitle);
  }

  @PostMapping("order")
  public void order(HttpServletRequest request,
      String title, String product, int price, int term, String startDate, String endDate, Model model) throws Exception {
    Member loginUser = (Member) request.getSession().getAttribute("loginUser");

    JobPosting jobPosting = jobPostingService.get(title);

    System.out.println(jobPosting.getMember().getName());
    System.out.println(jobPosting.getCompany().getName());

    Payment payment = new Payment();
    payment.setMemberNumber(loginUser.getNumber());
    payment.setProductName(product);
    payment.setPrice(price);

    model.addAttribute("jobPosting", jobPosting);
    model.addAttribute("order", payment);
    model.addAttribute("startDate", startDate);
    model.addAttribute("endDate", endDate);
    request.getSession().setAttribute("payment", payment);
  }

  @PostMapping("pay")
  public void pay(HttpServletRequest request, String method) throws Exception {
    Payment payment = (Payment) request.getSession().getAttribute("payment");
    payment.setMethod(method);
  }
}