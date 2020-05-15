package com.portfoli.admin;

import java.io.File;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.google.gson.Gson;
import com.portfoli.domain.Banner;
import com.portfoli.domain.Company;
import com.portfoli.service.BannerService;
import com.portfoli.service.CompanyService;

@Controller
@RequestMapping("/banner")
public class BannerController {
  static Logger logger = LogManager.getLogger(BannerController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  BannerService bannerService;

  @Autowired
  CompanyService companyService;

  @GetMapping("form")
  public void form() throws Exception {
  }

  @PostMapping("add")
  public void add(Banner banner, MultipartFile image) throws Exception {
    if (image.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/banner");
      String fileName = UUID.randomUUID().toString();
      image.transferTo(new File(dirPath + "/" + fileName));
      banner.setFilePath(fileName);
      bannerService.add(banner);
    }
  }

  @PostMapping(value="json", produces="text/plain;charset=UTF-8")
  @ResponseBody
  public String json(Locale locale, Model model, @RequestParam("term") String keyword) throws Exception {
    List<Company> companyList = companyService.searchList(keyword);
    System.out.println(companyList);

    Gson gson = new Gson();

    String jsonString = gson.toJson(companyList);

    return jsonString;
  }
}