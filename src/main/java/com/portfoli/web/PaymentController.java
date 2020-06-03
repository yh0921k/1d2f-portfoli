package com.portfoli.web;

import java.io.File;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import com.google.gson.Gson;
import com.portfoli.domain.JobPosting;
import com.portfoli.domain.Member;
import com.portfoli.domain.Payment;
import com.portfoli.service.JobPostingService;
import com.portfoli.service.PaymentService;
import net.coobird.thumbnailator.ThumbnailParameter;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.name.Rename;

@Controller
@RequestMapping("payment")
public class PaymentController {
  static Logger logger = LogManager.getLogger(PaymentController.class);

  public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
  public static final String IMPORT_PAYMENT_URL = "https://api.iamport.kr/payments/{1}";
  public static final String KEY = "1453295861280296";
  public static final String SECRET = "OG0vl1zxv6UL2tAIETxE8tks4xgFZFpOlpjGqSeWZ8H1BiJgbgVjKfMON2uMHTA2jTJKMYGL6nMIFwYQ";

  @Autowired
  ServletContext servletContext;

  @Autowired
  JobPostingService jobPostingService;

  @Autowired
  PaymentService paymentService;

  public PaymentController() {
    PaymentController.logger.debug("PaymentController 객체 생성!");
  }

  @SuppressWarnings("unchecked")
  private String getToken() {
    // RestTemplate을 이용한 HTTP 통신
    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(MediaType.APPLICATION_JSON);

    Map<String, Object> key = new HashMap<>();
    key.put("imp_key", KEY);
    key.put("imp_secret", SECRET);
    Gson gson = new Gson();

    HttpEntity<String> request = new HttpEntity<String>(gson.toJson(key), headers);

    RestTemplate rt = new RestTemplate();
    Map<String, Object> result = rt.postForObject(IMPORT_TOKEN_URL, request, Map.class);
    Map<String, Object> response = (Map<String, Object>) result.get("response");

    logger.debug(response);

    return (String)response.get("access_token");

    /* 순수 자바 코드(URLConnection)를 이용한 HTTP 통신
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
      System.out.println("result : " + result);

    } catch (Exception e) {
      e.printStackTrace();
    }
    JsonObject jsonObject = gson.fromJson(result, JsonObject.class);
    System.out.println("response : " + jsonObject.get("response"));
    System.out.println("accessToken : " + jsonObject.get("response.access_token"));

    return jsonObject.get("response.access_token");
     */
  }

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
      String jobPostingTitle, String product, int price, String startDate, String endDate,
      MultipartFile image, Model model) throws Exception {
    Member loginUser = (Member) request.getSession().getAttribute("loginUser");

    Payment payment = new Payment();
    payment.setMemberNumber(loginUser.getNumber());
    payment.setProductName(product);
    payment.setPrice(price);
    payment.setJobPostingTitle(jobPostingTitle);
    payment.setStartDate(Date.valueOf(startDate.replace("/", "-")));
    payment.setEndDate(Date.valueOf(endDate.replace("/", "-")));

    JobPosting jobPosting = jobPostingService.get(jobPostingTitle);

    if (image.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/jobposting");
      String filename = UUID.randomUUID().toString();
      image.transferTo(new File(dirPath + "/" + filename));
      jobPosting.setLogo(filename);

      Thumbnails.of(dirPath + "/" + filename)
      .size(300, 70)
      .outputFormat("jpg")
      .toFiles(new Rename() {
        @Override
        public String apply(String name, ThumbnailParameter param) {
          return name + "_300x70";
        }
      });
    }

    request.getSession().setAttribute("jobPosting", jobPosting);
    request.getSession().setAttribute("payment", payment);
  }

  @SuppressWarnings({"unchecked", "rawtypes"})
  @PostMapping("complete")
  public void complete(HttpServletRequest request, String impUid, String merchantUid,
      Model model) throws Exception {
    String accessToken = getToken();

    // 액세스 토큰을 가지고 서버에서 결제 정보를 조회한다.
    HttpHeaders headers = new HttpHeaders();
    headers.add("Authorization", accessToken);

    HttpEntity entityRequest = new HttpEntity(headers);

    RestTemplate rt = new RestTemplate();

    ResponseEntity<String> result = rt.exchange(
        IMPORT_PAYMENT_URL,
        HttpMethod.GET,
        entityRequest,
        String.class,
        impUid
        );

    // 정상적인 결제가 맞다면, 주문 정보를 DB에 저장한다.
    if (result.getStatusCodeValue() == 200) {
      Map<String, Object> resultBody = new JSONParser(result.getBody()).parseObject();
      Map<String, Object> response = (Map<String, Object>) resultBody.get("response");

      Member loginUser = (Member) request.getSession().getAttribute("loginUser");
      Payment payment = (Payment) request.getSession().getAttribute("payment");
      payment.setProductName((String) response.get("name"));
      payment.setMemberNumber(loginUser.getNumber());
      payment.setPrice(Integer.parseInt(String.valueOf(response.get("amount"))));
      payment.setMethod((String) response.get("card_name") + ", " + (String) response.get("card_number"));
      payment.setComment((String) response.get("pg_tid"));
      // payment.setPayDate(new Date(Long.parseLong(String.valueOf(response.get("paid_at")))));
      payment.setPayDate(new Date(System.currentTimeMillis()));

      paymentService.add(payment, (JobPosting) request.getSession().getAttribute("jobPosting"));

      model.addAttribute("payment", payment);
    }
  }

  @GetMapping("list")
  public void list(HttpServletRequest request,
      @RequestParam(defaultValue = "1") int pageNumber,
      @RequestParam(defaultValue = "3") int pageSize,
      Model model) throws Exception {
    Member loginUser = (Member) request.getSession().getAttribute("loginUser");

    int size = paymentService.listCount(loginUser.getNumber());
    int totalPage = size / 3;
    if (size % 3 > 0) {
      totalPage++;
    }

    if (pageNumber < 1 || pageNumber > totalPage) {
      pageNumber = 1;
    }

    int endPage = (int) Math.ceil(pageNumber / (double) 5) * 5;
    int startPage = endPage - 5 + 1;

    if (endPage > totalPage) {
      endPage = totalPage;
    }

    model.addAttribute("payments", paymentService.list(loginUser.getNumber(), pageNumber, pageSize));
    model.addAttribute("pageNumber", pageNumber);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);
    model.addAttribute("startPage", startPage);
    model.addAttribute("endPage", endPage);
  }
}