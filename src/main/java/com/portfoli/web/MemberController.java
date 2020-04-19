package com.portfoli.web;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.portfoli.domain.CompanyMember;
import com.portfoli.domain.GeneralMember;
import com.portfoli.domain.Member;
import com.portfoli.service.MemberService;

@Controller
public class MemberController {

  static Logger logger = LogManager.getLogger(MemberController.class);

  public MemberController() {
    MemberController.logger.debug("GeneralMemeberController 객체 생성!");
  }

  @Autowired
  MemberService memberService;

  // 일반회원

  @RequestMapping("/generalMember/join")
  public String addForm() {
    return "/generalMember/addForm.jsp";
  }

  @PostMapping("/generalMember/join")
  public String add(Member member, GeneralMember generalMember) throws Exception {

    if (memberService.add(member, generalMember) > 0) {
      return "redirect:/index.html";
    } else {
      throw new Exception("회원을 추가할 수 없습니다.");
    }
  }


  // 기업회원

  @RequestMapping("/companyMember/join")
  public String companyAddForm() {
    return "/companyMember/JoinForm.jsp";
  }

  @PostMapping("/companyMember/join")
  public String companyAdd(CompanyMember companyMember) throws Exception {

    memberService.add(companyMember);
    return "redirect:/index.html";
  }


}
