package com.portfoli.web;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.portfoli.domain.GeneralMember;
import com.portfoli.domain.Member;
import com.portfoli.service.GeneralMemberService;

@Controller
public class GeneralMemeberController {

  static Logger logger = LogManager.getLogger(GeneralMemeberController.class);

  public GeneralMemeberController() {
    GeneralMemeberController.logger.debug("GeneralMemeberController 객체 생성!");
  }

  @Autowired
  GeneralMemberService generalMemberService;

  @RequestMapping("/generalMember/joinForm")
  public String addForm() {
    return "/generalMember/addForm.jsp";
  }

  @RequestMapping("/generalMember/join")
  public String add(Member member, GeneralMember generalMember) throws Exception {

    if (generalMemberService.add(member, generalMember) > 0) {
      return "redirect:/index.html";
    } else {
      throw new Exception("회원을 추가할 수 없습니다.");
    }

  }
}
