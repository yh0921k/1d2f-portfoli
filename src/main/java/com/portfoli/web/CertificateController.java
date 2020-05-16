package com.portfoli.web;

import java.util.Locale;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.portfoli.service.CertificateService;

@Controller
@RequestMapping("certificate")
public class CertificateController {
  
  static Logger logger = LogManager.getLogger(CertificateController.class);

  public CertificateController() {
    CertificateController.logger.debug("CertificateController 객체 생성!");
  }
  
  @Autowired
  CertificateService certificateService;
  
  @RequestMapping(value = "listCert", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  @ResponseBody
  public String listCert(Locale locale, Model model) throws Exception {
    String[] certs = certificateService.list();
    System.out.println(certs);
    Gson gson = new Gson();
    return gson.toJson(certs);
  }
  

}
