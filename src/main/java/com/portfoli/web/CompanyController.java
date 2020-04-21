package com.portfoli.web;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.portfoli.domain.Company;
import com.portfoli.service.CompanyService;

@Controller
@RequestMapping("company")
public class CompanyController {

  static Logger logger = LogManager.getLogger(CompanyController.class);

  public CompanyController() {
    CompanyController.logger.debug("CompanyController 객체 생성!");
  }

  @Autowired
  CompanyService companyService;

  // 사업자등록번호로 찾기

  @GetMapping("search")
  public void search() {}

  @PostMapping("search")
  public String search(String businessRegistrationNumber, Model model) throws Exception {

    Company company = companyService.getByBusinessRegistrationNumber(businessRegistrationNumber);

    if (company != null) {
      model.addAttribute(company);
      return "member/companyJoin";
    } else {
      model.addAttribute("businessRegistrationNumber", businessRegistrationNumber);
      return "company/add";
    }
  }


  // 기업 등록
  @GetMapping("add")
  public void add() {}

  @PostMapping("add")
  public String add(String businessRegistrationNumber, Company company) throws Exception {

    if (companyService.add(company) > 0) {
      return "member/companyJoin";
    } else {
      throw new Exception("기업 등록에 실패하였습니다.");
    }



  }

}
