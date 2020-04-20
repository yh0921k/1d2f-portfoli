package com.portfoli.web;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.portfoli.domain.Company;
import com.portfoli.domain.CompanyMember;
import com.portfoli.domain.GeneralMember;
import com.portfoli.domain.Member;
import com.portfoli.service.CompanyService;
import com.portfoli.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {

  static Logger logger = LogManager.getLogger(MemberController.class);

  public MemberController() {
    logger.debug("GeneralMemeberController 객체 생성!");
  }

  @Autowired
  MemberService memberService;

  @Autowired
  CompanyService companyService;

  // 일반회원

  @GetMapping("generalJoin")
  public void addForm() {}

  @PostMapping("generalJoin")
  public String add(Member member, GeneralMember generalMember) throws Exception {

    if (memberService.add(member, generalMember) > 0) {
      return "redirect:/index.html";
    } else {
      throw new Exception("회원을 추가할 수 없습니다.");
    }
  }


  // 기업회원

  @GetMapping("companyJoin")
  public void companyAddForm() {}

  @PostMapping("companyJoin")
  public String companyAdd(Member member, CompanyMember companyMember,
      @RequestParam("businessRegistrationNumber") String businessRegistrationNumber)
      throws Exception {

    Company company = companyService.getByBusinessRegistrationNumber(businessRegistrationNumber);
    if (memberService.add(member, companyMember, company.getNumber()) > 0) {
      return "redirect:/index.html";
    } else {
      throw new Exception("회원을 추가할 수 없습니다.");
    }
  }


}
